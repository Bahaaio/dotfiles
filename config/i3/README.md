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

> [!NOTE]
> After installation, restart audio services or reboot
