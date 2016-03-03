## kapacitor

Add your config file as a volume into the container.

```shell
docker run --rm --volume=./kapacitor.conf:/etc/kapacitor/kapacitor.conf jgeiger/kapacitor
```

