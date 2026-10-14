#!/data/data/com.termux/files/usr/bin/bash
set -e

rm -f "$HOME/.local/bin/preAzure"
rm -rf "$HOME/.config/preAzure"
rm -f "$HOME/.config/fastfetch/cat.txt"
rm -rf "$HOME/.config/fastfetch/cats"
rm -f "$HOME/.config/fish/functions/clear.fish"
rm -f "$HOME/.config/fish/functions/fish_prompt.fish"
rm -f "$HOME/.config/fish/conf.d/aliases.fish"

echo "Removed preAzure files."
echo "Left in place: fish, fastfetch, font, colors, fish config."
echo "Remove those manually if you want a clean slate."