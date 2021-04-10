<h1 align="center">st - simple terminal</h1>

<img align="center" src="preview.png">

<p align="center">st is a simple terminal emulator for X which sucks less.</p>

<h3>Patchers</h3>

+ **Normal** scroll with mouse and `Alt+Up` and `Alt+Down`
  - It doesn't bug when scrolling or rezising, because `scroll` program is a shit and does not work properly.
+ Paste `Ctrl+Shift+V`

<h3>Requirements</h3>

In order to build st you need the Xlib header files.


<h3>Installation</h3>

Edit config.mk to match your local setup (st is installed into
the /usr/local namespace by default).

Afterwards enter the following command to build and install st (if
necessary as root):

    make clean install


<h3>Running st</h3>

If you did not install st with make clean install, you must compile
the st terminfo entry with the following command:

    tic -sx st.info

See the man page for additional details.

<h3>Credits</h3>

© 2019-2021 João Victor F. <koetemagie beyondmagic>


## Please verify `github.com/beyondMagic/scripts`!

DWM hasn't any external commands builtin than the simple MPC commands, which can be easily disabled, I use it with 
