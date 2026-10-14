#!/data/data/com.termux/files/usr/bin/bash
set -e

REPO="$(cd "$(dirname "$0")" && pwd)"
PREFIX_HOME="$HOME"

if [ ! -d "/data/data/com.termux" ]; then
    echo "This installer is for Termux on Android. Aborting." >&2
    exit 1
fi

echo "==> Installing packages"
pkg update -y
pkg install -y fish fastfetch bat fzf eza zoxide termux-api git jq nano unzip curl

echo "==> Setting fish as default shell"
chmod +x "$PREFIX/bin/fish"
mkdir -p "$HOME/.termux"
ln -sf "$PREFIX/bin/fish" "$HOME/.termux/shell"

echo "==> Installing preAzure"
mkdir -p "$HOME/.local/bin"
install -m 755 "$REPO/bin/preAzure" "$HOME/.local/bin/preAzure"

echo "==> Installing config"
mkdir -p "$HOME/.config/preAzure"
if [ -f "$HOME/.config/preAzure/config.sh" ]; then
    cp "$HOME/.config/preAzure/config.sh" "$HOME/.config/preAzure/config.sh.bak"
    echo "    existing config backed up to config.sh.bak"
fi
install -m 644 "$REPO/config/config.sh" "$HOME/.config/preAzure/config.sh"

echo "==> Installing fastfetch config"
mkdir -p "$HOME/.config/fastfetch"
if [ -f "$HOME/.config/fastfetch/config.jsonc" ]; then
    cp "$HOME/.config/fastfetch/config.jsonc" "$HOME/.config/fastfetch/config.jsonc.bak"
fi
install -m 644 "$REPO/config/fastfetch.jsonc" "$HOME/.config/fastfetch/config.jsonc"

echo "==> Installing cats"
mkdir -p "$HOME/.config/fastfetch/cats"
cp "$REPO"/cats/*.txt "$HOME/.config/fastfetch/cats/"
cp "$REPO/cats/classic.txt" "$HOME/.config/fastfetch/cat.txt"

echo "==> Installing fish config"
mkdir -p "$HOME/.config/fish/functions" "$HOME/.config/fish/conf.d"
install -m 644 "$REPO/fish/config.fish"                    "$HOME/.config/fish/config.fish"
install -m 644 "$REPO/fish/functions/clear.fish"          "$HOME/.config/fish/functions/clear.fish"
install -m 644 "$REPO/fish/functions/fish_prompt.fish"    "$HOME/.config/fish/functions/fish_prompt.fish"
install -m 644 "$REPO/fish/conf.d/aliases.fish"           "$HOME/.config/fish/conf.d/aliases.fish"

echo "==> Installing termux colors"
mkdir -p "$HOME/.termux"
install -m 644 "$REPO/config/colors.properties" "$HOME/.termux/colors.properties"
termux-reload-settings 2>/dev/null || true

echo "==> Adding ~/.local/bin to PATH"
if ! grep -q "fish_add_path" "$HOME/.config/fish/config.fish"; then
    echo 'fish_add_path ~/.local/bin' >> "$HOME/.config/fish/config.fish"
fi

cat <<'DONE'

==> Install complete.

Manual step remaining: the Nerd Font.

  Download JetBrainsMonoNerdFontMono-Regular.ttf (the "Mono" variant)
  from https://github.com/ryanoasis/nerd-fonts/releases

  Save it to your phone's Download folder, then run:

    cp /storage/emulated/0/Download/JetBrainsMonoNerdFontMono-Regular.ttf ~/.termux/font.ttf

  Verify it's ~2.4 MB. Then exit Termux from notifcations or type exit and Enter,
  wait 10 seconds, and reopen.

Test with:
    printf '\ue0b0 \ue0b2 \uf17b \uf303 \ue0b3\n'

Real glyphs = success. Boxes = wrong font variant.

Then run: exec fish && preAzure

DONE