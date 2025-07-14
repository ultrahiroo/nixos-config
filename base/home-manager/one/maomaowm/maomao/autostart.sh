# see autostart.sh
# Note: here no need to add shebang
set +e

# obs
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=wlroots
xdg-desktop-portal-wlr &

# notify
swaync &

# night light
# wlsunset -T 3501 -t 3500 &

# keep clipboard content
wl-clip-persist --clipboard regular --reconnect-tries 0 &

# clipboard content manager
wl-paste --type text --watch cliphist store & 

# xwayland dpi scale
echo "Xft.dpi: 140" | xrdb -merge #dpi缩放
gsettings set org.gnome.desktop.interface text-scaling-factor 1.4

# Permission authentication
# /usr/lib/xfce-polkit/xfce-polkit &

fcitx5 &
