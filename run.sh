#!/bin/bash 

set -e

docker build -t chrome-scraper --progress=plain .

docker run -it --rm \
	-v $PWD/your_script.py:/root/your_script.py \
       	chrome-scraper python3 /root/your_script.py

