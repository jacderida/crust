FROM rust:1.29.2

WORKDIR /usr/src/crust
COPY . .
RUN apt-get update -y && \
    apt-get install -y tree && \
    mkdir /target && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* && \
    cargo build --tests --release --verbose --target-dir /target

CMD tree -d /target/release/build && tree -d /usr/local/cargo/registry && cargo test --release --verbose --target-dir /target
