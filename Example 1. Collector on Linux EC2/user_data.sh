#!/bin/bash
cd /etc
sudo wget "https://raw.githubusercontent.com/gwatts229/Terraform/master/sources.json/Example_1/sources.json"
cd /opt
sudo wget ${Sumo_Collector_Download_URL} -O SumoCollector.sh && sudo chmod +x SumoCollector.sh
sudo ./SumoCollector.sh -q -Vsumo.accessid=${Sumo_Logic_Access_ID} -Vsumo.accesskey=${Sumo_Logic_Access_Key} -VsyncSources=/etc/sources.json -Vephemeral=true
