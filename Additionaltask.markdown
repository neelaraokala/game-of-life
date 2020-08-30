## How would you approach Microservice deployments using Azure?
In my point of view To microservice deployments cloud is not at all a priority , it always depends on the kubernetes controllers which we are using.
1. in kubernetes we have a several type of controllers to deploy application.
2. But to maintain desired state of pod replicas and maintain the updates(rollouts) and undo the rollback in kubernets Deployments COntroller is the best option.
3. so to deploy your application Deployments is the beast approch 
4. and while upgrading the application you don't need to shutdown the total application by following the Strategy which is provided in Deployments controller.
5. if the updated  version is not working properly , you can rollback to previous version easily.
6. to see the kubernetes Deployments API in API References (Refer)(https://v1-16.docs.kubernetes.io/docs/reference/generated/kubernetes-api/v1.16/)  
 