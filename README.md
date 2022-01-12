<h1 align="center">st - simple terminal</h1>

<img align="center" src="/.github/preview.png">

<p align="center">st is a simple terminal emulator for X which sucks less.</p>

---

### Keybinds

+ **Normal** scroll with mouse and `Alt+Up` and `Alt+Down`;
+ Bigger scroll with `Alt+PageUp` and `Alt+PageDown`;
+ `Ctrl+Shift+V` to paste text;
+ `Ctrl+Shift+C` or `Middle Button of Mouse` copies the selected text;
+ `Shift+Enter` opens a new terminal in the same path;
+ `Shift+Backspace` opens a new floating terminal in the same path, you should change the variable path to the st with floating title.
	- [Script that I'm using](https://github.com/BeyondMagic/scripts/blob/master/terminal/st_float);
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
st.font           : Fira Code:pixelsize=12.25:antialias=true
st.font_fallback  : Fira Code Nerd Font Mono:style=Regular:pixelsize=13:antialias=true,Material\\-Design\\-Iconic\\-Font:style=Design-Iconic-Font:pixelsize=12,JoyPixels:pixelsize=13
st.termname       : st-256color
st.blinktimeout   : 500
st.bellvolume     : 0
st.padding        : 17
st.cursorshape    : 5
st.cwscale        : 0.875
st.chscale        : 0.875
st.opacity        : 0.875
st.ligatures      : 1
st.color0         : #000020
st.color1         : #EC5E66
st.color2         : #009900
st.color3         : #FAC863
st.color4         : #6699CC
st.color5         : #D75F86
st.color6         : #357CD5
st.color7         : #FDFCFD
st.color8         : #424043
st.color9         : #ED2E62
st.color10        : #5CBF53
st.color11        : #F3D353
st.color12        : #65D9EF
st.color13        : #FA74CE
st.color14        : #519FD1
st.color15        : #FFFFFF
st.color255       : #000020
st.color256       : #111111
st.color257       : #ffffff
st.color258       : #0A0C11
st.foreground     : #FDFCFD
st.background     : #0a0c11
st.cursorfg       : #111111
st.reverse-cursor : #ffffff
```

Apply the changes to Xorg.

```bash
xrdb ~/.config/xorg/XResources
```

Apply the changes to St instances.

```bash
kill -USR1 $(pidof st)
```

---

### Support

+ coloured undercurl (apply the st.info for external programs)
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
$ cd st
$ make install
$ st
```

If you want to, edit `config.mk` to match your local setup (st is installed into the /usr/local namespace by default).

Then run `tic -x -o ~/.terminfo st.info` to have support in multiple terminal programs that use undercurls, ...
