FROM amazonlinux:2023

RUN yum install -y \
    unzip \
    git \
    jq \
    tar \
    gzip \
    wget \
    curl

RUN curl -LO https://releases.hashicorp.com/terraform/1.9.5/terraform_1.9.5_linux_amd64.zip

RUN unzip terraform_1.9.5_linux_amd64.zip

RUN mv terraform /usr/local/bin/

RUN curl -LO "https://dl.k8s.io/release/v1.30.0/bin/linux/amd64/kubectl"

RUN chmod +x kubectl

RUN mv kubectl /usr/local/bin/

RUN curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
