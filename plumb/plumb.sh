#!/usr/bin/env sh
#
# お元気に。
#
# João F. © BeyondMagic 2022 <koetemagie@gmail.com>

# 1. Set main variables.
{

  # A. Main path of icons.
  icons="IMG:$HOME/.local/share/icons"

}

# 2. Retrieve command to execute.
command="$(echo "
$icons/copy.svg\tコピー\tcopyq copy

$icons/internet.svg\tで開く
\t$icons/firefox.svg\tFirefox\tfirefox
\t$icons/brave.svg\tBrave\tbrave
\t
\t$icons/telegram.svg\tTelegram\ttelegram
\t$icons/world-download.svg\tTorrent Client\tqbittorrent
\t$icons/nsxiv.svg\tImage Viewer\tnsxiv
\t$icons/mpv.svg\tVideo Player\tmpv
\t
\t$icons/file-upload.svg\tUpload to AnonFiles\tanonfiles-upload

$icons/eye.svg\tIrís
\t$icons/world-1.svg\t日本語
\t\t$icons/language-hiragana-1.svg\tに翻訳そろ
\t\t\t$icons/brazil.svg\tポルトガル語\translate ja pt
\t\t\t$icons/usa.svg\t英語\translate ja en
\t\t$icons/book.svg\t意味\tdefinition ja
\t$icons/world-2.svg\tEnglish
\t\t$icons/language-hiragana-2.svg\tTranslate to
\t\t\t$icons/brazil.svg\tPortuguese\ttranslate en pt
\t\t\t$icons/japan.svg\tJapanese\ttranslate en ja
\t\t$icons/book.svg\tDefinition\tdefinition en
\t$icons/world-3.svg\tPortuguês
\t\t$icons/language-hiragana-3.svg\tTraduzir para
\t\t\t$icons/japan.svg\tJaponês\ttranslate pt ja
\t\t\t$icons/usa.svg\tInglês\ttranslate pt en
\t\t$icons/book.svg\tDefinição\tdefinition pt
" \
| sed -re '1d;$d' | $HOME/Git/Forking/xmenu/xmenu)"

# II. Execute command in fly.
eval "$command" "$1"
