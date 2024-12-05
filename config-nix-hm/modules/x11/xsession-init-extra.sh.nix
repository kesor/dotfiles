{ pkgs, ...}:
with pkgs;
''
# Turn off beeps.
${xorg.xset}/bin/xset -b

# Monitor blanking
${xorg.xset}/bin/xset dpms 120 360 800

# Keyboard repeat rate
# ${xorg.xset}/bin/xset r rate 150 15
${xorg.xset}/bin/xset r off

export GTK_IM_MODULE=xim

# fix graphical libraries (awt, swt)
export _JAVA_AWT_WM_NONREPARENTING=1
export AWT_TOOLKIT=MToolkit
export GTK_A11Y=none

export QT_ACCESSIBILITY=0
export QT_QPA_PLATFORM=xcb

export PULSE_LATENCY_MSEC=83
export PIPEWIRE_LATENCY=1024/48000
''
