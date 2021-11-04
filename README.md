<h1 align="center">st - simple terminal</h1>

<img align="center" src="preview.png">

<p align="center">st is a simple terminal emulator for X which sucks less.</p>

<h3>Keybinds</h3>

+ **Normal** scroll with mouse and `Alt+Up` and `Alt+Down`
+ Bigger scroll with `Alt+PageUp` and `Alt+PageDown`
+ Paste `Ctrl+Shift+V`
+ Copy `Ctrl+Shift+C` | TODO: copy with the middle button of mouse
+ When resizing to smaller size, the terminal won't clear the columns | TODO: do the same thing for rows
+ `Shift+Enter` opens a new terminal in the same path
+ `Shift+Backspace` opens a new floating terminal in the same path, you should change the variable path to the st with floating title.
	- [Script that I'm using](https://github.com/BeyondMagic/scripts/blob/master/terminal/st)
+ `Middle Button of Mouse` copies the selected text
+ `Shift + Middle Button of Mouse` pastes copied text
+ `CTRL+Backspace` returns `F36+F35` sequence, I use this on **nvim** and **zsh**. It's preferable compared to 
	- `noremap! <F36><F35> <C-w>` nvim
	- `inoremap <F36><F35> <C-w>` nvim
	- `bindkey '^[[24;5~^[[23;5~' backward-kill-word` zsh

<h3>Support</h3>

+ coloured undercurl (apply the st.info for external programs)
	- sequence is 4:3, 4:0 to reset
+ history (default: 2000 lines)
+ Emojis
+ 

<h3>Requirements</h3>

In order to build st you need the Xlib header files.

<h4>Fonts</h4>

This was configured with Fira Code and Hack as callback.

Try it first with:

```
patch -p1 -i column-rows-patch-st-with-liga-box-hist.diff
```

<h3>Installation</h3>

Edit config.mk to match your local setup (st is installed into
the /usr/local namespace by default).

Afterwards enter the following command to build and install st (if
necessary as root):

    make clean install

Then run `tic -x -o ~/.terminfo st.info` to have support in multiple terminal programs that use undercurls, ...
