#!/bin/bash

set -eu
set -o pipefail

cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd ..

. ddb/vars.sh

echo Installing RPM/DEB packages

if [[ ! -z $(which yum) ]]; then
    sudo yum install -y python3-pip zstd unzip unixODBC-devel wget
    sudo yum install -y cmake openssl-devel
elif [[ ! -z $(which apt) ]]; then
    sudo apt update
    sudo apt install -y python3-pip zstd unzip unixodbc-dev wget
    sudo apt install -y cmake libssl-dev
fi

echo Installing DuckDB

# DuckDB binary
ddb/get.sh

echo Installing Pip package

pip3 config --user set global.progress_bar off
# clients
pip3 install --user duckdb==${DUCKDB_VERSION}
pip3 install --user neo4j
pip3 install --user pymgclient
pip3 install --user wheel
pip3 install --user redisgraph redisgraph-bulk-loader
pip3 install --user psycopg2-binary
pip3 install --user mysql-connector-python
pip3 install --user SPARQLWrapper
#pip3 install --user pyodbc virtuoso

# visualization
pip3 install --user matplotlib pandas seaborn natsort
