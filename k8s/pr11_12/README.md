# Артефакты к ПР №11-12

## Часть 1

### Как развернуть деплои

1. Сначала необходимо развернуть `ingress-controller`

```bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/cloud/deploy.yaml
```

2. Далее применяем все манифесты

```bash
kubectl apply -f manifests/
```

3. После чего смотрим EXTERNAL_IP, который получил `ingress`

```bash
kubectl get ingress
```

### Артефакты

Исходный код образа бэкенда - https://github.com/cowboymalboro1884/simple-flask-app

Все сущности:

![alt text](imgs/image.png)

Созданные поды:

![alt text](imgs/image-1.png)

Описание пода бэкенда:

![alt text](imgs/image-2.png)

Список svc и ingress

![alt text](imgs/image-3.png)

Скриншоты запросов к ингрессу:

![alt text](imgs/image-5.png)

![alt text](imgs/image-4.png)

![alt text](imgs/image-6.png)
