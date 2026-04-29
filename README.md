Forked from gtkwave/gtkwave `lts`, including some build scripts for MSYS2 UCRT64 environment.

Changes
- [x] Update preset wave colors to be readable on black background
- [ ] Customizable preset colors in gktwaverc, maybe names as well?
- [ ] Increase GUI font size (menus and whatnot)
- [ ] Dark GTK theme?

Dependencies (MSYS2)

```sh
pacman -Syuu
pacman -Syuu
pacman -S \
base-devel \
mingw-w64-ucrt-x86_64-autotools \
mingw-w64-ucrt-x86_64-gcc \
mingw-w64-ucrt-x86_64-tk \
mingw-w64-ucrt-x86_64-gperf \
mingw-w64-ucrt-x86_64-judy \
mingw-w64-ucrt-x86_64-xz \
mingw-w64-ucrt-x86_64-gtk2 
```
`mingw-w64-ucrt-x86_64-gtk3` for gtkwave-gtk3*