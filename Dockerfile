FROM ubuntu:latest

# Install required dependencies
RUN apt-get update && \
    apt-get upgrade -y
    apt-get install -y wget
    

# Download and run Fastpanel installation script
RUN wget http://repo.fastpanel.direct/install_fastpanel.sh -O - | bash

# Expose Fastpanel ports (adjust as per your requirements)
EXPOSE 80 443 8888 3306 21