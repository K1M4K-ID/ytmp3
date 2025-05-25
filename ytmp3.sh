#!/bin/bash
#CODE BY K1M4K-ID

# Cek apakah yt-dlp terinstal
if ! command -v yt-dlp &> /dev/null; then
    echo "yt-dlp tidak ditemukan. Silakan instal terlebih dahulu. apt-get install yt-dlp"
    exit 1
fi

# Fungsi bantuan
usage() {
    printf "\033[32;2m"
    cat << "EOF" 


    ██╗   ██╗████████╗   ██████╗ ██╗     ██████╗ 
    ╚██╗ ██╔╝╚══██╔══╝   ██╔══██╗██║     ██╔══██╗
     ╚████╔╝    ██║█████╗██║  ██║██║     ██████╔╝
      ╚██╔╝     ██║╚════╝██║  ██║██║     ██╔═══╝ 
       ██║      ██║      ██████╔╝███████╗██║     
       ╚═╝      ╚═╝      ╚═════╝ ╚══════╝╚═╝     
                                             
                                            V.1
[> CoDe By K1M4K-ID
[> ytmp3 tools untuk mendownload mp3 from url no ads

Options:
-u             Mp3 single url
-f             Mp3 playlist url

Usage:
./media.sh -u <url>
./media.sh -f <playlist.txt>

EOF
}

# Parsing argumen
while getopts ":u:f:" opt; do
  case ${opt} in
    u )
      URL=$OPTARG
      ;;
    f )
      FILE=$OPTARG
      ;;
    \? )
      echo "Argumen tidak valid: -$OPTARG" >&2
      usage
      ;;
    : )
      echo "Argumen -$OPTARG membutuhkan nilai." >&2
      usage
      ;;
  esac
done

# Eksekusi berdasarkan input
if [[ -n "$URL" ]]; then
    yt-dlp -x --embed-thumbnail --audio-format mp3 "$URL"
elif [[ -n "$FILE" ]]; then
    if [[ ! -f "$FILE" ]]; then
        echo "File '$FILE' tidak ditemukan."
        exit 1
    fi
    yt-dlp -x --embed-thumbnail --audio-format mp3 -i --batch-file="$FILE"
else
    usage
fi
