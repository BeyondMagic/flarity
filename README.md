<h1 align="center">flarity - A personal terminal emulator.</h1>

<img align="center" src="/.github/preview.png">

<p align="center">flarity is a fork of st constrained with usability as the main goal of it.</p>

---

### Keybinds

+ Normal scroll with mouse and `Alt+Up` and `Alt+Down`;
+ Greater scroll with `Alt+PageUp` and `Alt+PageDown`;
+ `Ctrl+Shift+V` to paste text;
+ `Ctrl+Shift+C` or `Middle Button of Mouse` copies the selected text;
+ `Shift+Enter` opens a new terminal in the same path;
+ `Shift+Backspace` opens a new terminal with the title "float" so that the window manager can make it float.
+ `Middle Button of Mouse` copies selected text.
+ `Shift + Middle Button of Mouse` pastes copied text.
+ `CTRL+Backspace` returns `F36+F35` sequence, I use this on **nvim** and **zsh**. It's preferable compared to 
	- `noremap! <F36><F35> <C-w>` nvim
	- `inoremap <F36><F35> <C-w>` nvim
	- `bindkey '^[[24;5~^[[23;5~' backward-kill-word` zsh

---

## Patches (as far as I remember)

+ [alpha focus highlight](https://st.suckless.org/patches/alpha_focus_highlight/)
+ [scroll](https://st.suckless.org/patches/scrollback/)
+ rows and columns reflow (can resize the terminal and keep content) [custom](https://github.com/BeyondMagic/st/blob/master/patches/columns-rows-reflow-st-unpatched.patch)
+ [bold](https://st.suckless.org/patches/bold-is-not-bright/)
+ [boxdraw](https://st.suckless.org/patches/boxdraw)
+ [ligatures](https://st.suckless.org/patches/ligatures/)
+ [font2](https://st.suckless.org/patches/font2/)
+ [newterm](https://st.suckless.org/patches/newterm/) [custom](https://github.com/BeyondMagic/st/blob/master/patches/newterm_custom_argument.patch)
+ [any geometry](https://st.suckless.org/patches/anygeometry/)
+ [vertcenter](https://st.suckless.org/patches/vertcenter/)
+ [undercurl](https://st.suckless.org/patches/undercurl/)
+ [live-reload-xresources](https://github.com/gnotclub/xst/commit/c0ffcfbaf8af25468103dd92e0c7e83555e08c7a)
+ [blinking-cursor](https://st.suckless.org/patches/blinking_cursor/)
+ [glyph-wide-support](https://github.com/LukeSmithxyz/st/commit/e3b821dcb3511d60341dec35ee05a4a0abfef7f2)
+ [cyclefonts](https://st.suckless.org/patches/cyclefonts/) custom

---

## XResources

Example file:

```
! Flarity default config:
!
! Fonts:
!   Coding:           FiraCode NF:                        https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraCode/
!   Writing:          agave NF:                           https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Agave/
!   Japanese support: Noto Sans CJK JP                    https://fonts.google.com/noto/specimen/Noto+Sans+JP
!   Icons support:    Material\\-Design\\-Iconic\\-Font   https://github.com/google/material-design-icons
!   Emojis support:   JoyPixels                           https://www.joypixels.com/
!   UNICODE support:  Unifont-JP                          http://unifoundry.com/unifont/

! Cycle main fonts.
flarity.fonts         : JetBrainsMono Nerd Font:style:medium:pixelsize=15:pixelsize=12.25:antialias=true,agave NF:style=r:pixelsize=17:antialias=true

! Fonts fallback.
flarity.font_fallback : Noto Sans CJK JP:style=Regular:pixelsize=14:antialias=true,Material\\-Design\\-Iconic\\-Font:style=Design-Iconic-Font:pxelsize=16.25,JoyPixels:pixelsize=14,

! Name of the terminal.
flarity.termname      : flarity-256color

! Time between blinks of the cursor.
flarity.blinktimeout  : 500

! ...
flarity.bellvolume    : 0

! Padding between the borders of the terminal.
flarity.padding       : 16

! Shape of the curosr.
flarity.cursorshape   : 5

! Character width scale.
flarity.cwscale       : 0.876

! Character height scale.
flarity.chscale       : 0.925

! Opacity of the terminal background.
flarity.opacity       : 1

! If ligatures are enabled or not.
flarity.ligatures     : 1
```

Apply the changes to Xorg.

```bash
xrdb ~/.config/xorg/XResources
```

Apply the changes to flarity instances.

```bash
kill -USR1 $(pidof flarity)
```

---

### Support

+ coloured undercurl (apply the flarity.info for external programs)
	- sequence is 4:3, 4:0 to reset
+ history (default: 2000 lines)
+ Emojis 

---

### Fonts

This was configured with Fira Code and Material Design Iconic 2 fonts.

---

### Installation<

First, install this package in your system: `libxft-bgra`.

Clone somewhere in your system:

```
$ git clone https://github.com/beyondmagic/flarity
$ cd flarity
# make install
$ flarity
```

If you want to, edit `config.mk` to match your local setup (flarity is installed into the /usr/local namespace by default).

Then run `tic -x -o ~/.terminfo flarity.info` to have support in multiple terminal programs that use undercurls, ...
