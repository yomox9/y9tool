#!/bin/sh -eu

#auto git
set +e
b pushd ~/dotfiles ; sleep 1 && b gitpush.sh; sleep 1
b pushd ~/y9tool   ; sleep 1 && b gitpush.sh; sleep 1