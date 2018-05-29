FROM quay.io/realeyes/tshark-rpi3

RUN [ "cross-build-start" ]

COPY desegmentandmerge.sh /opt/desegmentandmerge.sh

RUN chmod +x /opt/desegmentandmerge.sh && mkdir -p /opt/tsharklogs

WORKDIR /opt/tsharklogs

VOLUME /opt/tsharklogs

RUN [ "cross-build-end" ]

CMD ["/opt/desegmentandmerge.sh"] 
