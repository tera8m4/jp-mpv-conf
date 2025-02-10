# MPV Configuration Files for Mining to Anki
Just my personal config files for mining to anki in [mpv](https://mpv.io/), a free, open-source, & cross-platform media player. 

Before you start using it, please take your time to read this whole README as common issues can be easily solved by simply reading carefully.

## Installation

NOTE: If you already have preferred mpv config files (if you don't ignore this) and want the mining scripts, get the mpv2anki script and install [mpv_websocket](https://github.com/kuroahna/mpv_websocket).

### Windows
- Get shinchiro (git) build from https://mpv.io/installation/ or https://github.com/shinchiro/mpv-winbuild-cmake/releases. You want to get the 7z starting with mpv-x86-64-v3 (click show all to make it visible).
- Extract the 7z to a folder of your choice. You won't be able to move to another folder or delete the files without reinstalling so choose wisely.
- Go to the installer folder and right click on mpv-install.bat to run as adminstrator. Follow the prompts to install.
- You can update mpv by running updater.bat as administrator. Follow the prompts. Once initial run of updater.bat has completed your update settings will be preserved and you only need to run updater.bat as administrator for future updates.
- Open %appdata% and create a folder called mpv.
- Download and extract the contents of this repository into the %appdata%\mpv folder (or use git clone).

### Linux
- Install mpv from https://mpv.io/installation/ using a package manager of your choice
- Download and extract contents of this repository into ~/.config/mpv (or git clone).

### MacOS
- Untested for MacOS
- Install mpv from https://mpv.io/installation/ 
- Download and extract contents of this repository into ~/.config/mpv (you will need to make the folders if they don't exist)
- Replace mpv_websocket binary with relevant binary from https://github.com/kuroahna/mpv_websocket/releases

## Mining
- Go to script-opts/mpv2anki.conf and set your anki fields and anki profile name (also set image_format to jpeg if you're on an macOS or iOS device).
- Open video file with subtitles in mpv (subtitle files will auto load if they are in the same folder with same name as video file).
- Open [TexthookerUI](https://renji-xd.github.io/texthooker-ui/) (download offline version [here](https://raw.githubusercontent.com/Renji-XD/texthooker-ui/main/docs/index.html)) and connect to the websocket port.
- Wait for unknown word and add it to anki through texthooker and yomitan
- Tab back to MPV and Ctrl + a to send paused sentence audio and image (align paused subtitle appropriately)
- Resume watching after updated note message popup.

## Interface and Keybinds
- The user interface is minimal and customizable. 
- The gui elements of uosc are on the top and bottom of the screen. You can press right click to pull up the uosc menu.
- Going to utils > keybindings in the uosc menu will give you a list of all the default keybinds. 
### Optional: Advanced configuration
- Refer to the [manual](https://mpv.io/manual/master/) to edit mpv.conf for general configuration.
- Refer to [manual](https://mpv.io/manual/master/) and [uosc commands](https://github.com/tomasklaen/uosc#commands) to add keybinds in input.conf.
- Refer to the comments to configure script config files in script-opts folder.

## Scripts
- [uosc](https://github.com/darsain/uosc) - Adds a minimalist but highly customisable GUI.
- [thumbfast](https://github.com/po5/thumbfast) - High-performance on-the-fly thumbnailer.
- [autoload](https://github.com/mpv-player/mpv/blob/master/TOOLS/lua/autoload.lua) - Automatically load playlist entries before and after the currently playing file, by scanning the directory.
- [mpv_websocket](https://github.com/kuroahna/mpv_websocket) - Uses websocket to send subtitle text to [texthooker UI](https://github.com/Renji-XD/texthooker-ui) so you can use a pop up dictionary. Slightly modified code from orignal.
- mpv2anki - Automatically sends current screenshot and sentence audio to last previously made anki card.

## Additional Credits
- mpv2anki.lua is originally from animecards.site, however it is heavily modified from the original script
- Inspired by [Zabooby's mpv config](https://github.com/Zabooby/mpv-config)

## Contributions
Feel free to send a pull request for anything.