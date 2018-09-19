FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \
	nano \
	sudo \
    curl \
    gnupg \
    libcurl4-openssl-dev \
    apt-transport-https

RUN curl -sSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /etc/apt/trusted.gpg.d/microsoft.gpg
RUN echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-bionic-prod bionic main" > /etc/apt/sources.list.d/dotnetdev.list

RUN apt-get update && apt-get install -y \
    dotnet-sdk-2.1 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN export uid=1000 gid=1000 && \
    mkdir -p /home/ubuntu && \
    echo "ubuntu:x:${uid}:${gid}:Developer,,,:/home/ubuntu:/bin/bash" >> /etc/passwd && \
    echo "ubuntu:x:${uid}:" >> /etc/group && \
    echo "ubuntu ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/ubuntu && \
    chmod 0440 /etc/sudoers.d/ubuntu && \
    chown ${uid}:${gid} -R /home/ubuntu

ENV HOME /home/ubuntu

RUN mkdir ${HOME}/example
COPY example ${HOME}/example

RUN chown -R ubuntu ${HOME}/example && chmod -R 750 ${HOME}/example

USER ubuntu
WORKDIR ${HOME}

CMD ["/bin/bash"]
