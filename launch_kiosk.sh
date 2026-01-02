#!/bin/bash
# Tell the script which screen to use
#export DISPLAY=:0
#export XAUTHORITY=/home/kvint/.Xauthority
export WAYLAND_DISPLAY=wayland-0 
export XDG_RUNTIME_DIR=/run/user/1000 

# 1. Kill any existing Chromium windows to avoid "double windows"
pkill -f chromium

# 2. Wait a moment to ensure it's closed
sleep 3

# 3. Launch Chromium with your specific settings
chromium --noerrdialogs --disable-infobars --incognito --start-fullscreen \
    --app=https://physchem.cz/youtube_videos/ \
    --ozone-platform=wayland \
    --ignore-gpu-blocklist \
    --enable-gpu-rasterization \
    --enable-zero-copy \
    --enable-features=VaapiVideoDecoder &

# This is needed to let the window manager to hide the mouse pointer (just a one pixel move of the pointer there and back)
wlrctl pointer move 1 10; wlrctl pointer move -1 -10
# Open the crontab editor:
# crontab -e
# Scroll to the very bottom and add this line:
# 0 0 * * * /home/kvint/launch_kiosk.sh
