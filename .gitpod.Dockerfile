FROM mcr.microsoft.com/dotnet/sdk:6.0

RUN apt-get update && apt-get install -yq \
    git \
    sudo \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/*

RUN useradd -l -u 33333 -G sudo -md /home/gitpod -s /bin/bash -p gitpod gitpod

WORKDIR /home/gitpod

USER gitpod

RUN wget https://github.com/exercism/cli/releases/download/v3.1.0/exercism-3.1.0-linux-x86_64.tar.gz \
    && mkdir -p ~/bin \
    && tar -xf exercism-3.1.0-linux-x86_64.tar.gz -C ~/bin \
    && echo 'export PATH=~/bin:$PATH' >> ~/.bashrc