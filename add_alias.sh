#!/bin/bash

# create alias `nano-flame` 
# example usage : nano-flame my_nano_container 10

# Determine the shell type
SHELL_TYPE=$(basename "$SHELL")

# Define the alias command
ALIAS_COMMAND="alias nano-flame='f() { /path/to/nano-flame/run.sh \"\$1\" \"\$2\"; }; f'"

# Function to add and source the alias
add_and_source() {
    CONFIG_FILE=$1
    SHELL_CMD=$2

    # Check if alias already exists
    if grep -q "nano-flame" "$CONFIG_FILE"; then
        echo "nano-flame alias already exists in $CONFIG_FILE"
    else
        # Add alias to the config file
        echo "$ALIAS_COMMAND" >> "$CONFIG_FILE"
        echo "nano-flame alias added to $CONFIG_FILE"

        # Source the config file using the appropriate shell
        $SHELL_CMD -c "source $CONFIG_FILE"
        echo "Sourced $CONFIG_FILE with $SHELL_CMD"
    fi
}

# Apply changes based on the shell type
if [ "$SHELL_TYPE" = "zsh" ]; then
    add_and_source "${HOME}/.zshrc" "zsh"
elif [ "$SHELL_TYPE" = "bash" ]; then
    if [ -f "${HOME}/.bash_aliases" ]; then
        add_and_source "${HOME}/.bash_aliases" "bash"
    else
        add_and_source "${HOME}/.bashrc" "bash"
    fi
else
    echo "Unsupported shell: $SHELL_TYPE"
    exit 1
fi
