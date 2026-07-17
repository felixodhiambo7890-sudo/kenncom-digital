#!/usr/bin/env bash

# Formatting bounds configuration paths
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

clear
echo -e "${CYAN}=================================================${NC}"
echo -e "${CYAN}    KENNCOM DIGITAL CENTER - WORKSPACE UTILITY   ${NC}"
echo -e "${CYAN}=================================================${NC}"
echo -e "1) [DEPLOY]  Execute Secure Live Sync (upload.sh)"
echo -e "2) [PREVIEW] Launch Local Python Preview Engine (Port 8080)"
echo -e "3) [PATCH]   Resolve Text Editor LSP Binary Warnings"
echo -e "4) [EXIT]    Close Controller Interface Terminal"
echo -e "${CYAN}-------------------------------------------------${NC}"
read -p "Select operational link vector number [1-4]: " OPTION

case $OPTION in
    1)
        clear
        if [ -f ./upload.sh ]; then
            ./upload.sh
        else
            echo -e "Deployment engine file missing."
            exit 1
        fi
        ;;
    2)
        clear
        echo -e "${GREEN}[RUNNING] Local testing runtime platform active...${NC}"
        echo -e "Open your browser map link: ${CYAN}http://localhost:8080${NC}"
        echo -e "${YELLOW}Press [CTRL + C] inside this terminal window to stop the server.${NC}"
        echo ""
        python3 -m http.server 8080
        ;;
    3)
        clear
        echo -e "${CYAN}[PATCHING] Mapping language compiler servers globally...${NC}"
        sudo apt update && sudo apt install -y nodejs npm
        sudo npm install -g vscode-langservers-extracted
        echo -e "${GREEN}[SUCCESS] Language binaries registered into global environment PATH.${NC}"
        ;;
    4)
        echo "Closing session linkages. Standby..."
        exit 0
        ;;
    *)
        echo "Invalid routine allocation strategy selected."
        exit 1
        ;;
esac
