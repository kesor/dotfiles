#!/bin/sh
plugin() {
    name=$1
    target=$2
    if [ -n "${target}" ] && [ -d  "${target}/.git" ]; then
        printf "%s - %s\n" "${name}" "$(cd "${target}" || exit ; git pull)"
    elif [ -n "${name}" ] && [ -d "${name##*/}/.git" ]; then
        printf "%s - %s\n" "${name}" "$(cd "${name##*/}" || exit ; git pull)"
    elif [ -n "${target}" ]; then
        git clone "https://github.com/${name}.git" "${target}"
    else
        git clone "https://github.com/${name}.git"
    fi
}

plugin tmux-plugins/tmux-sensible
plugin tmux-plugins/tmux-open
# plugin tmux-plugins/tmux-pain-control -- messes with the -/+ bindings :(
plugin tmux-plugins/tmux-sidebar
plugin tmux-plugins/tmux-yank
plugin catppuccin/tmux catppuccin
