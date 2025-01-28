#!/usr/bin/env bash
#
# This is a part of CLSU Biotechnology and Analytical Laboratory
# website along with the BaCaDM Database associated with it.
#
# Copyright (C) 2025 James Aaron Erang <iaacornus.devel@gmail.com>
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 3 of the licence, or (at your option) any later version.
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this library; if not, see <http://www.gnu.org/licenses/>.
#
# Author: James Aaron Erang <iaacornus.devel@gmail.com>
#

FAIL="\e[1;31mFAIL:\e[0m"
INVALID="\e[1;31mINVALID:\e[0m"
SUCCESS="\e[1;32mSUCCESS:\e[0m"
INFO="\e[1;34mINFO:\e[0m"

function fail() {
    echo -e "$FAIL Project setup failed."
    exit 1
}

function setup_success () {
    echo -e "$SUCCESS Installation successfully finished."
    exit 0
}

function check_requirements () {
    utils=(             \
        "python"        \
        "pip3"          \
        "git"           \
    )

    echo "Checking requirements ..."
    for _util in ${utils[@]}; do
        if [[ $_util == p\_* ]]; then
            echo -e "checking python library: $_util ..."
            if [ python -c "import $_util" &> /dev/null ]; then
                echo -e "\e[32mInstalled: $_util ...\e[0m"
            else
                echo -e "\e[31m$_util not installed ...\e[0m"
                not_installed+=("$_util")
            fi
        else
            echo -e "checking package: $_util ..."
            if [[ -x "$(command -v $_util)" ]]; then
                echo -e "\e[32mFound $_util in \$PATH ...\e[0m"
            else
                echo -e "\e[31m$_util not in \$PATH ...\e[0m"
                not_installed+=("$_util")
            fi
        fi
    done

    echo -e "=> the following packages are not installed:"
    for _ni in ${not_installed[@]}; do
        echo -e "==> $_ni"
    done
    echo -e "$INFO Checked all the libraries and packages."
}
