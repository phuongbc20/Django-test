Build image
```
docker build -t registry.gitlab.vng.com/phuongdt7/django:1.0 .
```
Push image
```
docker push registry.gitlab.vng.com/phuongdt7/django:1.0
```
Run image
```
docker run -it -d -p 80:80 -v /home/user/app:/usr/src/app/ --env-file ./.env registry.gitlab.vng.com/phuongdt7/django:1.0
```