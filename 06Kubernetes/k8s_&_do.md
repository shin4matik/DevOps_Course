# Kubernetes & DigitalOcean

### Install doctl
```
wget https://github.com/digitalocean/doctl/releases/download/v1.64.0/doctl-1.64.0-linux-amd64.tar.gz

tar xf ~/doctl-1.64.0-linux-amd64.tar.gz

sudo mv ~/doctl /usr/local/bin
```
### Create an API token

### Login to DO by docli
```
doctl auth init
>>Enter access token
doctl auth list
```

### Create a new project
```
doctl projects create --name k8s-project --purpose testing
doctl projects list
# grab the project ID
```

### Gather our options

https://www.digitalocean.com/docs/kubernetes/
```
doctl kubernetes options regions
doctl kubernetes options versions
doctl kubernetes options sizes
```
### Create our cluster
```
#full list of options
doctl kubernetes cluster create --help

doctl kubernetes cluster create k8s-cluster \
--version 1.21.2-do.2 \
--count 1 \
--size s-1vcpu-2gb \
--region fra1
```

### Get a kubeconfig for our cluster

```
doctl kubernetes cluster kubeconfig save k8s-cluster

#grab the config if you want it
cp ~/.kube/config .
```

### Get kubectl
https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/




### Create and add project resources
```
#create namespace
kubectl create ns example-app
```
*****
```
Namespaces

In Kubernetes, namespaces are a way to divide cluster resources between multiple users. They’re useful when you have many users working on the same cluster. You can create multiple namespaces in a cluster, and resources in one namespace are hidden from other namespaces.
```
*****
```
#lets create some resources.
kubectl apply -n example-app -f secrets/secret.yaml
kubectl apply -n example-app -f configmaps/configmap.yaml
kubectl apply -n example-app -f deployments/deployment.yaml

#remember to change the `type: LoadBalancer`
kubectl apply -n example-app -f services/service.yaml
```

### service.yaml
```bash
apiVersion: v1
kind: Service
metadata:
  name: example-service
  labels:
    app: example-app
spec:
  type: LoadBalancer
  selector:
    app: example-app
  ports:
    - protocol: TCP
      name: http
      port: 80
      targetPort: 5000
```



### Clean up
```
doctl kubernetes cluster delete k8s-cluster

# remember to delete the load balancer manually!
```


*****
Thanks:
* https://www.youtube.com/watch?v=PvfBCE-xgBY
* https://docs.digitalocean.com/reference/doctl/how-to/install/
* https://docs.digitalocean.com/products/kubernetes/how-to/







