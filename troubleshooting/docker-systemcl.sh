# https://stackoverflow.com/questions/44678725/cannot-connect-to-the-docker-daemon-at-unix-var-run-docker-sock-is-the-docker

systemctl unmask docker.service
systemctl unmask docker.socket
systemctl start docker.service

# https://hackmamba.io/blog/2022/09/best-practices-when-using-docker-compose/
# Basic function options
x-function: &function
  labels:
    function: "true"
  depends_on:
    - gateway
  networks:
    - functions
  deploy:
    placement:
      constraints:
        - 'node.platform.os == linux'