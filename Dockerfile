FROM centos:latest

# Update system packages and install required dependencies
RUN yum -y update && \
    yum -y install wget && \
    yum -y install openssl && \
    yum clean all

# Install CyberPanel
RUN wget -O installer.sh https://cyberpanel.net/install.sh && \
    chmod +x installer.sh && \
    sh installer.sh

# Expose CyberPanel ports
EXPOSE 8090 8098 8099

# Start CyberPanel service
CMD ["sh", "-c", "/usr/local/CyberCP/bin/python manage.py runserver 0.0.0.0:8090"]
