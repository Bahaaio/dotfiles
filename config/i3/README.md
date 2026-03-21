# Installation

## i3-wm

Lightweight tiling window manager with screen locking utilities.

```bash
sudo apt install -y i3-wm i3lock xss-lock
```

## PipeWire

Modern low-latency audio system that replaces PulseAudio/ALSA.

```sh
sudo apt install -y pipewire pipewire-audio pipewire-pulse pipewire-alsa
```

## Controls

Media playback, brightness, and audio control utilities.

```sh
sudo apt install -y playerctl brightnessctl pavucontrol
```

## Components

Status bar, compositor, wallpaper manager, screenshot tool,
notifications, file manager, blue light filter, rofi launcher , and btop.

```sh
sudo apt install -y polybar picom feh flameshot dunst \
    nautilus redshift-gtk btop rofi btop xsensors
```

## prayer-times

Islamic prayer times for polybar and desktop notifications.

```bash
mkdir -p ~/github && pushd ~/github
git clone https://github.com/0xzer0x/prayer-times
./install.sh
popd
```

## Font

Monospace font with programming ligatures and icon support

```sh
~/.local/bin/install-jetbrains-mono.sh
```

---

## Keybindings

### Window Management

| Key                               | Action                   |
| --------------------------------- | ------------------------ |
| `Super + h/j/k/l`                 | Focus left/down/up/right |
| `Super + Shift + h/j/k/l`         | Move left/down/up/right  |
| `Super + Alt + h`                 | Split horizontal         |
| `Super + Alt + v`                 | Split vertical           |
| `Super + f`                       | Toggle fullscreen        |
| `Super + t`                       | Toggle Tabbed layout     |
| `Super + s`                       | Toggle split layout      |
| `Super + Shift + Space`           | Toggle floating          |
| `Super + Space`                   | Focus tiling/floating    |
| `Super + a`                       | Focus parent             |
| `Super + c` / `Super + Shift + a` | Focus child              |
| `Super + r`                       | Enter resize mode        |

### Workspaces

| Key                   | Action                        |
| --------------------- | ----------------------------- |
| `Super + 1-0`         | Switch to workspace 1-10      |
| `Super + Shift + 1-0` | Move window to workspace 1-10 |

### System

| Key                 | Action           |
| ------------------- | ---------------- |
| `Super + Shift + c` | Reload config    |
| `Super + Shift + r` | Restart i3       |
| `Super + Shift + q` | Exit i3          |
| `Super + p`         | Reload polybar   |
| `Super + w`         | Change wallpaper |

### Applications

| Key              | Action                        |
| ---------------- | ----------------------------- |
| `Super + Return` | Open wezterm with tmux        |
| `Super + q`      | Kill focused window           |
| `Super + e`      | Open file explorer            |
| `Super + x`      | Open rofi powermenu           |
| `Super + b`      | Show/hide btop scratchpad     |
| `Super + o`      | Show/hide scratchpad terminal |

### Hardware Controls

| Key                             | Action                |
| ------------------------------- | --------------------- |
| `Print`                         | Full screenshot       |
| `Shift + Print`                 | Screenshot selection  |
| `XF86TouchpadToggle`            | Toggle touchpad       |
| `XF86AudioPlay/Pause`           | Play/Pause media      |
| `XF86AudioNext`                 | Next track            |
| `XF86AudioPrev`                 | Previous track        |
| `XF86AudioRaiseVolume`          | Volume up (+5%)       |
| `XF86AudioLowerVolume`          | Volume down (-5%)     |
| `XF86AudioMute`                 | Toggle mute           |
| `XF86AudioMicMute`              | Toggle microphone     |
| `XF86MonBrightnessUp`           | Brightness up (+2%)   |
| `Shift + XF86MonBrightnessUp`   | 50% brightness        |
| `XF86MonBrightnessDown`         | Brightness down (-2%) |
| `Shift + XF86MonBrightnessDown` | 0% brightness         |

### Resize Mode

| Key                           | Action           |
| ----------------------------- | ---------------- |
| `h`                           | Grow width       |
| `j`                           | Shrink height    |
| `k`                           | Grow height      |
| `l`                           | Shrink width     |
| `Enter` / `Esc` / `Super + r` | Exit resize mode |

---

> [!NOTE]
> After installation, restart audio services or reboot
