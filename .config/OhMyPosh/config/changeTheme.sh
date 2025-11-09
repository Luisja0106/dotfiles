#!/bin/zsh
THEME_NAME="$(cat ~/.config/OhMyPosh/Themes/themes.txt)"
export DIRECTORY="$HOME/.config/OhMyPosh/Themes"
PALLETE="$(cat ~/.config/OhMyPosh/Themes/themes/theme.txt)"
export PALLETE_DIR="$HOME/.config/OhMyPosh/Themes/themes/"
COLORS="$PALLETE_DIR/$PALLETE"
THEME="$DIRECTORY/$THEME_NAME"
TEMPFILE="$DIRECTORY/currentTheme.toml"
rm "$TEMPFILE"
touch "$TEMPFILE"
cat "$COLORS" > "$TEMPFILE"
cat "$THEME" >> "$TEMPFILE"
source $HOME/.zshrc
