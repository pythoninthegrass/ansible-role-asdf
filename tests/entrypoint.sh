#!/usr/bin/env bash

export HOSTS="${HOSTS:-localhost,}"
export VERBOSE="${VERBOSE:-False}"
export PATH="$HOME/.asdf/bin:$HOME/.asdf/shims:$PATH"

if [ "$PLUGIN_EXEC" = 'go version' ]; then
	export ASDF_GOLANG_MOD_VERSION_ENABLED=true
fi

# run playbook
cmd="ansible-playbook"
declare -a args=(
	"-i"
	"$HOSTS"
	"-c"
	"local"
	"tests/${PLAYBOOK_FILE}"
)
if [ "$VERBOSE" = "True" ]; then
	args+=("-v")
	export ANSIBLE_STDOUT_CALLBACK=debug
fi
"$cmd" "${args[@]}"

# verify asdf was installed
asdf --version

# verify plugin was installed
bash -c "$PLUGIN_EXEC"
