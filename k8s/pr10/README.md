# Артефакты к ПР №10

1. Создали кластер в yandex cloud

![alt text](imgs/image-17.png)

2. Создали группу нод

![alt text](imgs/image-18.png)

3. Создали неймспейс nginx-ns

![alt text](imgs/image-11.png)

4. Применили deployment.yml с spec.replicas: 2

![alt text](imgs/image-12.png)

5. Получили описание конкретного пода из деплоя

![alt text](imgs/image-13.png)

6. Вывели все сущности из неймспейса

![alt text](imgs/image-14.png)

Изменим конфигурационный файл и уменьшим количество реплик с 2 до 1 (spec.replicas: 1)
Применим его
Видим что количество реплик уменьшилось
![alt text](imgs/image-15.png)

7. Получим логи пода
![alt text](imgs/image-16.png)
