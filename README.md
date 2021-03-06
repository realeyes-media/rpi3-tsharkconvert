# rpi3-tsharkconvert

[![Docker Repository on Quay](https://quay.io/repository/realeyes/rpi3-tsharkconvert/status "Docker Repository on Quay")](https://quay.io/repository/realeyes/rpi3-tsharkconvert)

Raspberry Pi 3 Docker container for combining multiple PCAP files and running a TCP reassembly on the packets. (this won't run on x86)

Requires:
* Host-mounted folder with root:root file permissions on container path /opt/tsharkconvert
* cgroup_memory=1 set in /boot/cmdline.txt (to enable RPi3 to manage memory for containers)

Running with the default CMD for the Docker image (and specifying a volume or bind mount) will combine all the volume's *.pcap files and desegment the TCP packets while filtering with a read filter for "http" and placing the final output of outputParsedAndCombined.pcap into the same directory. If you'd like a custom filename, write your own run CMD with the new filename as the first (and only) input.

For example, you can set the outfile to namethefilethis.pcap with:

docker run -it --memory=200m -v /opt/tsharklogs:/opt/tsharklogs quay.io/realeyes/rpi3-tsharkconvert /opt/desegmentandmerge.sh namethefilethis.pcap
