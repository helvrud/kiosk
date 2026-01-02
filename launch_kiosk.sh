#!/bin/bash
# Tell the script which screen to use
export DISPLAY=:0
export XAUTHORITY=/home/kvint/.Xauthority

# 1. Kill any existing Chromium windows to avoid "double windows"
pkill -f chromium

# 2. Wait a moment to ensure it's closed
sleep 10

# 3. Launch Chromium with your specific settings
chromium --noerrdialogs --disable-infobars --incognito --start-fullscreen \
    --app=https://physchem.cz/youtube_videos/ \
    --ignore-gpu-blocklist \
    --enable-gpu-rasterization \
    --enable-zero-copy &

# Open the crontab editor:
# crontab -e
# Scroll to the very bottom and add this line:
# 0 0 * * * /home/kvint/launch_kiosk.sh
