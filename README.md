<h1 align="center">flarity - A personal terminal emulator.</h1>

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

+ [scroll](https://st.suckless.org/patches/scrollback/) custom
+ rows and columns reflow (can resize the terminal and keep content) [custom](https://github.com/BeyondMagic/st/blob/master/patches/columns-rows-reflow-st-unpatched.patch)
+ [bold](https://st.suckless.org/patches/bold-is-not-bright/) custom
+ [boxdraw](https://st.suckless.org/patches/boxdraw)
+ [ligatures](https://st.suckless.org/patches/ligatures/)
+ [font2](https://st.suckless.org/patches/font2/)
+ [newterm](https://st.suckless.org/patches/newterm/) custom
+ [any geometry](https://st.suckless.org/patches/anygeometry/)
+ [vertcenter](https://st.suckless.org/patches/vertcenter/)
+ [undercurl](https://st.suckless.org/patches/undercurl/)
+ [live-reload-xresources](https://github.com/gnotclub/xst/commit/c0ffcfbaf8af25468103dd92e0c7e83555e08c7a)
+ [blinking-cursor](https://st.suckless.org/patches/blinking_cursor/)
+ [glyph-wide-support](https://github.com/LukeSmithxyz/st/commit/e3b821dcb3511d60341dec35ee05a4a0abfef7f2)
+ [cyclefonts](https://st.suckless.org/patches/cyclefonts/) [custom]
+ Set Italic, Bold, and Roman font by XResources [custom]

---

## XResources

Example file:

```
! Main fonts that can be cycled through.
flarity.fonts         : VictorMono NF:style=Medium:pixelsize=19:antialias=true:hinting=true,FiraCode NF:style=Regular:pixelsize=19:antialias=true

! Italic font.
flarity.italic        : VictorMono NF:style=Bold Italic:pixelsize=19:antialias=true:hinting=true
!flarity.italic        : Cartograph CF:style=Italic:pixelsize=14.5:antialias=true:hinting=true

! Bold font.
flarity.bold          : FiraCode NF:style=Bold:pixelsize=19:antialias=true:hinting=true

! Roman font.
flarity.roman         : JetBrainsMono Nerd Font:style=Bold:pixelsize=19:antialias=true:hinting=true

! Fonts fallback, in case of emojis and special icons.
flarity.font_fallback : Noto Sans CJK JP:pixelsize=19:antialias=true:hinting=true,Noto Color Emoji:style=Regular:pixelsize=18,Material\\-Design\\-Iconic\\-Font:style=Design-Iconic-Font:pixelsize=16.25

! Time between blinks of the cursor.
flarity.blinktimeout  : 500

! ...
flarity.bellvolume    : 0

! Padding between the borders of the terminal.
flarity.padding       : 16

! Shape of the curosr.
flarity.cursorshape   : 5

! Character width scale.
flarity.cwscale       : 0.975

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
+ Emojis (a.k.a. fallback fonts).

---

### Installation

First, install this package in your system: `libxft-bgra`.

Clone somewhere in your system:

```
$ git clone https://github.com/beyondmagic/flarity
$ cd flarity
# make install
$ flarity
```

If you want to, edit `config.mk` to match your local setup (flarity is installed into the /usr/local namespace by default).

Then run `tic -x -o ~/.terminfo flarity.info` to have support in multiple terminal programs that use undercurls.

---

Screenshots:

<img align="center" src="/.github/1.png">
