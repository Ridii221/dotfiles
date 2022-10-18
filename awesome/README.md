# Install

```sh
git clone --recurse-submodules --remote-submodules --depth 1 -j 2 https://github.com/lcpz/awesome-copycats.git
mv -bv awesome-copycats/* ~/.config/awesome; rm -rf awesome-copycats
git clone https://github.com/streetturtle/awesome-wm-widgets
cp ./awesome/* -r ~/.config/awesome/
```

### spotify widget

https://github.com/streetturtle/awesome-wm-widgets/tree/master/spotify-widget
```sh
git clone https://gist.github.com/fa6258f3ff7b17747ee3.git
cd ./fa6258f3ff7b17747ee3 
chmod +x sp
cp ./sp ~/.local/bin/
```

### screenshots
```sh
# requires scrot
wget -P ~/.local/bin/ https://raw.githubusercontent.com/lcpz/dots/master/bin/screenshot
chmod +x ~/.local/bin/screenshot
```

### cava (audio visualizer)
```
apt install cava
```

# todo

autostart
- xset r rate 280 40
- setxkbmap -option "caps:escape"
- ssh-agent

# problems

### bluetooth settings does not work in gnome-control-center (Settings)

- ```sudo apt install blueman```

### sound control with media keys

- 

### git ssh key not working??

- ```ssh-add <key_file>```

### caps to esc

- ```setxkbmap -option "caps:escape"```

### default apps looks
- ```sudo apt install lxappearance```

### high backspace repeat delay???
