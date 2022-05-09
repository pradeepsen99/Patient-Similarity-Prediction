GREEN='\033[1;32m'
NC='\033[0m'

chmod +x environment.sh
./environment.sh

echo "Source into created virtual environemnt"
source env/bin/activate

echo "Running python file - this will take a while...${NC}"
python3 cs598_dlh_final.py