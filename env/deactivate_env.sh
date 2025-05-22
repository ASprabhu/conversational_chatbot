#################################################################
#   activate_env.sh
#   
#   This script sets up a python virtual environment and 
#   installs the required dependencies
##################################################################
#!/bin/zsh

if [ -n "${VIRTUAL_ENV-}" ]; then
  echo "Deactivating virtual environment..."
  deactivate
else
  echo "No virtual environment is currently activated."
fi
