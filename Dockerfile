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
   apt-get install -y docker-ce-cli && \
   curl -L https://github.com/vmware/govmomi/releases/download/v0.22.1/govc_linux_amd64.gz | gunzip -c > /usr/local/bin/govc && \
   chmod +x /usr/local/bin/govc
USER 1000
