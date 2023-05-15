FROM mysql:latest

# Set environment variables for MySQL configuration
ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_USER=rhsalisu
ENV MYSQL_PASSWORD=Rabiu2004@

# Copy custom MySQL configuration file
COPY my.cnf /etc/mysql/my.cnf

# Run additional setup scripts, if needed
COPY setup.sql /docker-entrypoint-initdb.d/

# Expose MySQL port
EXPOSE 3306
