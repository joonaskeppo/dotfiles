#!/bin/bash

ID=`xinput | grep -i DeathAdder | awk -F = '{print $2}' | awk '{print $1}'`
xinput --set-prop $ID "Device Accel Constant Deceleration" 4
xinput --set-prop $ID "Device Accel Velocity Scaling" 1
