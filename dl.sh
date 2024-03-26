#!/bin/zsh
echo "YouTubeダウンローダー(Mac版)"
echo "次からオプションを選択してください"
echo "1:動画をダウンロード　2:音声をダウンロード　3:アルバムをダウンロード"
read "option?オプションを選択(例:1):"
if [ $option = 1 ]; then 
    cd Desktop
    echo "動画をダウンロード"
    read "url_v?URL:"
    yt-dlp -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]" -o "dl_mp4/%(title)s.%(ext)s" "$url_v"
elif [ $option = 2 ]; then
    cd Desktop
    echo "音声をダウンロード"
    read "url_a?URL:"
    yt-dlp -x --audio-format mp3 --audio-quality 0 -o "dl_mp3/%(title)s.%(ext)s" "$url_a"
else 
    cd Music
    echo "アルバムをダウンロード"
    read "url_m?URL:"
    yt-dlp -f b -x --audio-format mp3 --audio-quality 320K --add-metadata -o "%(playlist_title)s/%(title)s.%(ext)s" "$url_m"
fi