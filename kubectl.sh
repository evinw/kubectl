# apply a YAML file directly from a URL with custom field selectors and dry run
kubectl apply -f https://domain.com/app.yaml --field-selector=status.phase=Running --dry-run=client

# delete pods matching a label selector
kubectl delete pods -l 'environment in (production),tier notin (frontend)'

# create a new namespace and set it in the context
kubectl create namespace newnamespace && kubectl config set-context --current --namespace=newnamespace

# execute a command in a specific pod and container
kubectl exec $(kubectl get pod -l app=app_name -o jsonpath='{.items[0].metadata.name}') -c container_name -- ls /tmp

# set up port forwarding to a service on a local port
kubectl port-forward service/new_service 8080:80

# display pods with custom columns for name, status, and restarts
kubectl get pods -o=custom-columns=NAME:.metadata.name,STATUS:.status.phase,RESTARTS:.status.containerStatuses[*].restartCount

# perform a rolling restart of all pods in a deployment
kubectl rollout restart deployment mydeployment

# export logs from all pods matching a label to separate files
kubectl get pods -l app=customapp -o jsonpath='{.items[*].metadata.name}' | xargs -I {} kubectl logs {} > {}-log.txt

# apply a resource quota to a specific namespace
kubectl create quota myquota --hard=pods=10 --namespace=mynamespace

# ddrain a node for maintenance, ignoring daemonsets and without deleting local data
kubectl drain mynode --ignore-daemonsets --delete-local-data=false

# add a taint to a node using a JSON patch
kubectl patch node mynode -p '{"spec":{"taints":[{"key":"key1","value":"value1","effect":"NoSchedule"}]}}'

# replace a secret using the contents from a file
kubectl create secret generic my-secret --from-file=my-key=file.txt --dry-run=client -o yaml | kubectl replace -f -

# copy files from a specific container in a pod to the local filesystem
kubectl cp my-pod:/path/in/pod /path/in/local -c my-container

# run an interactive shell in a new temporary pod using a specific image
kubectl run my-temp-shell --rm -i --tty --image ubuntu -- bash

# convert a manifest file from one API version to another
kubectl convert -f my-deployment.yaml --output-version apps/v1

# execute a shell command on all pods selected by a label
kubectl get pods -l app=myapp -o name | xargs -I {} kubectl exec {} -- sh -c 'echo do stuff here'

# create a job to run a command only once
kubectl run my-once-job --image=myimage --restart=Never -- command -- do something once

# apply all YAML manifests in a directory
kubectl apply -f ./my-directory/

# generate a YAML template for a new deployment without creating it
kubectl create deployment my-deployment --image=myimage --dry-run=client -o yaml

# extract and stream logs from all containers in a pod
kubectl logs my-pod --all-containers=true --follow



















