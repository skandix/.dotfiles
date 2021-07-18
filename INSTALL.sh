#!/usr/bin/env sh

list_pkgs(){
    #cat ./pkgs/$1
    echo "$(cat ./pkgs/$1)"
}

TheOrville(){
    a+=list_pkgs docker
    a+=list_pkgs fonts
    printf '%b\n' "$a"

}

TheOrville