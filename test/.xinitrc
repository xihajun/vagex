#!/usr/bin/env bash

echo "$(date) :-: $1" >> ~/started

errfile="$HOME/.xsession-errors"
if [ -z "$HOSTNAME" ]; then
    errfile="$HOME/.xsession-errors"
else
    errfile="$HOME/.xsession-errors-$HOSTNAME"
fi
exec $1
