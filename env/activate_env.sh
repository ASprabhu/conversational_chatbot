#################################################################
#   activate_env.sh
#   
#   This script sets up a python virtual environment and 
#   installs the required dependencies
##################################################################
#!/bin/zsh

CURRENT_DIR_NAME="$(basename "$PWD")"
ENV_NAME="${CURRENT_DIR_NAME}_environment"
ENV_DIR="./$ENV_NAME"

if [ ! -d "$ENV_DIR" ]; then
  echo "Virtual environment does not exist. Run create_env.sh first."
  return 1
fi

echo "Activating virtual environment: $ENV_NAME"
source "$ENV_DIR/bin/activate"
