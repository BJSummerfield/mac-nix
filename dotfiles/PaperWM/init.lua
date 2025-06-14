PaperWM = hs.loadSpoon("PaperWM")
PaperWM:bindHotkeys({
    -- switch to a new focused window in tiled grid
    focus_left  = {"alt", "left"},
    focus_right = {"alt", "right"},
    focus_up    = {"alt", "up"},
    focus_down  = {"alt", "down"},

    -- switch windows by cycling forward/backward
    -- (forward = down or right, backward = up or left)
    -- focus_prev = {{"alt", "cmd"}, "k"},
    -- focus_next = {{"alt", "cmd"}, "j"},

    -- move windows around in tiled grid
    swap_left  = {{"alt", "shift"}, "left"},
    swap_right = {{"alt", "shift"}, "right"},
    -- swap_up    = {{"alt", "cmd", "shift"}, "up"},
    -- swap_down  = {{"alt", "cmd", "shift"}, "down"},

    -- alternative: swap entire columns, rather than
    -- individual windows (to be used instead of
    -- swap_left / swap_right bindings)
    -- swap_column_left = {{"alt", "cmd", "shift"}, "left"},
    -- swap_column_right = {{"alt", "cmd", "shift"}, "right"},

    -- position and resize focused window
    center_window        = {"alt", "c"},
    full_width           = {"alt", "f"},
    cycle_width          = {"alt", "r"},
    reverse_cycle_width  = {{"shift", "alt"}, "r"},
    -- cycle_height         = {{"alt", "cmd", "shift"}, "r"},
    -- reverse_cycle_height = {{"ctrl", "alt", "cmd", "shift"}, "r"},

    -- increase/decrease width
    increase_width = {"alt", "l"},
    decrease_width = {"alt", "h"},

    -- move focused window into / out of a column
    slurp_in = {{"alt", "cmd"}, "i"},
    barf_out = {{"alt", "cmd"}, "o"},

    -- move the focused window into / out of the tiling layer
    toggle_floating = {{"alt", "cmd", "shift"}, "escape"},

    -- focus the first / second / etc window in the current space
    -- focus_window_1 = {{"cmd", "shift"}, "1"},
    -- focus_window_2 = {{"cmd", "shift"}, "2"},
    -- focus_window_3 = {{"cmd", "shift"}, "3"},
    -- focus_window_4 = {{"cmd", "shift"}, "4"},
    -- focus_window_5 = {{"cmd", "shift"}, "5"},
    -- focus_window_6 = {{"cmd", "shift"}, "6"},
    -- focus_window_7 = {{"cmd", "shift"}, "7"},
    -- focus_window_8 = {{"cmd", "shift"}, "8"},
    -- focus_window_9 = {{"cmd", "shift"}, "9"},

    -- switch to a new Mission Control space
    -- switch_space_l = {{"alt", "cmd"}, ","},
    -- switch_space_r = {{"alt", "cmd"}, "."},
    switch_space_1 = {"alt", "1"},
    switch_space_2 = {"alt", "2"},
    switch_space_3 = {"alt", "3"},
    switch_space_4 = {"alt", "4"},
    switch_space_5 = {"alt", "5"},
    switch_space_6 = {"alt", "6"},
    switch_space_7 = {"alt", "7"},
    switch_space_8 = {"alt", "8"},
    switch_space_9 = {"alt", "9"},

    -- move focused window to a new space and tile
    move_window_1 = {{"alt", "shift"}, "1"},
    move_window_2 = {{"alt", "shift"}, "2"},
    move_window_3 = {{"alt", "shift"}, "3"},
    move_window_4 = {{"alt", "shift"}, "4"},
    move_window_5 = {{"alt", "shift"}, "5"},
    move_window_6 = {{"alt", "shift"}, "6"},
    move_window_7 = {{"alt", "shift"}, "7"},
    move_window_8 = {{"alt", "shift"}, "8"},
    move_window_9 = {{"alt", "shift"}, "9"}
})
PaperWM:start()
