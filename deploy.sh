docker build -t spiraltrip/tut-udemy-multicontainer-client:latest -t spiraltrip/tut-udemy-multicontainer-client:$SHA -f ./client/Dockerfile ./client
docker build -t spiraltrip/tut-udemy-multicontainer-server:latest -t spiraltrip/tut-udemy-multicontainer-server:$SHA -f ./server/Dockerfile ./server
docker build -t spiraltrip/tut-udemy-multicontainer-worker:latest -t spiraltrip/tut-udemy-multicontainer-worker:$SHA -f ./worker/Dockerfile ./worker

docker push spiraltrip/tut-udemy-multicontainer-client:latest
docker push spiraltrip/tut-udemy-multicontainer-server:latest
docker push spiraltrip/tut-udemy-multicontainer-worker:latest

docker push spiraltrip/tut-udemy-multicontainer-client:$SHA
docker push spiraltrip/tut-udemy-multicontainer-server:$SHA
docker push spiraltrip/tut-udemy-multicontainer-worker:$SHA

kubectl apply -f k8s

kubectl set image deployments/client-deployment client=spiraltrip/tut-udemy-multicontainer-client:$SHA
kubectl set image deployments/server-deployment server=spiraltrip/tut-udemy-multicontainer-server:$SHA
kubectl set image deployments/worker-deployment worker=spiraltrip/tut-udemy-multicontainer-worker:$SHA