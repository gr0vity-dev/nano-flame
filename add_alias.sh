#!/bin/bash

# Create alias `nano-flame` 
# Example usage: nano-flame my_nano_container 10

# Get the absolute path of the run.sh script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
RUN_SH_PATH="${SCRIPT_DIR}/run.sh"

# Define the alias command
ALIAS_COMMAND="alias nano-flame='f() { \"${RUN_SH_PATH}\" \"\$1\" \"\$2\"; }; f'"

# Determine the shell type
SHELL_TYPE=$(basename "$SHELL")

# Function to add the alias
add_alias() {
    CONFIG_FILE=$1
    SOURCE_COMMAND="source $CONFIG_FILE"

    # Check if alias already exists
    if grep -q "nano-flame" "$CONFIG_FILE"; then
        echo "nano-flame alias already exists in $CONFIG_FILE"
    else
        # Add alias to the config file
        echo "$ALIAS_COMMAND" >> "$CONFIG_FILE"
        echo "nano-flame alias added to $CONFIG_FILE"

        # Beautiful print
        echo -e "Please run the following command to activate the nano-flame alias:\n-------------------\n$SOURCE_COMMAND\n-------------------"
    fi
}

# Apply changes based on the shell type
if [ "$SHELL_TYPE" = "zsh" ]; then
    add_alias "${HOME}/.zshrc"
elif [ "$SHELL_TYPE" = "bash" ]; then
    if [ -f "${HOME}/.bash_aliases" ]; then
        add_alias "${HOME}/.bash_aliases"
    else
        add_alias "${HOME}/.bashrc"
    fi
else
    echo "Unsupported shell: $SHELL_TYPE"
    exit 1
fi
