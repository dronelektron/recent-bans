#!/bin/bash

PLUGIN_NAME="recent-bans"

cd scripting
spcomp $PLUGIN_NAME.sp -i include -o ../plugins/$PLUGIN_NAME.smx
