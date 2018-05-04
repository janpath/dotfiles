#!/bin/sh

INTERNAL_KEYBOARD="1:1:AT_Translated_Set_2_keyboard"

# Disable internal keyboard on startup if usb keyboard is plugged in
swaymsg -t get_inputs | grep "USB_Keyb" >/dev/null &&
  swaymsg input "$INTERNAL_KEYBOARD" events disabled >/dev/null

# Listen for keyboard being plugged in and out
trap "swaymsg input '$INTERNAL_KEYBOARD' events disabled >/dev/null; echo disable" USR1
trap "swaymsg input '$INTERNAL_KEYBOARD' events enabled >/dev/null; echo enable" USR2
sleep inf &
while :; do
    wait
done
