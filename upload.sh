#!/usr/bin/env bash
set -e

CYAN='\033[0;36m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${CYAN}=================================================${NC}"
echo -e "${CYAN}     INITIALIZING KENNCOM LIVE SYNC ENGINE       ${NC}"
echo -e "${CYAN}=================================================${NC}"

if [ ! -d .git ]; then
    echo -e "${RED}[ERROR] Local repository vector not found.${NC}"
    git init
    git remote add origin https://github.com
fi

CURRENT_BRANCH=$(git branch --show-current 2>/dev/null || echo "main")
if [ -z "$CURRENT_BRANCH" ]; then CURRENT_BRANCH="main"; fi

echo -e "> Staging full workspace data matrices..."
git add .

TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
COMMIT_MSG="System Sync: ${TIMESTAMP} [Automated Service Engine Deploy]"

echo -e "> Compiling compression packages..."
git commit -m "$COMMIT_MSG" || echo "> Repository state synced. Proceeding to uplink channel..."

echo -e "> Pushing secure vectors to remote branch [${CURRENT_BRANCH}]..."
if git push origin "$CURRENT_BRANCH"; then
    echo -e "${GREEN}=================================================${NC}"
    echo -e "${GREEN}     CLOUD PIPELINE CONNECTED // LINK STABLE     ${NC}"
    echo -e "${GREEN}=================================================${NC}"
else
    echo -e "${RED}[DEPLOYMENT FAIL] Handshake transmission broken.${NC}"
    exit 1
fi
