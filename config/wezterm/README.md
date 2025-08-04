<h2 align="center">My WezTerm Config</h2>

![screenshot](./.github/screenshots/wezterm.gif)

---

### Getting Started

- ##### Requirements

  - <details>
      <summary><b>WezTerm</b></summary>

    [Official Installation Page](https://wezfurlong.org/wezterm/install/linux.html)

    </details>

  - <details>
    <summary>JetBrainsMono Nerd Font</summary>

    ```sh
    # download the latest JetBrainsMono Nerd Font
    wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip

    # create local fonts directory if it doesn't exist
    mkdir -p ~/.local/share/fonts

    # extract into the fonts directory
    unzip JetBrainsMono.zip -d ~/.local/share/fonts/JetBrainsMono

    # remove the archive
    rm JetBrainsMono.zip

    # update the font cache
    fc-cache -fv

    ```

    </details/>

---

### All Key Bindings

Most of the key bindings revolve around a <kbd>SUPER</kbd> and <kbd>SUPER_REV</kbd>(super reversed) keys.<br>

- <kbd>SUPER</kbd> ⇨ <kbd>Alt</kbd>
- <kbd>SUPER_REV</kbd> ⇨ <kbd>Alt</kbd>+<kbd>Ctrl</kbd>
- <kbd>LEADER</kbd> ⇨ <kbd>SUPER_REV</kbd>+<kbd>Space</kbd>

#### Miscellaneous/Useful

| Keys                              | Action             |
| --------------------------------- | ------------------ |
| <kbd>F11</kbd>                    | `ToggleFullScreen` |
| <kbd>F12</kbd>                    | `ShowDebugOverlay` |
| <kbd>SUPER</kbd>+<kbd>v</kbd>     | `ActivateCopyMode` |
| <kbd>SUPER</kbd>+<kbd>f</kbd>     | Search Text        |
| <kbd>SUPER_REV</kbd>+<kbd>u</kbd> | Open URL           |

&nbsp;

#### Copy+Paste

| Keys                                          | Action               |
| --------------------------------------------- | -------------------- |
| <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>c</kbd> | Copy to Clipboard    |
| <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>v</kbd> | Paste from Clipboard |

&nbsp;

#### Tabs

##### Tabs: Spawn+Close

| Keys                          | Action            |
| ----------------------------- | ----------------- |
| <kbd>SUPER</kbd>+<kbd>n</kbd> | `SpawnTab`        |
| <kbd>SUPER</kbd>+<kbd>w</kbd> | `CloseCurrentTab` |

##### Tabs: Navigation

| Keys                              | Action         |
| --------------------------------- | -------------- |
| <kbd>SUPER</kbd>+<kbd>[</kbd>     | Next Tab       |
| <kbd>SUPER</kbd>+<kbd>]</kbd>     | Previous Tab   |
| <kbd>SUPER_REV</kbd>+<kbd>[</kbd> | Move Tab Left  |
| <kbd>SUPER_REV</kbd>+<kbd>]</kbd> | Move Tab Right |

&nbsp;

##### Tabs: Tab-bar

| Keys                              | Action             |
| --------------------------------- | ------------------ |
| <kbd>SUPER</kbd>+<kbd>9</kbd>     | Toggle tab bar     |
| <kbd>SUPER</kbd>+<kbd>0</kbd>     | Rename Current Tab |
| <kbd>SUPER_REV</kbd>+<kbd>0</kbd> | Reset Tab Name     |

&nbsp;

##### Resize font

| Keys                         | Action             |
| ---------------------------- | ------------------ |
| <kbd>CTRL</kbd>+<kbd>+</kbd> | `IncreaseFontSize` |
| <kbd>CTRL</kbd>+<kbd>-</kbd> | `DecreaseFontSize` |

&nbsp;

#### Panes

##### Panes: Split Panes

| Keys                               | Action              |
| ---------------------------------- | ------------------- |
| <kbd>CTRL</kbd>+<kbd>\\</kbd>      | `SplitVerticaly`    |
| <kbd>SUPER_REV</kbd>+<kbd>\\</kbd> | `SplitHorizontally` |

##### Panes: Zoom+Close Pane

| Keys                              | Action                |
| --------------------------------- | --------------------- |
| <kbd>SUPER</kbd>+<kbd>Enter</kbd> | `TogglePaneZoomState` |
| <kbd>SUPER</kbd>+<kbd>w</kbd>     | `CloseCurrentPane`    |

##### Panes: Navigation

| Keys                          | Action                  |
| ----------------------------- | ----------------------- |
| <kbd>CTRL</kbd>+<kbd>k</kbd>  | Move to Pane (Up)       |
| <kbd>CTRL</kbd>+<kbd>j</kbd>  | Move to Pane (Down)     |
| <kbd>CTRL</kbd>+<kbd>h</kbd>  | Move to Pane (Left)     |
| <kbd>CTRL</kbd>+<kbd>l</kbd>  | Move to Pane (Right)    |
| <kbd>SUPER</kbd>+<kbd>p</kbd> | Swap with selected Pane |

##### Panes: Resize

| Keys                          | Action                                         |
| ----------------------------- | ---------------------------------------------- |
| <kbd>SUPER</kbd>+<kbd>k</kbd> | `AdjustPaneSize` <sub>(Direction: Up)</sub>    |
| <kbd>SUPER</kbd>+<kbd>j</kbd> | `AdjustPaneSize` <sub>(Direction: Down)</sub>  |
| <kbd>SUPER</kbd>+<kbd>h</kbd> | `AdjustPaneSize` <sub>(Direction: Left)</sub>  |
| <kbd>SUPER</kbd>+<kbd>l</kbd> | `AdjustPaneSize` <sub>(Direction: Right)</sub> |

##### Panes: Scroll Pane

| Keys                          | Action                               |
| ----------------------------- | ------------------------------------ |
| <kbd>SUPER</kbd>+<kbd>u</kbd> | Scroll Lines up <sub>5 lines</sub>   |
| <kbd>SUPER</kbd>+<kbd>d</kbd> | Scroll Lines down <sub>5 lines</sub> |
| <kbd>PageUp</kbd>             | Scroll Page up                       |
| <kbd>PageDown</kbd>           | Scroll Page down                     |

&nbsp;

#### Background Images

| Keys                          | Action                       |
| ----------------------------- | ---------------------------- |
| <kbd>SUPER</kbd>+<kbd>/</kbd> | Select Random Image          |
| <kbd>SUPER</kbd>+<kbd>,</kbd> | Cycle to next Image          |
| <kbd>SUPER</kbd>+<kbd>.</kbd> | Cycle to previous Image      |
| <kbd>SUPER</kbd>+<kbd>b</kbd> | Toggle background focus mode |

##

> [Original repository](https://github.com/KevinSilvester/wezterm-config)
