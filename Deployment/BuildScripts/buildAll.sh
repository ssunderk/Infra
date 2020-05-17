
echo "stopping Engaze.EventSubscriber.Service"
kill $(ps aux | grep 'Engaze.EventSubscriber.Service' | awk '{print $2}')
./build-scripts/build-publish-eventquery-api.sh  
./build-scripts/build-publish-managesubscriber.sh
./build-scripts/build-publish-eventoviewdataupdater.sh  
./build-scripts/build-publish-eventsubscriber.sh
echo "Running EventQuery.Service.dll"
cd ~/engaze/api/eventquery/
dotnet EventQuery.Service.dll --console &
echo "Running SubScriber.Service.dll"
cd ~/engaze/api/managesubscriber
dotnet Subscriber.Service.dll --console &
echo "Running Engaze.Evento.ViewDataUpdater.Service.dll"
cd ~/engaze/svc/eventoviewdataupdater
dotnet Engaze.Evento.ViewDataUpdater.Service.dll --console &
echo "Running Engaze.EventSubscriber.Service.dll"
cd ~/engaze/svc/eventsubscriber
dotnet Engaze.EventSubscriber.Service.dll --console &