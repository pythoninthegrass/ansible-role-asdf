#!/usr/bin/env bash

export PATH="$HOME/.asdf/bin:$HOME/.asdf/shims:$PATH"

if [ "$PLUGIN_EXEC" = 'go version' ]; then
	export ASDF_GOLANG_MOD_VERSION_ENABLED=true
fi

# run playbook
ansible-playbook -i localhost, -c local tests/${PLAYBOOK_FILE}

# verify asdf was installed
asdf --version

# verify plugin was installed
bash -c "$PLUGIN_EXEC"
