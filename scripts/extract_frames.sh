#!/usr/bin/env bash
# Turn a phone screen recording of a dating profile into contact sheets Claude can read.
# Usage: extract_frames.sh <video> [out_dir] [fps]
# Needs ffmpeg. Produces sheet_0.jpg, sheet_1.jpg ... (5 frames side by side, in time order).
set -euo pipefail

video="${1:?usage: extract_frames.sh <video> [out_dir] [fps]}"
out="${2:-./profile_frames}"
fps="${3:-1}"   # raise to 2-3 for fast scrolling (e.g. prompt lists)

command -v ffmpeg >/dev/null || { echo "ffmpeg not found (macOS: brew install ffmpeg)" >&2; exit 1; }
mkdir -p "$out"

ffmpeg -v error -i "$video" -vf "fps=${fps},scale=420:-1" "$out/f_%03d.jpg"
n=$(ls "$out"/f_*.jpg | wc -l | tr -d ' ')

i=0; s=1
while [ "$s" -le "$n" ]; do
  ffmpeg -v error -y -start_number "$s" -i "$out/f_%03d.jpg" -frames:v 1 -vf tile=5x1 "$out/sheet_$i.jpg"
  i=$((i+1)); s=$((s+5))
done
echo "$n frames -> $i contact sheets in $out"
