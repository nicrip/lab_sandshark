#!/bin/bash

## N. Rypkema rypkema@mit.edu

echo "Building Project =================================="
cd build
cmake ..
make
cd ..
echo "Finished Building Project ========================="
