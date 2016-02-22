## haproxy with consul-template

Add your config files as a volume into the container.

```shell
docker run --rm --volume=./config:/config jgeiger/haproxy-template
```
