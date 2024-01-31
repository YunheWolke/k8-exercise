# docker build process, examples
# docker build -t [docker-id]/[docker-image-name]:latest -t [same docker-id]/[same docker-name]:$GIT_SHA -f ./client/Dockerfile ./client
# docker push [docker-id]/[docker-image-name]:latest
# docker push [docker-id]/[docker-image-name]:$GIT_SHA

# Deployment command
kubectl apply -f k8s
# Make sure the deployed image always the latest
kubectl set image deployment/client-deployment client=stephengrider/multi-client:$GIT_SHA
kebuctl set image deployment/server-deployment server=stephengrider/multi-server:$GIT_SHA
kubectl set image deployment/worker-deployment worker=stephengrider/multi-worker:$GIT_SHA