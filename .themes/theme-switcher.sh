#!/bin/zsh
#INFO: paths
OMP="$HOME/.config/OhMyPosh/Themes/themes"
NVIM="$HOME/.config/nvim/lua"
YAZI="$HOME/.config/yazi"
WZT="$HOME/.config/wezterm/lua"

THEME="$1"
THEMES="$HOME/.themes/$THEME"

#if not theme specified
if [ -z "$THEME" ]; then
  echo "Usage: theme-switcher <theme-name>"
  notify-send "No theme specified"
  exit 1
fi

#if not theme found
if [ ! -d "$THEMES" ]; then 
  echo "Theme $THEME not found!"
  notify-send "Theme not found !!!"
  exit 1
fi

#copy Themes
#ohmyposh
rm "$OMP/theme.txt"
cp "$THEMES/ohmyposh/theme.txt" "$OMP/"
source $HOME/.config/OhMyPosh/config/changeTheme.sh
#Nvim
rm "$NVIM/current-theme.lua"
cp "$THEMES/nvim/current-theme.lua" "$NVIM/"
#yazi
rm "$YAZI/theme.toml"
cp "$THEMES/yazi/theme.toml" "$YAZI/"
#wezterm
rm "$WZT/colorScheme.lua"
cp "$THEMES/wezterm/colorScheme.lua" "$WZT/"
echo "Theme switch to $THEME without issues"
notify-send "Theme switch without issues"
