#################################################################
#   destroy_env.sh
#   
#   This script destroys python virtual environment and 
#   uninstalls all installed dependencies
#################################################################
#!/bin/zsh
set -euo pipefail

CURRENT_DIR_NAME="$(basename "$PWD")"
ENV_NAME="${CURRENT_DIR_NAME}_environment"
ENV_DIR="./$ENV_NAME"
REQUIREMENTS_FILE="./env/requirements.txt"


if [ ! -d "$ENV_DIR" ]; then
  echo "Virtual environment directory '$ENV_DIR' does not exist. Nothing to destroy."
  exit 1
fi

uninstall_packages() {
  if [ -f "$REQUIREMENTS_FILE" ]; then
    echo "Uninstalling packages listed in requirements.txt..."
    pip uninstall -r "$REQUIREMENTS_FILE" -y
  else
    echo "requirements.txt not found! Skipping uninstall."
  fi
}

if [ -n "${VIRTUAL_ENV-}" ] && [ "$(realpath "$VIRTUAL_ENV")" = "$(realpath "$ENV_DIR")" ]; then
  echo "Already inside the virtual environment: $VIRTUAL_ENV"
  uninstall_packages
else
  echo "Activating virtual environment at $ENV_DIR..."
  source "$ENV_DIR/bin/activate"
  uninstall_packages
fi

echo "Removing virtual environment directory $ENV_DIR..."
rm -rf "$ENV_DIR"

echo "Virtual environment '$ENV_NAME' destroyed successfully."
