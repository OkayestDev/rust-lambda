FROM public.ecr.aws/lambda/provided:al2.2023.02.13.17

RUN yum -y update
RUN yum -y install curl
RUN yum install -y gcc gcc-c++ make

RUN curl https://sh.rustup.rs -sSf | bash -s -- -y

ENV PATH=$PATH:/root/.cargo/bin

COPY . /var/task

RUN cargo build

# ENTRYPOINT ["tail", "-f", "/dev/null"]

CMD ["/var/task/target/debug/rust_lambda"]