dots
====

I have started using a Kinesis Advantage USB keboard lately and in order for it
to function properly, one must actually do some tweaking in the environments I
normally work in on a daily basis. The files within this directory named as
.kin is related to the Kinesis and are not for other ketboards.


Kinesis
=======
The problematic keys for this keyboard and when dealing with the swedish keymap
which is required for typing somewhat proper, are: å ä ö | ~

Those are atleast the ones I need most often. I also really don't want to mess
up the keyboard too much as I think that just complicates stuff so I'm keeping
things as normal as one can make it, ie minimal changes compared to the default
settings as the board comes default.

The default se keymaps:

xmodmap -e "keycode  34 = aring Aring aring Aring dead_diaeresis dead_abovering dead_diaeresis"
xmodmap -e "keycode  51 = apostrophe asterisk apostrophe asterisk acute multiply acute"
xmodmap -e "keycode 113 = Left NoSymbol Left"
xmodmap -e "keycode 114 = Right NoSymbol Right"
xmodmap -e "keycode 111 = Up NoSymbol Up"
xmodmap -e "keycode 116 = Down NoSymbol Down"


