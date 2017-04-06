-- Personal Keys --
awful.key({}, "XF86AudioLowerVolume", function () awful.util.spawn("amixer -D pulse sset Master 5%-") end),
awful.key({}, "XF86AudioRaiseVolume", function () awful.util.spawn("amixer -D pulse sset Master 5%+") end),

-- awful.key({}, "XF86AudioPlay", function () awful.util.spawn("rhythmbox-client --play", false) end),
awful.key({}, "XF86AudioStop", function () awful.util.spawn("amixer -D pulse set Master 1+ toggle", false) end),

-- awful.key({}, "XF86Back", function () awful.util.spawn("rhythmbox-client --previous") end),    
-- awful.key({}, "XF86Forward", function () awful.util.spawn("rhythmbox-client --next") end),

awful.key({ modkey,            }, "r", function () awful.util.spawn("rofi -show run") end),
awful.key({ modkey,            }, "d", function () awful.util.spawn("rofi -show window") end),    
