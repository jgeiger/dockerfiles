## telegraf

Add your config files as a volume into the container.

/config/telegraf.conf
/config/telegraf.d/*

```shell
docker run --rm --volume=./config/:/etc/telegraf/ jgeiger/telegraf
```

