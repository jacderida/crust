FROM rust:1.29.2

RUN apt-get update -y && \
    adduser build && \
    mkdir /target && \
    chown build:build /target && \
    mkdir /usr/src/crust && \
    chown build:build /usr/src/crust

USER build
WORKDIR /usr/src/crust
COPY . .
RUN cargo build --release --verbose --target-dir /target

CMD cargo test --release --verbose --target-dir /target
