# Pre-prompt new line
precmd() { print "" }

dirwatch() {
    inotifywait -m $1 -e create -e move -e delete |
        while read thepath action file; do
            echo "$action $file"
        done
}

where() {
    find . -name \*$1\*
}
