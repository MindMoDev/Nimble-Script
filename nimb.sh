echo "
🌟 This script is created by the team of DailyBucks. 🌟
For support, please join our Discord community at:
👉 https://discord.gg/dailybucks 👈
"
echo '
                                                                                
                            ..   ..           ,.    ,                           
                      ,..* /(/**************,,,,,,**(* *  .                     
                  ..* &(//*(&    *(.. .,. . ..#*    &/,,,*( *                   
              /,. @#(/&...**                         **   &,,,(   .             
            ,. @#(#../.                ,                  .*  /,,*              
         ,*(@%##..,   ......          .. .                    ,  /,*@, .        
        *(@&(%,*,  ..........        ,,. ..                     ,, &,*#,.       
      /.@&##,*  .............       ,,,. ,..                       * &**@..     
     * @%&,,. ...............      ,,,,. ,,,,                       ,. (*/ .    
   .,,&#*,.  ................     ,,,,,. ,,,,,                        ..(*/ ..  
  .,/%(... ..................... ,,,,,,, ,,,,,,                        .../(.,  
  , %(,.. ......................,,,,,,,, ,,,,,,,                 .....  ..,/#.* 
 ,,%((..  .....................,,,******.****,,,, .            .......   ,.((#.#
 ..(/,.. .....................**********.********* .....      .........  .../( *
 .(/&.*  ....................*****//////,/////***** ...................   *.((%,
 .//(..  ...................**///////((/,((///////**..................    ,.//#.
 .**(..   .................*////(((((((/*(((((((////* ...............     ,.//#.
  ,*#...    ..............////(((((####//####(((((//// ..........        *../*(.
  ,**       .............////((((##%%%%/(%%%%##((((//// .........          .**,.
   ,*%...    ...........*///((((##%%%%%((&%%%%##((((///* .......        . ./**  
    **# *.   ..........**///((((##%%%%&((&%%%%###(((///** ......       /. (,,   
   ..**% ..   ........***////(((##%%%%%#(%%%%%##((((///*** .....      ,  (,,    
     ./*&.. .   .....****////(((((##%%%%/%%%###((((////****.....     . .(,*     
      .*//, , ...........*/////((((((##&*##((((((/////*...........   *.((%.
        .%/(.., ............@////((((((&*((((((/////#............ . .*,/        
         (.&((,.. .........,,,,%#//((((&*((((//#%%,,,.........,.. ***(          
            ,&#/#...........,,,,,,&&.((&,((@&&&,,,,,,......*,...#***.           
              &,@(/&....  ....,,,****&&&/&&@****,,,.... ,...,(**#.              
                  ,.#((%/.,,,*. .*............./. ,*,,,.((///..                 
                      ,,/###(%** ,.%&%%%%%%&@%.,.//(((((,.,                     
                            *///@@@@@@@@@@@@@@@@&///*                           
'

# Exit immediately if a command exits with a non-zero status
set -e

# Update system and install Go
echo "🔄 Updating system and installing Go..."
sudo apt update
sudo apt install -y tmux build-essential make python3-venv wget

echo "⬇️ Downloading Go..."
wget https://go.dev/dl/go1.22.1.linux-amd64.tar.gz
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf go1.22.1.linux-amd64.tar.gz

echo "🔧 Setting up Go environment..."
export PATH=$PATH:/usr/local/go/bin

# Persist the PATH change for future sessions
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.profile

# Clone into miner and compile
echo "📂 Creating directory and cloning repository..."
mkdir -p /home/clore/nimble && cd /home/clore/nimble
git clone https://github.com/nimble-technology/nimble-miner-public.git
cd nimble-miner-public

# Edit requirements.txt to run lower version of numpy
echo "✏️ Editing requirements.txt..."
rm requirements.txt
echo '
requests==2.31.0
torch==2.2.1
accelerate==0.27.0
transformers==4.38.1
datasets==2.17.1
numpy==1.24
gitpython==3.1.42' > requirements.txt

# Update git files and install miner
echo "🔄 Updating repository and installing miner..."
git pull
make install

# Change fsspec version and install prettytable
echo "🔧 Changing fsspec version and installing prettytable..."
sudo pip uninstall -y fsspec
sudo pip install 'fsspec==2023.10.0' prettytable

# Install requirements globally
echo "📦 Installing requirements globally..."
sudo pip install -r requirements.txt

# Activate the miner
echo "⚙️ Activating the miner environment..."
source ./nimenv_localminers/bin/activate

# Start the miner in a new tmux session
echo "🚀 Starting the miner in a new tmux session with 'sudo tmux new-session -d -s Nimble \"make run addr=YOUR_NIMBLE_ADDRESS\"'..."
# sudo tmux new-session -d -s Nimble 'make run addr=YOUR_NIMBLE_ADDRESS'