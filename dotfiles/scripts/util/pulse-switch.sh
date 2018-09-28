#!/bin/bash

USER_NAME="pietro"
USER_ID=$(id -u "$USER_NAME")
HDMI_STATUS=$(</sys/class/drm/card0/card0-HDMI-A-1/status)

export PULSE_SERVER="unix:/run/user/"$USER_ID"/pulse/native"

RAW_INPUTS="$(sudo -u "$USER_NAME" pactl --server "$PULSE_SERVER" list sink-inputs short)"

INPUTS=($(echo "$RAW_INPUTS" | awk '{print $1}'))

if [[ $HDMI_STATUS == connected ]]
then
   for i in ${INPUTS[@]}; do
      sudo -u "$USER_NAME" pactl --server "$PULSE_SERVER" move-sink-input $i alsa_output.pci-0000_00_03.0.hdmi-surround-extra1
   done
      sudo -u "$USER_NAME" pactl --server "$PULSE_SERVER" set-default-sink alsa_output.pci-0000_00_03.0.hdmi-surround-extra1
else
   for i in ${INPUTS[@]}; do
      sudo -u "$USER_NAME" pactl --server "$PULSE_SERVER" move-sink-input $i alsa_output.pci-0000_00_1b.0.analog-stereo
   done
      sudo -u "$USER_NAME" pactl --server "$PULSE_SERVER" set-default-sink alsa_output.pci-0000_00_1b.0.analog-stereo
fi
