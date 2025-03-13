# Base image
FROM ubuntu

RUN apt-get update && apt-get upgrade -y

# Curl tool installation 
RUN apt install -y curl

# Trivy Installation
RUN curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | \
    sh -s -- -b /usr/local/bin v0.59.1 

# GO installation 
RUN curl -O -L https://go.dev/dl/go1.24.1.linux-amd64.tar.gz

RUN rm -rf /usr/local/go && tar -C /usr/local -xzf go1.24.1.linux-amd64.tar.gz

ENV PATH=$PATH:/usr/local/go/bin
