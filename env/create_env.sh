#################################################################
#   create_env.sh
#   
#   This script sets up a python virtual environment and 
#   installs the required dependencies
#################################################################
#!/bin/zsh
set -euo pipefail

CURRENT_DIR_NAME="$(basename "$PWD")"
ENV_NAME="${CURRENT_DIR_NAME}_environment"
ENV_DIR="./$ENV_NAME"
REQUIREMENTS_FILE="./env/requirements.txt"

if [ ! -f "$REQUIREMENTS_FILE" ]; then
  echo "requirements.txt not found! Please create it before running this script."
  exit 1
fi

if [ -d "$ENV_DIR" ]; then
  echo "Virtual environment already exists at $ENV_DIR"
else
  echo "Creating virtual environment: $ENV_NAME"
  python3 -m venv "$ENV_DIR"
fi

echo "Installing packages from requirements.txt..."
"$ENV_DIR/bin/pip" install --upgrade pip
"$ENV_DIR/bin/pip" install -r "$REQUIREMENTS_FILE"

echo "Environment created and packages installed in $ENV_DIR"

