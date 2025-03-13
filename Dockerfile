FROM ubuntu

RUN apt-get update && apt-get upgrade -y

RUN apt install -y curl

RUN curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | \
    sh -s -- -b /usr/local/bin v0.59.1
COPY html.tpl /report/templete
