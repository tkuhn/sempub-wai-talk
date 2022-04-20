#!/usr/bin/env bash

for f in *.svg; do
  if grep -q 'font-family: "Virgil"' "$f" && [[ $f != *.p.svg ]]; then
    if grep -q 'stream;base64,d09GMk9UVE8AAO9AAAkAA' "$f"; then
      echo "Already processed: $f"
    else
      echo "Processing $f..."
      csplit $f '/src: url("https://excalidraw.com/Virgil.woff2");/'
      ( head -n -2 xx00 ; cat virgil-font.txt ; tail -n +3 xx01 ) > $f
      rm xx*
    fi
  else
    echo "Ignoring $f"
  fi
done
