#!/bin/bash

# Debug the current directory
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
echo "Current script directory: $SCRIPT_DIR"

# run Medplum FHIR server
cd packages/server
npm run dev &

# run Medplum App react
cd ../app
npm run dev -- --host &

# Run Caddy
cd ../../
sudo caddy run