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
DIR=~/git/EventSubscriber/
if [ -d $DIR ]; then
  # Take action if $DIR exists. #
  echo "Cleaning up ~/git/EventSubscriber folder before cloning."
  rm -r -f ~/git/EventSubscriber/
else
  ###  Control will jump here if $DIR does NOT exists ###
  echo "${DIR} not found."
  
fi

echo "Cloning https://github.com/redtopdev/EventSubscriber.git"
git clone https://github.com/redtopdev/EventSubscriber.git
echo "Building ~/git/EventSubscriber/EventSubscriber.sln"
dotnet build --configuration debug ~/git/EventSubscriber/EventSubscriber.sln
echo "Publishing ~/git/EventSubscriber/Engaze.EventSubscriber/Engaze.EventSubscriber.csproj to ~/engaze/svc/eventsubscriber/  folder."
dotnet publish --output ~/engaze/svc/eventsubscriber/ ~/git/EventSubscriber/Engaze.EventSubscriber/Engaze.EventSubscriber.csproj