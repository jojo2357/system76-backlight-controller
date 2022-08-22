# System76 Backlight Controller
The idea of this tool is to allow the user to change their backlight LED color at will. On my Gazelle, I can only cycle through preset colors, which is very limited, but with this tool, anything and everything is possible.

## Table of Contents
- [Installation](#Installation)
- [How to use (intro)](#Usage)
- [How to use (hardcore)](#Executor:-What-is-it-and-how-does-it-work?)
- [Contributing](#Contributing)
- [License](#License)

### Installation
```sh
git clone https://github.com/jojo2357/system76-backlight-controller.git && cd system76-backlight-controller
sudo ./backlight-installer
```

### Usage
After installation, you can interface the controller via

`backlight-controller`

but note that most of the commands require `root` privileges.

#### Commands
| Name | Options | Description |
| ---- | ------- | ----------- |
| start | NONE | Starts the executor running

### Executor: What is it and how does it work?
This tool works by creating a systemd service that runs a script with root privileges. That script will do whatever hoop-jumping it wants in order to determine what color it wants to set the backlight color to.

#### How do I set the backlight color?
After installation, you will have a script called `/usr/local/bin/export-keyboard-color`

This script requires root, and takes either one arg with the hex code of the color you want to set (DO NOT INCLUDE `0x` or `#`! ONLY the 6 digits matching `/[0-9A-Fa-f]/`) or three args in base 10 as R, G, and B, respectively.

#### I want to custom-control my lights
In order to do this, you need to write a script that can be executed using a shebang (ex `#!/bin/bash` or `#!/bin/python3`) and your system must support said shebang. Note that since the script will run as root, any deps need to be installed using root (mostly talking about you, PIP)

This repo already has some controllers, or "Executors" provided that you can use using the `set` subcommand. They are as follows

| File | Has Deps | Requires | Description |
|---|---|---|---|
| rainbow.sh | N | `bash` | Cycles through the rainbow |
| solid-orange | N | `bash` | Sets the backlight to a nice orange color |
| solid-pythorange | Y | `python3`,`keyboard` | Sets the backlight to orange, and changes to blue when any key is pressed |
| ram-monitor | Y | `python3`,`psutil`| Changes backlight from green to red based on the system resource utilization (ram & cpu) |
| modifier-keys | Y | `python3`,`keyboard` | Changes the backlight color whenever a modifier key is pressed (shift/ctrl/alt) |

Feel free to use these for inspiration.

### Contributing
Pull Requests are welcome, just chuck your script into the community scripts folder. Please include a license in your file, otherwise it will be assumed to be covered under [my License](#License)

### License
This software is licensed under the GNU Glorious People's License v3 and is intended to be used for good, not evil