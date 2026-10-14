# preAzure

A Termux fetch dashboard for Android. Random cat, system specs, and a dad
joke on every login and `clear`.

## Screenshot

(paste one here)

## Requirements

- Termux and Termux:Styling, both installed from **F-Droid** (not Play Store).
  Signatures must match or styling won't apply.
- Android 7+ (aarch64).

## Install

```bash
git clone https://github.com/<you>/preazure.git
cd preazure
bash install.sh
```

The installer sets up fish as your shell, installs the configs, and copies
the cats. It does **not** install the Nerd Font — that's a manual step
because it can't be fetched by `pkg`.

### Manual step: the Nerd Font

Download `JetBrainsMonoNerdFontMono-Regular.ttf` — the **Mono** variant —
from the [Nerd Fonts releases](https://github.com/ryanoasis/nerd-fonts/releases).

Copy it into place:

```bash
cp /storage/emulated/0/Download/JetBrainsMonoNerdFontMono-Regular.ttf ~/.termux/font.ttf
```

Verify it's ~2.4 MB. Then force-stop Termux from Android Settings → Apps →
Termux, wait 10 seconds, reopen.

Test:

```bash
printf '\ue0b0 \ue0b2 \uf17b \uf303 \ue0b3\n'
```

Real glyphs = success. Boxes = wrong variant (you grabbed the proportional
one, not the Mono one).

## What you get

- Time-of-day greeting, colored by hour
- Random ASCII cat on the left (six in rotation)
- Fastfetch specs on the right, Catppuccin Mocha palette
- Dad joke from [icanhazdadjoke.com](https://icanhazdadjoke.com), centered
  and cached for 5 minutes
- Custom fish prompt: `~ preAzure ➤`
- `clear` wipes and re-runs the whole dashboard

## Configuration

Edit `~/.config/preAzure/config.sh`:

| Variable | Default | Notes |
|---|---|---|
| `GREET_NAME` | `friend` | Name in the greeting |
| `TIME_COLOR` | `118` | Clock color (256-color code) |
| `GREET_MORNING_COLOR` | `220` | 5am–12pm |
| `GREET_AFTERNOON_COLOR` | `208` | 12pm–5pm |
| `GREET_EVENING_COLOR` | `177` | 5pm–10pm |
| `GREET_NIGHT_COLOR` | `111` | 10pm–5am |
| `JOKE_COLOR` | `118` | Dad joke color |
| `JOKE_ENABLED` | `1` | `0` to hide the joke |
| `CAT_ENABLED` | `1` | `0` to hide the cat |
| `JOKE_TTL` | `300` | Joke cache in seconds |

Color codes: [256-color cheat sheet](https://www.ditig.com/256-colors-cheat-sheet).

## Uninstall

```bash
bash uninstall.sh
```

## License

MIT