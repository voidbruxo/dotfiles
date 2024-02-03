######      import modules
from libqtile import bar, layout, widget, hook, qtile
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from os.path import expanduser
from subprocess import Popen

if qtile.core.name == "x11":
    term = "urxvt"
elif qtile.core.name == "wayland":
    term = "foot"

mod = "mod4"
modx = "mod1"
terminal = "alacritty"

#########     startup options
@hook.subscribe.startup_once
def startup():
    Popen(expanduser("~/.config/qtile/startup.sh"))

##########    keybindings
keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([modx], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"],"Return",lazy.layout.toggle_split(),desc="Toggle between split and unsplit sides of stack",),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "g", lazy.spawn("rofi -show drun"), desc="Run Rofi drun"),
    Key([modx],"m",lazy.spawn("rofi -show emoji"),desc="run rofi emoji"),
    Key([mod], "e", lazy.spawn("emacs"), desc="launch emacs"),
    Key([mod],"y",lazy.spawn("thunar"),desc="my file manager"),
    Key([mod],"l",lazy.spawn("kitty"),desc="kitty terminal"),
    Key([mod],"f", lazy.spawn("firefox"),desc="launch firefox"),
    Key([modx],"Pause",lazy.spawn("slock"),desc="screen locker"),
    Key([modx],"End",lazy.spawn("loginctl suspend"),desc="suspend system"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod,"Shift"], "c", lazy.window.kill(), desc="Kill focused window"),
    Key([modx],"f",lazy.window.toggle_fullscreen(),desc="Toggle fullscreen on the focused window",),
    Key([mod], "t", lazy.window.toggle_floating(), desc="Toggle floating on the focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([modx, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    Key([], "Print", lazy.spawn("/home/geek/.config/screenshot.sh")),
    
    #### Volume control with pactl (PulseAudio)
    Key([], "XF86AudioRaiseVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ +5%")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ -5%")),
    Key([], "XF86AudioMute", lazy.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle")),
    ###brightnessctl
    Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +10%")),
    Key([mod], "space",  lazy.widget["keyboardlayout"].next_keyboard()),
    Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 10%-")),
    
]

groups = []
group_names = ["1", "2", "3", "4", "5", "6", "7", "8", "9",]
group_labels = ["", "", "", "", "", "", "", "", "",]
group_layouts = ["bsp", "bsp", "bsp", "bsp", "bsp", "bsp", "bsp", "bsp", "Max"]
for i in range(len(group_names)):
    groups.append(
        Group(
            name=group_names[i],
            layout=group_layouts[i].lower(),
            label=group_labels[i],
        ))
 
for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
                ),
            # mod1 + shift + letter of group = move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=False),
                desc="Move focused window to group {}".format(i.name),
                ),
        ]
                )


for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
              )

layouts = [
    layout.Columns(border_width=0,margin=4),
    layout.Max(border_width=0,margin=4),
    # Try more layouts by unleashing below layouts.
    #layout.Stack(num_stacks=2),
     layout.Bsp(border_width=0,margin=4),
    #layout.Matrix(),
    #layout.MonadTall(),
     layout.MonadWide(border_width=0,margin=4),
     layout.RatioTile(border_width=0,margin=4),
     layout.Tile(border_width=0,margin=4),
    ##layout.TreeTab(border_width=0,margin=4),
     layout.VerticalTile(border_width=0,margin=4),
    #layout.Zoomy(),
]

widget_defaults = dict(
    font="JetBrainsMono Nerd Font",
    fontsize=14,
    padding=2,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.CurrentLayout(background="#af3a03"),
                widget.GroupBox(disable_drag=True,background='#79740e'),
                widget.Prompt(),
                widget.WindowName(),
                #widget.Chord(chords_colors={"launch": ("#ff0000", "#ffffff"),},name_transform=lambda name: name.upper(),),
                # NB Systray is incompatible with Wayland, consider using StatusNotifier instead
                # widget.StatusNotifier(),
                widget.Clock(fmt="󱑇 {}",format="%Y-%m-%d %a %I:%M %p",background="#8f3f71"),
                widget.KeyboardLayout(configured_keyboards=['us','ir'],background="#076678",fmt=' {}'),
                widget.CPU(fmt=" {}",format='{load_percent}%',padding=5,background="#427b58"),
                widget.Memory(format='{MemUsed:.2f}/{MemTotal:.2f}',fmt=" {}",measure_mem='G',background="#9d0006"),
                widget.Battery(format="  {percent:2.0%}",show_short_text=False,low_percentage=0.2,background="#b57614"),
                widget.PulseVolume(volume_down_command = "pactl set-sink-volume @DEFAULT_SINK@ -5%", volume_up_command = "pactl set-sink-volume @DEFAULT_SINK@ +5%", fmt = ' {}',background="#af3a03"),
                widget.Systray(),
            ],
            24,
            background="#3c3836",
        ),
        wallpaper = '/home/geek/Pictures/wall/fall-jp.png',
        wallpaper_mode = "fill",
    ),
]



############ Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = False
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXXGasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
