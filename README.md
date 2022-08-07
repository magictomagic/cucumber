
## Route
- [ X ] Extract/Share Linux-Desktop meta-data to cloud.
- [ ] Meta-data can regenerate Full-Functional Linux-Desktop in Fedora/Debian with a little command line.
- [ ] 

## Extract Packages
```shell
dnf repoquery --userinstalled | awk -F ":" '{print $1}' | sed -E 's/-[0-9]{1}//'
```

## Installed Packages
```txt
NetworkManager-wifi
alacritty
authselect
bash-completion
brave-browser
brightnessctl
btrfs-progs
chrony
cjkuni-uming-fonts
clipman
cmake
dosfstools
efibootmgr
fira-code-fonts
firefox
fontconfig-devel
freetype-devel
gcc-c++
git
gparted
grimshot
grub2-efi-x64
inotify-tools
kernel
langpacks-en_GB
libxcb-devel
libxkbcommon-devel
mako
mpv
nautilus
neovim
pmount
rpmfusion-free-release
rpmfusion-nonfree-release
rsync
shim-x64
swappy
sway
swaylock-effects
tar
waybar
wf-recorder
wl-clipboard
zathura
zathura-cb
zathura-djvu
zathura-pdf-mupdf
zathura-pdf-poppler
zathura-ps
```
