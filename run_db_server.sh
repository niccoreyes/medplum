#!/bin/bash

# Function to check and kill a specific port
check_port_kill() {
    local port="$1"

    # Check if anything is running on the specified port
    if sudo lsof -i :"$port"; then
        # Get the PID of the process using the port
        local pid=$(sudo lsof -t -i :"$port")
        echo "Process with PID $pid is using port $port. Killing it..."
        sudo kill -15 "$pid"
    fi
}


# check_port_kill 3000
# check_port_kill 5173
# check_port_kill 8103
# check_port_kill 2019

# run Medplum FHIR server
cd packages/server
npm run dev&

# run Medplum App react
cd ../app
npm run dev