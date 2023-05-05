# https://stackoverflow.com/questions/44678725/cannot-connect-to-the-docker-daemon-at-unix-var-run-docker-sock-is-the-docker

systemctl unmask docker.service
systemctl unmask docker.socket
systemctl start docker.service