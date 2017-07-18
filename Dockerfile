FROM fedora:23
LABEL maintainer="Vit Ry" version="0.6"

WORKDIR /root
RUN dnf install -y keepassx libgnomeui
RUN dnf install -y qt-config dejavu-fonts-common dejavu-sans-fonts dejavu-serif-fonts
RUN dnf install -y adwaita-qt4 adwaita-gtk2-theme adwaita-icon-theme adwaita-cursor-theme adwaita-qt

RUN dbus-uuidgen > /etc/machine-id
RUN mkdir -p .local/share .config
RUN echo $'\n\
\n\
[Qt]\n\
font="DejaVu Sans,12,-1,5,50,0,0,0,0,0"\n\
Palette\active=#000000, #dcdad5, #ffffff, #cbc7c4, #b8b6b2, #b8b5b2, #000000, #ffffff, #000000, #ffffff, #dcdad5, #a9a8a4, #4b6983, #ffffff, #0000ff, #ff00ff, #efefef, #000000, #ffffdc, #000000\n\
Palette\inactive=#000000, #dcdad5, #ffffff, #cbc7c4, #b8b6b2, #b8b5b2, #000000, #ffffff, #000000, #ffffff, #dcdad5, #a9a8a4, #9c9a94, #ffffff, #0000ff, #ff00ff, #efefef, #000000, #ffffdc, #000000\n\
Palette\disabled=#6e6d6a, #dcdad5, #ffffff, #cbc7c4, #b8b6b2, #b8b5b2, #6e6d6a, #ffffff, #6e6d6a, #ffffff, #dcdad5, #a9a8a4, #838383, #ffffff, #0000ff, #ff00ff, #efefef, #000000, #ffffdc, #000000\n\
fontPath=@Invalid()\n\
embedFonts=true\n\
style=adwaita\n\
doubleClickInterval=400\n\
cursorFlashTime=1000\n\
wheelScrollLines=3\n\
resolveSymlinks=false\n\
globalStrut\width=0\n\
globalStrut\height=0\n\
useRtlExtensions=false\n\
XIMInputStyle=On The Spot\n\
DefaultInputMethod=xim\n\
audiosink=Auto\n\
videomode=Auto\n\
GUIEffects=none\n' >> .config/Trolltech.conf

# mount your keys here
RUN mkdir /data
WORKDIR /data
CMD ["keepassx"]
