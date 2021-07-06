#!/bin/sh

# output colors
RED="\033[91m"
YELLOW="\033[93m"
GREEN="\033[32m"
BLUE="\033[96m"
BOLD="\033[1m"
NORMAL="\033[m"

# $1 = color OR exit code
# $2 = message
# Set color and output message, exit gracefully if required
write_out() {
    case $1 in
        # default message, normal output
        -1) echo "$2" 1>&1
            ;;

        # red output
        [Rr]) echo "${BOLD}${RED}$2${NORMAL}" 1>&1
            ;;

        # yellow output
        [Yy]) echo "${BOLD}${YELLOW}$2${NORMAL}" 1>&1
            ;;

        # green output
        [Gg]) echo "${BOLD}${GREEN}$2${NORMAL}" 1>&1   
            ;;
        
        # green output
        [Bb]) echo "${BOLD}${BLUE}$2${NORMAL}" 1>&1   
            ;;

        # safe exit, green output
        0) echo "${BOLD}${GREEN}$2${NORMAL}" 1>&1
            # TODO: set up exit function
            exit 0
            ;;

        # exit on error, red output
        *) echo "${BOLD}${RED}exit $1: $2${NORMAL}" 1>&1
            # TODO: set up exit function
            exit "${1}"
            ;;
    esac
}

# TODO: check if 1>&1 is necessary or not
# TODO: check if 1>&2 is better for errors
