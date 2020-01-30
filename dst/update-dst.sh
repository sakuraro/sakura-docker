#!/bin/bash

steamcmd_dir="/home/steam/steamcmd"
steamapp_id="343050"
steamapp_dir="/home/steam/dst"
cluster_name="Cluster_1"

cd $steamcmd_dir
./steamcmd.sh +login anonymous +force_install_dir $steamapp_dir +app_update $steamapp_id validate +quit
cp -rf /home/steam/mods $steamapp_dir/mods
cd $steamapp_dir
./bin/dontstarve_dedicated_server_nullrenderer -only_update_server_mods
