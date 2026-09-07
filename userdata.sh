#!/bin/bash

# Update system packages
yum update -y

# Install Apache Web Server
yum install -y httpd

# Enable and start Apache
systemctl enable httpd
systemctl start httpd

# Create the website
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AWS EC2 Project</title>
</head>

<body>
    <h1>AWS EC2 Static Website Deployment</h1>

    <h2>Created by Karthik</h2>

    <p>
        This website was automatically deployed on an
        Amazon Linux EC2 instance using EC2 User Data.
    </p>

    <h3>Technologies Used</h3>

    <ul>
        <li>AWS EC2</li>
        <li>Amazon Linux</li>
        <li>Apache Web Server</li>
        <li>EC2 User Data</li>
        <li>HTML</li>
    </ul>

    <p>
        Server Hostname:
        <strong>$(hostname -f)</strong>
    </p>

    <h3>Project: Automated Static Website Deployment</h3>
</body>
</html>
EOF

# Restart Apache
systemctl restart httpd