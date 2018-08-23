#!/bin/bash
#

CONTAINER_IMG_NAME="ansible_playground"
CONTAINER_INSTANCE_NAME="ansible_test"
DOCKER="docker"
VAGRANT="vagrant"
VAGRANT_INSTANCES=( $(grep 'config.vm.define' Vagrantfile  | grep -oP '"\K[^"\047]+(?=["\047])') )
ANSIBLE="ansible"

usage() {
    echo $"Usage: $0 {start|stop|restart|test|status|setup|upgrade|destroy} [vm-name] -  container operation"
    echo $"Usage: $0 {ssh} (vm-name) -  container operation"
    echo $"Usage: $0 {ls.vms} -  container operation"
    exit 1
}


case "$1" in
	start)
		$VAGRANT up $2
		;;
	stop)
		$VAGRANT halt $2
		;;
	restart)
		$VAGRANT reload $2
		;;
	test)
		$VAGRANT provision $2
		;;
	status)
		$VAGRANT status $2
		;;
	setup)
		$ANSIBLE -m setup  --inventory-file=.vagrant/provisioners/ansible/inventory $2
		;;
	ssh)
		#TODO: force to check vm-name, else print usage
		$VAGRANT ssh $2
		;;
	upgrade)
		$VAGRANT box update $2
		;;
	destroy)
		$VAGRANT destroy $2
		;;
	ls.vms)
		echo 'Available Vagrant VMs:'
		echo "${VAGRANT_INSTANCES[@]}	"
		;;
	*) 
	        usage
	        ;;
esac

