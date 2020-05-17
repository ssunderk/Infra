DIR=~/git/
if [ -d $DIR ]; then
  # Take action if $DIR exists. #
  echo "git folder exists"
else
  ###  Control will jump here if $DIR does NOT exists ###
  echo "Folder  ${DIR} not found. Creating the same."
  #mkdir ~/git/
fi

cd ~/git
DIR=~/git/EventQuery/
if [ -d $DIR ]; then
  # Take action if $DIR exists. #
  echo "Cleaning up ~/git/EventQuery folder before cloning."
  rm -r -f ~/git/EventQuery/
else
  ###  Control will jump here if $DIR does NOT exists ###
  echo "${DIR} not found."
  
fi

echo "Cloning https://github.com/redtopdev/EventQuery.git"
git clone https://github.com/redtopdev/EventQuery.git
echo "Building ~/git/EventQuery/EventQuery.sln"
dotnet build --configuration debug ~/git/EventQuery/EventQuery.sln
echo "Publishing ~/git/EventQuery/Service/EventQuery.csproj to ~/engaze/api/eventquery/  folder."
dotnet publish --output ~/engaze/api/eventquery/ ~/git/EventQuery/Service/EventQuery.csproj