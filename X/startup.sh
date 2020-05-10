#!/bin/bash
# set number of workspaces
wmctrl -n 3

# list start up apps
firefox &
spotify &
discord & 

sleep 15

# move to specific workspaces
# wmctrl -r app -t index
wmctrl -r firefox -t 0 
wmctrl -r spotify -t 1
wmctrl -r discord -t 1

wmctrl -k on
# focus on
# wmctrl -a app
wmctrl -a firefox
