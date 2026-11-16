#!/usr/bin/env python3
"""Check prompt/bio drafts against an app's character limit.

Usage:
  char_count.py 40 "Coffee first. Plans later." "Pick a city, I'll pick the food."
  echo -e "line one\nline two" | char_count.py 160
"""
import sys


def main():
    if len(sys.argv) < 2:
        sys.exit(__doc__)
    limit = int(sys.argv[1])
    lines = sys.argv[2:] or [l.rstrip("\n") for l in sys.stdin if l.strip()]
    for text in lines:
        n = len(text)
        mark = "OK  " if n <= limit else "OVER"
        print(f"{mark} {n:>3}/{limit}  {text}")


if __name__ == "__main__":
    main()
