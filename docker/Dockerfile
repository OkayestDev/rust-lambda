FROM public.ecr.aws/lambda/provided:al2.2023.02.13.17

RUN yum -y update
RUN yum -y install curl

RUN curl https://sh.rustup.rs -sSf | bash -s -- -y

RUN PATH=$PATH:/root/.cargo/bin

# ENTRYPOINT './target/debug/rust_lambda';

# ENTRYPOINT ["tail", "-f", "/dev/null"]

CMD ["/target/debug/rust_lambda"]