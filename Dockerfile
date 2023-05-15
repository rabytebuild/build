FROM ubuntu:latest

# Install required packages
RUN apt-get update && \
    apt-get install -y wget && \
    apt-get clean

# Download aaPanel installation script
RUN wget -O install.sh http://www.aapanel.com/script/install-ubuntu_6.0_en.sh && \
    chmod +x install.sh && \
    sed -i 's/bash/sh/g' install.sh

# Install aaPanel without shell prompt
RUN echo | ./install.sh

# Expose aaPanel ports
EXPOSE 8888 888 21 20 30000-30009

# Start aaPanel service
CMD ["sh", "-c", "/etc/init.d/bt start && tail -f /dev/null"]
