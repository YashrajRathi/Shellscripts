#!/bin/bash

temp_key_file_name=$(find /home/username/Downloads -name "*.pem"  -type f -exec ls -t1 {} +  | head -n 1) 
yes | rm -rf ~/temp.pem
cp "$temp_key_file_name" ~/temp.pem
chmod 400 ~/temp.pem