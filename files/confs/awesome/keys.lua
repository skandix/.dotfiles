local awful = require("awful")

-- Rofi
awful.key({ modkey,           }, "r", function () awful.util.spawn("rofi -show run") end)

-- screenshot solution
awful.key({ modkey,            }, "p", function () awful.util.spawn("kbsecretSauce") end)

-- Laptopt Specific
awful.key({}, "XF86MonBrightnessUp", function () awful.util.spawn("xbacklight -inc 5 -fps 120",false) end)
awful.key({}, "XF86MonBrightnessDown", function () awful.util.spawn("xbacklight -dec 5 -fps 120",false) end)

-- Mediakeys
awful.key({}, "XF86AudioPrev", function () awful.util.spawn("dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous", false) end)
awful.key({}, "XF86AudioPlay", function () awful.util.spawn("dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause", false) end)
awful.key({}, "XF86AudioNext", function () awful.util.spawn("dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next", false) end)

awful.key({}, "XF86AudioLowerVolume", function () awful.util.spawn("pactl set-sink-volume @DEFAULT_SINK@ -5%") end)
awful.key({}, "XF86AudioRaiseVolume", function () awful.util.spawn("pactl set-sink-volume @DEFAULT_SINK@ +5%") end)

awful.key({}, "XF86AudioStop", function () awful.util.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle", false) end) -- for coolermaster Masterkeys Pro S keyboard
awful.key({}, "XF86AudioMute", function () awful.util.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle", false) end)

-- No mediakeys, but it has a numpad :thinking:
awful.key({}, "KP_Subtract", function () awful.util.spawn("pactl set-sink-volume @DEFAULT_SINK@ -5%") end)
awful.key({}, "KP_Add", function () awful.util.spawn("pactl set-sink-volume @DEFAULT_SINK@ +5%") end)

awful.key({}, "KP_Left", function () awful.util.spawn("dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous", false) end)
awful.key({}, "KP_Begin", function () awful.util.spawn("dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause", false) end)
awful.key({}, "KP_Right", function () awful.util.spawn("dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next", false) end)

awful.key({}, "KP_Enter", function () awful.util.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle", false) end)


