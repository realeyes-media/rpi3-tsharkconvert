# rpi3-tsharkconvert
Raspberry Pi 3 Docker container for combining multiple PCAP files and running a TCP reassembly on the packets. (this won't run on x86)

Running with the default CMD for the Docker image (and specifying a volume or bind mount) will combine all the volume's *.pcap files and desegment the TCP packets while filtering with a read filter for "http" and placing the final output of outputParsedAndCombined.pcap into the same directory. If you'd like a custom filename, write your own run CMD in exec form with the new filename as the first (and only) input.

For example, you can set the outfile to namethefilethis.pcap with:
docker run -it --memory=200m -v /opt/tsharklogs:/opt/tsharklogs quay.io/realeyes/rpi3-tsharkconvert [ "/opt/desegmentandmerge.sh", "namethefilethis.pcap" ]
