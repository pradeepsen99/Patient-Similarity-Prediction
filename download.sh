#ENV vars
GREEN='\033[1;32m'
NC='\033[0m'

#Checking for relevant commands
if ! command -v wget &> /dev/null
then
    echo "${GREEN}wget could not be found - terminating${NC}"
    exit
fi

#Download all parts of orbda dataset
echo "${GREEN}Deleting data directory IF exists...${NC}"
rm -rf orbda

echo "${GREEN}Creating dataset directory${NC}"
mkdir orbda
cd orbda

echo "${GREEN}Downloading part 0...${NC}"
wget http://www.lampada.uerj.br/arquivosdb/part0.zip
unzip part0.zip
rm part0.zip

echo "${GREEN}Downloading part 1...${NC}"
wget http://www.lampada.uerj.br/arquivosdb/part1.zip
unzip part1.zip
rm part1.zip

echo "${GREEN}Downloading part 2...${NC}"
wget http://www.lampada.uerj.br/arquivosdb/part2.zip
unzip part2.zip
rm part2.zip

echo "${GREEN}Downloading part 3...${NC}"
wget http://www.lampada.uerj.br/arquivosdb/part3.zip
unzip part3.zip
rm part3.zip

echo "${GREEN}Downloading part 4...${NC}"
wget http://www.lampada.uerj.br/arquivosdb/part4.zip
unzip part4.zip
rm part4.zip

echo "${GREEN}Downloading part 5...${NC}"
wget http://www.lampada.uerj.br/arquivosdb/part5.zip
unzip part5.zip
rm part5.zip

echo "${GREEN}======= DONE DOWNLOADING =======${NC}"