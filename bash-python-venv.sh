#!/bin/bash

## bash-venv-python - venv functions for Python3 to create a virtual environment
#                     to manage Python packages for different projects
#
## Author: Vitalii Tereshchuk (https://dotoca.net)
#
## General Usage:
#    venv [install|create|activate|deactivate]
#        install    - install virtualenv using pip
#        create     - create virtual environment
#        activate   - before start installing or using packages in virtual environment need to activate it
#        deactivate - deactivate virtual environment
#
SAVEIFS=$IFS
IFS="$(printf '\n\t')"

venv() {
    if [ -z "$1" ]; then
        # display usage if no parameters given
        echo "* Virtual Environment Manager for >=Python3 *"
        echo
        echo "Usage: venv [install|create|activate|deactivate]"
        echo "            install    - install virtualenv using pip"
        echo "            create     - create virtual environment"
        echo "            activate   - before start installing or using packages in virtual environment need to activate it"
        echo "            deactivate - deactivate virtual environment "
        echo
    else
        case "$1" in
            install)     python3 -m pip install --user virtualenv;;
            create)      python3 -m venv env;;
            activate)    source env/bin/activate
                         which python;;
            deactivate)  deactivate;;
            *)
                         echo "venv: '$1' - unknown method"
                         exit 1
                         ;;
        esac
    fi
}

IFS=$SAVEIFS