#!/bin/bash
#

ANS_ARGS=""

usage() {
    echo $"Usage: $0 {play|try} {playbook-path} - ansible operation"
    exit 1
}

_set_verbose() {
	ANS_ARGS="$ANS_ARGS -vv"
}

ansible_play() {
	local PLAYBOOK_PATH=$1
	local ANS_EXEC="ansible-playbook"

	ANS_ARGS="$ANS_ARGS -k -b --ask-su-pass"

	_set_verbose
	ANS_ARGS="${PLAYBOOK_PATH} $ANS_ARGS"

	echo "Exec... '${ANS_EXEC} ${ANS_ARGS}'"
	${ANS_EXEC} ${ANS_ARGS}
}

ansible_try() {
	local PLAYBOOK_PATH=$1
	local ANS_EXEC="ansible-playbook"

	ANS_ARGS="$ANS_ARGS -i localhost"

	ANS_ARGS="$ANS_ARGS -C -k -b --ask-su-pass"
	_set_verbose
	ANS_ARGS="${PLAYBOOK_PATH} $ANS_ARGS"

	echo "Exec... '${ANS_EXEC} ${ANS_ARGS}'"
	${ANS_EXEC} ${ANS_ARGS}
}



case "$1" in
	play)
		ansible_play $2
		;;
	try)
	        ansible_try $2
	        ;;
	*)  
	        usage
	        ;;
esac

