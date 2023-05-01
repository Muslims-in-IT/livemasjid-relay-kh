# livemasjid-relay-kh

A Docker image for Icecast-KH edition.

```
docker build -t livemasjid-relay-kh:latest 

docker run --rm -it -p 8000:8000/tcp --env-file .env livemasjid-relay-kh:latest
```
