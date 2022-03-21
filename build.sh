#!/bin/bash

PLUGIN_NAME="recent-bans"

cd scripting
spcomp $PLUGIN_NAME.sp -o ../plugins/$PLUGIN_NAME.smx
