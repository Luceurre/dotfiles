maim -s ~/Pictures/screenshots/screenshot_$(date +"%Y-%m-%d-%T").png && xclip -selection clipboard -t image/png -i ~/Pictures/screenshots/`ls -1 -t ~/Pictures/screenshots | head -1`
