# docker-dnsmasq

dnsmasq in a docker container for booting Raspberry Pis via network

### Usage

1. Create a [`/opt/dnsmasq.conf`](http://oss.segetech.com/intra/srv/dnsmasq.conf) file on the Docker host

	``` ini
	#dnsmasq config, for a complete example, see:
	#  http://oss.segetech.com/intra/srv/dnsmasq.conf
	#log all dns queries
	log-queries
	#dont use hosts nameservers
	no-resolv
	port=0
	dhcp-range=10.42.0.255,proxy
	log-dhcp
	enable-tftp
	tftp-root=/tftpboot
	pxe-service=0,"Raspberry Pi Boot"
	```

1. Run the container

	```
	$ docker run \
		--name dnsmasq \
		-d \
		-p 53:53/udp \
		-v /opt/dnsmasq.conf:/etc/dnsmasq.conf \
		--log-opt "max-size=100m" \
		matthiasbecker/dnsmasq-tftp
	```

1. Test it out with

	```
	$ host myhost.company <docker-host>
	Using domain server:
	Name: <docker-host>
	Address: <docker-host>#53
	Aliases:

	myhost.company has address 10.0.0.2
	```

#### MIT License

Copyright &copy; 2016 Jaime Pillora &lt;dev@jpillora.com&gt; simplified and Raspberry Pi specific configurationt by Matthias Becker

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


[dockerhub]: https://hub.docker.com/r/jpillora/dnsmasq/
