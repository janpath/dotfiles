#!/bin/sh

cd `dirname $0`
xkbcomp -I. keymap.xkb $DISPLAY
