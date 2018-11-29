#! /usr/bin/sh
COLOR='\033[0;33m'
NC='\033[0m' 

echo -e "${COLOR}TESTS on Chrome${NC}"
export BROWSER_TO_USE=chrome
behave

echo -e "\n${COLOR}TESTS on FireFox${NC}"
export BROWSER_TO_USE=firefox
behave