# HomeLab
Homelab project to learn all things DevOps (SRE, Cloud platform, platform engineering) - From Scratch - On Windows 11

Current Scope for this Homelab:
- Part 1 - Kubernetes
- Part 2 - Multi Environment Cloud Setup with IaC - Best Practice
- Part 3 - CI/CD Best Practice in Multi Environment
- Part 4 - Policies, Networking, IAM, Python/Scripting
- Part 5 - Pull Requests, on-prem <-> Cloud, Multi-Tenant(AWS)
- Part 6 - Pulumi, Jenkins, Helm, TF Modules, ArgoCD, GitOps
- Part 7 - Hardware(LED/Bluetooth), AI/ML

# Overall Setup / Requirements
- Visual Studio Code - https://code.visualstudio.com/docs/?dv=win64user
- Git - https://git-scm.com/install/windows
- Podman - https://podman.io/ + Setup(WSL, Kind)
- WSL - wsl.exe --install + restart
- Posh-git (powershell extension)
```
Set-ExecutionPolicy -Scope LocalMachine -ExecutionPolicy RemoteSigned -Force
Install-Module posh-git -Scope CurrentUser -Force
Import-Module posh-git
```

## Part 1 - Kubernetes
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
```
kubectl create deployment nginx --image="nginx" --replicas="2"
kubectl expose deployment nginx --port="80" --type="NodePort"
```
NEED TO PORT FORWARD!!!
```
kubectl port-forward service/nginx 8080:80
```
Navigate - http://localhost:8080/


Cleanup:
```
kubectl delete deployment nginx
kubectl delete svc nginx
```

# Part 2 - Multi Environment Cloud Setup with IaC - Best Practice
Guide Used - (https://medium.com/@bhpuri/github-actions-series-10-multi-environment-deployment-on-azure-using-github-actions-e9fac4512d79)
Use Case:
- Use terraform to set up dev,test,prod "resources" in Azure using best practice

Steps
1. Create Service Principal
2. Create Resource Group (management + dev RG)
3. Configure Resource Group Permissions
4. Configure OIDC Federated Credentials for Service Principal
5. Setup Secrets in Github Actions
6. Use Bootstrap-backend.sh Script to create storage account
7. Run Infrastructure.yaml with Dev branch to create environment in Dev.

# Debugging Notes
Port forwarding - Nodeport
- When using podman desktop and Kind the cluster is hosted in a VM/container inside the windows PC, when using nodeport, this is not yet exposed on the windows PC, port forwarding bridges the traffic from the container to the host.
```
kubectl port-forward service/nginx 8080:80
```