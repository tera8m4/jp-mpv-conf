curl -s https://api.github.com/repos/kuroahna/mpv_websocket/releases/latest \
| grep "browser_download_url.*linux.*zip" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -

unzip *linux-musl.zip
rm *linux-musl.zip
