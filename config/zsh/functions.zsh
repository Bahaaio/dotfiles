#
#  ███████╗██╗   ██╗███╗   ██╗ ██████╗████████╗██╗ ██████╗ ███╗   ██╗███████╗
#  ██╔════╝██║   ██║████╗  ██║██╔════╝╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
#  █████╗  ██║   ██║██╔██╗ ██║██║        ██║   ██║██║   ██║██╔██╗ ██║███████╗
#  ██╔══╝  ██║   ██║██║╚██╗██║██║        ██║   ██║██║   ██║██║╚██╗██║╚════██║
#  ██║     ╚██████╔╝██║ ╚████║╚██████╗   ██║   ██║╚██████╔╝██║ ╚████║███████║
#  ╚═╝      ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝
# Bahaaio

# create a directory and cd into it
function take() {
    mkdir -p "$1" && cd "$1"
}

# remove all docker containers, images and volumes
function dclear() {
    docker rm -f $(docker ps -a -q) >/dev/null 2>&1 || true            # remove all containers
    docker rmi -f $(docker images -q) >/dev/null 2>&1 || true          # remove all images
    docker volume rm -f $(docker volume ls -q) >/dev/null 2>&1 || true # remove all volumes
}

# yazi cd on exit
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# exercism download
exercism () {
    if [[ $1 == "download" ]]; then
        local out=()
        while IFS= read -r line; do
            out+=("$line")
        done < <(command exercism "$@")

        printf '%s\n' "${out[@]}"
        [[ -d "${out[-1]}" ]] && cd "${out[-1]}"

        # navigate to java main if exists
        if [[ -d "./src/main/java" ]]; then
            # enable all tests
            find ./src/test/java/ -name '*.java' | xargs sed -i '/@Disabled/d'

            # open in idea
            idea .
        fi
    else
        command exercism "$@"
    fi
}
