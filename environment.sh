GREEN='\033[1;32m'
NC='\033[0m'

echo "${GREEN}This sets up the python virtual environment\n"

function remove_virtualenv {
    local TEMP_ENV=$VIRTUAL_ENV
    echo "Deleting ${TEMP_ENV}"
    rm -rf "$VIRTUAL_ENV"
    deactivate
    echo "\nVirtual environment removed."
}

if [[ `find . -name "\activate"` != "" ]]; then
    source `find . -name "\activate"`
fi

if [[ $VIRTUAL_ENV == "" ]]; then
    echo "No existing virtual environment detected. Will create new one"
else
    echo "Virtual environment detected at: $VIRTUAL_ENV"
    read -p "Would you like to deleting existing environemtn and reinstall dependencies? [y/n]" yn
    if [[ "$yn" == "n" ]]; then
        echo "\n\nExiting...."
        exit 1
    fi    
    remove_virtualenv
fi

echo "\nInstalling Virtual environment with requirements.txt${NC}"

if [[ `find . -name "requirements.txt"` == "" ]]; then
    echo "No requirements.txt file found... Please download it!"
    exit 1
fi

python3 -m venv env
source env/bin/activate
pip3 install -r requirements.txt

echo "${GREEN}\n\nEnvironment sucessfully created at ${VIRTUAL_ENV}${NC}"