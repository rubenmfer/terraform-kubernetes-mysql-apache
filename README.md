## CREAR IMAGEN DOCKER

minikube start  
eval $(minikube docker-env)             # Unix shells  
minikube docker-env | Invoke-Expression # PowerShell  
docker build -t miwebapp:0.0.1 .

## CREAR ARCHIVO  "terraform.tfvars" 

mysqlrootpass   = "XXXXXXXXXX"  
mysqldb         = "XXXXXXXXXX"  
mysqluser       = "XXXXXXXXXX"  
mysqluserpass   = "XXXXXXXXXX"

**********

terraform init  
terraform plan  
terraform apply  

##  SERVICIO MIWEBAPP 
kubectl port-forward service/miwebapp 81:80

##  SERVICIO MYSQL 
kubectl port-forward service/mysql 3306:3306

##  SERVICIO PHPMYADMIN 
kubectl port-forward service/phpmyadmin 80:80

##  NAVEGADOR WEB 

http://localhost:81/

http://localhost:80/