#/bin/sh
set +e

# obs
# dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=wlroots

# notify
# swaync &

# night light
# wlsunset -T 3501 -t 3500 &

# keep clipboard content
wl-clip-persist --clipboard regular --reconnect-tries 0 &

# clipboard content manager
wl-paste --type text --watch cliphist store &

# xwayland dpi scale
# echo "Xft.dpi: 140" | xrdb -merge
# gsettings set org.gnome.desktop.interface text-scaling-factor 1.4

# Permission authentication
# /usr/lib/xfce-polkit/xfce-polkit &

fcitx5 &

waybar -c ~/.config/niri/waybar/config -s ~/.config/niri/waybar/style.css &

swaybg -i ~/.config/niri/wallpaper/wallpaper.jpg &
