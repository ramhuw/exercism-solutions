reverse() {
    local s="$1"
    local l="${#s}"
    if [[ "$l" -eq 0 ]]; then
        printf '%s' "$s"
    else
        printf '%s%s' "$(reverse "${s:1}")" "${s:0:1}"
    fi
}

reverse "$1"