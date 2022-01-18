<h1 align="center">flarity - A personal terminal emulator.</h1>

<img align="center" src="/.github/preview.png">

<p align="center">flarity is a fork of st constrained with usability as the main goal of it.</p>

---

### Keybinds

+ **Normal** scroll with mouse and `Alt+Up` and `Alt+Down`;
+ Greater scroll with `Alt+PageUp` and `Alt+PageDown`;
+ `Ctrl+Shift+V` to paste text;
+ `Ctrl+Shift+C` or `Middle Button of Mouse` copies the selected text;
+ `Shift+Enter` opens a new terminal in the same path;
+ `Shift+Backspace` opens a new terminal with the title "float" so that the window manager can make it float.
+ `Shift + Middle Button of Mouse` pastes copied text
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

---

## XResources

Example file:

`st.font_fallback` is used for font2, multiple ones are divided by `,`.

```
flarity.font           : Fira Code:pixelsize=12.25:antialias=true
flarity.font_fallback  : Fira Code Nerd Font Mono:style=Regular:pixelsize=13:antialias=true,Material\\-Design\\-Iconic\\-Font:style=Design-Iconic-Font:pixelsize=12,JoyPixels:pixelsize=13
flarity.termname       : flarity-256color
flarity.blinktimeout   : 500
flarity.bellvolume     : 0
flarity.padding        : 17
flarity.cursorshape    : 5
flarity.cwscale        : 0.875
flarity.chscale        : 0.875
flarity.opacity        : 0.875
flarity.ligatures      : 1
flarity.color0         : #000020
flarity.color1         : #EC5E66
flarity.color2         : #009900
flarity.color3         : #FAC863
flarity.color4         : #6699CC
flarity.color5         : #D75F86
flarity.color6         : #357CD5
flarity.color7         : #FDFCFD
flarity.color8         : #424043
flarity.color9         : #ED2E62
flarity.color10        : #5CBF53
flarity.color11        : #F3D353
flarity.color12        : #65D9EF
flarity.color13        : #FA74CE
flarity.color14        : #519FD1
flarity.color15        : #FFFFFF
flarity.color255       : #000020
flarity.color256       : #111111
flarity.color257       : #ffffff
flarity.color258       : #0A0C11
flarity.foreground     : #FDFCFD
flarity.background     : #0a0c11
flarity.cursorfg       : #111111
flarity.reverse-cursor : #ffffff
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
$ git clone https://github.com/beyondmagic/st
$ cd flarity
$ make install
$ flarity
```

If you want to, edit `config.mk` to match your local setup (flarity is installed into the /usr/local namespace by default).

Then run `tic -x -o ~/.terminfo flarity.info` to have support in multiple terminal programs that use undercurls, ...
