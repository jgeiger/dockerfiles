## influxdb-ubuntu

Add your config file as a volume into the container.

```shell
docker run --rm --volume=./config/influxdb.conf:/etc/influxdb/influxdb.conf:ro jgeiger/influxdb-ubuntu
```

