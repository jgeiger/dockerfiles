## vault

Add your config files as a volume into the container.
Add your cert files as a volume into the container.

```shell
docker run --rm --volume=./config:/config --volume=$HOME/certs:/certs jgeiger/vault
```

