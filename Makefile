build:
	make -C alpine
	make -C consul
	make -C redis
	make -C vault
	make -C haproxy
	make -C ubuntu
	make -C ruby
	make -C rails
	make -C influxdb
	make -C kapacitor
	make -C telegraf
	make -C chronograf
