# IceWM slateware Makefile.

.POSIX:

XDG_CONFIG_HOME = $(HOME)/.config
theme           = $(XDG_CONFIG_HOME)/icewm/themes/slateware
fontname        = source sans pro
fontsize        = 12
background      = \#333333
foreground      = \#faf0e6
highlight       = \#2f4f4f
lowlight        = \#999999
button          = \#4d4d4d
monitor         = \#000000

install: $(theme)/default.theme
install: $(theme)/image.jpg

$(theme)/default.theme: $(theme)
$(theme)/default.theme: default.theme
	sed -e 's/$$fontname/"$(fontname)"/' \
	    -e 's/$$fontsize/"$(fontsize)"/' \
	    -e 's/$$background/"$(background)"/' \
	    -e 's/$$foreground/"$(foreground)"/' \
	    -e 's/$$highlight/"$(highlight)"/' \
	    -e 's/$$lowlight/"$(lowlight)"/' \
	    -e 's/$$button/"$(button)"/' \
	    -e 's/$$monitor/"$(monitor)"/' \
	    default.theme \
	    > $@

$(theme)/image.jpg: $(theme)
$(theme)/image.jpg: image.jpg
	cp -- image.jpg $@

$(theme):
	mkdir -p -- $@

uninstall:
	rm -fr -- $(theme)
