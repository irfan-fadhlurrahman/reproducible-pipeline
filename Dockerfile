FROM prefecthq/prefect:2.8.5-python3.9

RUN apt-get -y update && \
    apt-get -y install unzip wget curl gnupg && \
    echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg  add - && \
    apt-get -y update && \
    apt-get -y install google-cloud-sdk

COPY requirements.txt .
RUN python3 -m venv /opt/venv
RUN /opt/venv/bin/pip install -r requirements.txt

EXPOSE 4200

ENTRYPOINT [ "bash" ]