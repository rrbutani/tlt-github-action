ARG VER=0.4.2

# Base container:
FROM rrbutani/arm-llvm-toolchain:${VER}

ARG VER

RUN : \
 && git clone https://github.com/rrbutani/tm4c-llvm-toolchain.git /opt/tlt \
 && cd /opt/tlt \
    && git checkout ${VER} \
 && cd - \
 && ln -s /opt/tlt/tlt.sh /usr/bin/tlt

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
