FROM prefecthq/prefect:2.8.5-python3.9

# General Packages
RUN apt-get -y update && \
    apt-get -y install unzip wget git jq  

# Google Cloud SDK
# RUN apt-get -y update && \
#     apt-get -y install gnupg && \
#     echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
#     curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg  add - && \
#     apt-get -y update && \
#     apt-get -y install google-cloud-sdk

# Python Virtual Environment
COPY requirements.txt .
RUN python3 -m venv /opt/venv

ENV PATH "/opt/venv/bin:$PATH"

RUN /opt/venv/bin/pip install -U pip
RUN /opt/venv/bin/pip install -r requirements.txt

RUN which python

# For Prefect API
EXPOSE 4200

ENTRYPOINT [ "bash" ]