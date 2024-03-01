#!/bin/bash

update_ssh_config() {
    local option_name="$1"
    local desired_value="$2"
    local config_file="/etc/ssh/sshd_config"

    if grep -q "^$option_name " "$config_file"; then
        sed -i "s/^$option_name .*/$option_name $desired_value/" "$config_file"
    else
        echo "$option_name $desired_value" >> "$config_file"
    fi
}

update_ssh_config "UsePAM" "yes"

update_ssh_config "PermitRootLogin" "no"

update_ssh_config "PasswordAuthentication" "no"

systemctl restart sshd

