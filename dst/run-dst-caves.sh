#!/bin/bash

steamapp_id="343050"
steamapp_dir="$HOME/dst"
cluster_name="Cluster_1"

cd $steamapp_dir
./bin/dontstarve_dedicated_server_nullrenderer -console -cluster $cluster_name -shard Caves
