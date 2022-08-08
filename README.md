
## Route
- [x] Extract/Share Linux-Desktop meta-data to cloud.
- [ ] Meta-data can regenerate Full-Functional Linux-Desktop in Fedora/Debian with a little command line.
- [ ] Auto generate script contain meta-data that can regenerate Full-Functional Linux-Desktop.
- [ ] Automate backup $HOME and dd disk

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

## TODO
rsync $HOME备份, dd 全盘备份(脚本主体模块: 1.  auto mount 2. auto umount 3. auto rsync/dd)

mpd/pluseaudio 搞一搞 https://wiki.archlinux.org/title/Music_Player_Daemon

waybar显示电量，网速（**广域网、局域网断网检测、剩余耗电时间**），后台运行的程序（**wl-record**，音乐）



双显管理

neoVim进步: 用我之前的配置：自动补全，配色。装最基本的插件（LUA）。

---



rime输入法(双拼，简体+繁体)

alacritty: **不同权限文件显示颜色不同(或者时sway的配置？)**，**去掉上边的边边**，命令块之间间隔大一点

蓝牙：音响, 鼠标 (先会连，然后看看低代码易得不？)



https://github.com/jarun/nnn/wiki 探索

平铺窗口状态保存

https://code.krister.ee/lock-screen-in-sway/ 网页英文字体显示问题



https://github.com/Alexays/Waybar 有的功能都配一边，然后配色变成透明黑

关机（事件触发）

### 低

> After 自动化脚本 and dd baskup



firefox加速: 自动安装ublock origin, vertical tabs等插件

调研类似的（（插件）支持：预览图片，不同形式（预览形式等）展示图片）

休眠/关机（事件触发）https://github.com/systemd/systemd/issues/15354

Please turn on debug logging in systemd-logind (i.e. `systemctl edit systemd-logind.service`, then insert:

dnf包 依赖树 分析
看有没有xwayland, qt之类的包/进程(干掉)
CPU参数配置：启动加速

错误定位，分析解决：tty2 键盘不对

护眼 https://github.com/slgobinath/SafeEyes

---

邮件客户端（同步notification）

贴图工具(若出来了不用qt的就放上面)

pip
obsidian: 配置注意点：快捷键冲突，markdown兼容，配置文件保存
docker
only office - Docker | Podman | yum
obs
shotcut
gimp
邮箱
按键 屏幕 反馈显示

调研莫名奇妙出现的包: Elementary-files-portal
跟踪自由软件的最新发展(RSS订阅跟踪)
专门搞一个RSS集合来跟踪：

- github/水银 等开源平台进展
- Youtube, 新闻频道，发展

安装软件自动装入docker中打包运行(支持放底层)

## 不自由软件

IDEA
AS
Pycharm
付费软件
typora
