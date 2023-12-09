file=~/Videos/$(date "+%Y-%m-%d_%H-%M-%S.mp4")

notify-send "wf-recorder" "
started recording
$file
"

wf-recorder -g "$(slurp)" -f $file

echo "$file" | wl-copy

notify-send "wf-recorder" "
finished recording
$file
coppied file path to clipboard
"
