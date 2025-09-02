# WezTerm Configuration

A clean and minimal WezTerm configuration with custom theme and font settings.

## Installation

### 1. Install WezTerm

```bash
# Add WezTerm repository
curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /usr/share/keyrings/wezterm-fury.gpg
echo 'deb [signed-by=/usr/share/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
sudo chmod 644 /usr/share/keyrings/wezterm-fury.gpg

# Install WezTerm
sudo apt update && sudo apt install wezterm
```

[Official Installation Guide](https://wezfurlong.org/wezterm/install/linux.html)

### 2. Install JetBrainsMono Nerd Font

```bash
~/.local/bin/install-jetbrains-mono.sh
```
