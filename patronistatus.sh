#!/bin/bash

# Run the patronictl command and capture the output
output=$(patronictl -c /etc/patroni.yml list)

# Grep the TL values from the output
tls=$(echo "$output" | grep -oP '\|\s+\d+\s+\|' | awk '{print $2}')

# Convert the TL values to an array
tl_array=($tls)

# Check if all TL values are the same
first_tl=${tl_array[0]}
all_same=true
for tl in "${tl_array[@]}"; do
  if [ "$tl" != "$first_tl" ]; then
    all_same=false
    break
  fi
done

# Write the result to the patronistatus file
if $all_same; then
  echo "1" > patronistatus
else
  echo "0" > patronistatus
fi

