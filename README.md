**README**

1.- Aplicar los manifiestos de kubernetes.
2.- Agregar en proxy en el Zabbix Server: zabbix-proxy.monitoring.svc.cluster.local --> Administración --> Proxies 

3.- Obtener el token:
kubectl create secret generic zabbix-api-token   --from-literal=api_token=$(kubectl create token zabbix-service-account -n monitoring)   -n monitoring
kubectl get secret zabbix-api-token -n monitoring -o jsonpath={.data.api_token}  | base64 -d

4.- Agregar el token en el template de Kubernetes en Zabbix, en la macro {$KUBE.API.TOKEN}.



Revisar:
kubectl get clusterrole zabbix-clusterrole

kubectl get serviceaccount zabbix-service-account -n monitoring
