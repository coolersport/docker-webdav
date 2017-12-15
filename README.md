# WebDAV container

You can run this container in following way. You can then access the WebDAV instance at `http://localhost:8080/webdav`. Internally the folder `/var/webdav` is used as WebDAV root.

```
docker run -d -e USERNAME=test -e PASSWORD=test -p 8080:8080 coolersport/webdav
```

All uploaded content can be browsed from root `http://localhost:8080` 