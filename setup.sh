#!/bin/bash

# Datapack Boilerplate Setup Script
# Usage: ./setup.sh <your-datapack-name>

DATAPACK_NAME=$1

if [ -z "$DATAPACK_NAME" ]; then
    echo -e "\033[0;31mError: Please provide a datapack name\033[0m"
    echo ""
    echo -e "\033[0;33mUsage: ./setup.sh <datapack-name>\033[0m"
    echo -e "\033[0;33mExample: ./setup.sh your_datapack_name\033[0m"
    exit 1
fi

# Validate datapack name (lowercase, no spaces, alphanumeric and underscores only)
if [[ ! "$DATAPACK_NAME" =~ ^[a-z0-9_]+$ ]]; then
    echo -e "\033[0;31mError: Datapack name must be lowercase, alphanumeric, and use underscores only\033[0m"
    echo -e "\033[0;33mExample: super_jump (not Super Jump or super-jump)\033[0m"
    exit 1
fi

echo -e "\033[0;32mSetting up datapack: $DATAPACK_NAME\033[0m"

# Check if namespace folder exists
if [ ! -d "data/namespace" ]; then
    echo -e "\033[0;31mError: data/namespace folder not found. Are you in the correct directory?\033[0m"
    exit 1
fi

# Rename namespace folder
echo -e "\033[0;36mRenaming namespace folder...\033[0m"
mv data/namespace "data/$DATAPACK_NAME"

# Update load.json
echo -e "\033[0;36mUpdating load.json...\033[0m"
sed -i '' "s/namespace:load/${DATAPACK_NAME}:load/g" data/minecraft/tags/function/load.json

# Update tick.json
echo -e "\033[0;36mUpdating tick.json...\033[0m"
sed -i '' "s/namespace:tick/${DATAPACK_NAME}:tick/g" data/minecraft/tags/function/tick.json

echo ""
echo -e "\033[0;32mSetup complete! Your datapack '$DATAPACK_NAME' is ready to use.\033[0m"