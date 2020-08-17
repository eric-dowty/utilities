#!/usr/bin/env bash

USAGE=$(cat <<-END

    USAGE

        $0 <command> <options>*

    DESCRIPTION

        Description of the CLI

    EXAMPLES

        An example of running the cli:

            cli.sh cmd --option

    COMMANDS

        cmd         Description of a command

        cmd-var     Description of a command; expects a value

        help        Show usage instructions

    OPTIONS

        --quiet     (-q)     Suppress STDOUT

        --option    (-o)     Description of an option; expects a value

END
)

# Initialize Variables #################################################################################################

SCRIPT_PATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

QUIET="false"

# Helper Commands ######################################################################################################

print() {
	if [[ $QUIET = "false" ]]; then
		echo $1
	fi
}

# Local Commands #######################################################################################################

command-help() {
	echo "$USAGE" | more
	echo ""
	exit
}

# Process Arguments ####################################################################################################

while [[ "$1" != "" ]]; do
	case "$1" in

		# Commands
		cmd)			COMMAND="cmd";;
		cmd-var)		COMMAND="cmd-with-val"; shift; CMD_VAR=$1;;
		help)			COMMAND="help";;

		# Options
		--quiet|-q)		QUIET="true";;
		--option|-o)	shift; OPTION_VAR=$1;;

		*) on-unknown-argument $1;;
	esac
	shift
done

# Script ###############################################################################################################

"command-${COMMAND}"
