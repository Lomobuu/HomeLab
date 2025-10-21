# HomeLab
Homelab project to learn all things DevOps (SRE, Cloud platform, platform engineering) - From Scratch - On Windows 11

Current Scope for this Homelab:

### Part 1 - Kubernetes
Setting up a local Kubernetes environment using Podman. Troubleshooting and using hands-on with kubernetes to learn:
- Nodes / Control Plane
- Pods, namespaces & replicasets
- Deployments
- Services
- Imperative vs declarative runs(dry-run=client)
- Backup - etcd
- Networking
- Policies
- Troubleshooting / Debugging (Documentation along the way)

### Podman Setup
- Install
- Install Kind Extension
- Setup Kind Cluster
- Install kubectl (under settings->Cli tools)

### kubectl Deployments
kubectl create deployment nginx --image="nginx" --replicas="2"
kubectl expose deployment nginx --port="80" --type="NodePort"
NEED TO PORT FORWARD!!!
kubectl port-forward service/nginx 8080:80
http://localhost:8080/

Cleanup:
kubectl delete deployment nginx
kubectl delete svc nginx

# Overall Setup / Requirements
- Visual Studio Code - https://code.visualstudio.com/docs/?dv=win64user
- Git - https://git-scm.com/install/windows
- Podman - https://podman.io/ + Setup(WSL, Kind)
- WSL - wsl.exe --install + restart
- Posh-git (powershell extension)

Set-ExecutionPolicy -Scope LocalMachine -ExecutionPolicy RemoteSigned -Force
Install-Module posh-git -Scope CurrentUser -Force
Import-Module posh-git