#!/bin/sh -l

# Import formula repository command
sudo rit add repo --provider=Github --name=imported-repo --repoUrl=$1 --priority=1

# Execute formula command
sudo $2