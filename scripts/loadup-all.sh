#!/bin/sh

export MEDLEYDIR=`pwd`

if [ ! -f run-medley ] ; then
    echo run from MEDLEYDIR
    exit 1
fi

./scripts/loadup-init.sh && ./scripts/loadup-lisp-from-init.sh && ./scripts/loadup-full.sh

echo tada!