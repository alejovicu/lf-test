#! /usr/bin/sh

pip install --user -r dependencies

docker rm -f selenium-hub
docker rm -f selenium-node-chrome
docker rm -f selenium-node-firefox

echo -e "\n\nStarting Selenium grid hub..."
docker run -d -p 4444:4444 --name selenium-hub selenium/hub:3.141.59-bismuth
echo -e "Hub started\n"

if [ "$1" == "-d" ]; then
    echo -e "\n\nStarting Selenium Grid Nodes deployed in debug mode..."
    docker run -d -P -p 5900:5900 --name selenium-node-chrome --link selenium-hub:hub -v /dev/shm:/dev/shm selenium/node-chrome-debug:3.141.59-bismuth
    docker run -d -P -p 5901:5900 --name selenium-node-firefox --link selenium-hub:hub -v /dev/shm:/dev/shm selenium/node-firefox-debug:3.141.59-bismuth
    echo -e "Nodes started\n"
else
    echo -e "\n\nSelenium Grid Nodes deployed in production mode"
    docker run -d --link selenium-hub:hub -p 5900:5900 --name selenium-node-chrome -v /dev/shm:/dev/shm selenium/node-chrome:3.141.59-bismuth
    docker run -d --link selenium-hub:hub -p 5901:5900 --name selenium-node-firefox -v /dev/shm:/dev/shm selenium/node-firefox:3.141.59-bismuth
    echo -e "Nodes started\n"
fi

set -e

while ! curl -sSL "http://localhost:4444/wd/hub/status" 2>&1 \
        | jq -r '.value.ready' 2>&1 | grep "true" >/dev/null; do
    echo 'Waiting for the Grid'
    sleep 1
done

>&2 echo "Selenium Grid is up - Ready fot test execution"