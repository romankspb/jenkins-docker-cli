FROM jenkins/jenkins:lts
USER 0
RUN apt-get update -y && \
    apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    apt-key fingerprint 0EBFCD88 && \
    add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable" && \
   apt-get update -y && \
   apt-get install -y docker-ce-cli
USER 1000
