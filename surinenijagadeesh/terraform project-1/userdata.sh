#!/bin/bash
# sleep 60
#=======================================================
# Project-1 : 2-Tier Web Application
# File      : userdata.sh
# Purpose   : Install and Start Apache Web Server
#=======================================================

# Update all installed packages
yum update -y

# Install Apache Web Server
yum install -y httpd

# Enable Apache Service
systemctl enable httpd

# Start Apache Service
systemctl start httpd

#=======================================================
# Create Default Web Page
#=======================================================

cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Tech Enthusiastic | Project-1</title>

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

body{
    font-family:Arial,Helvetica,sans-serif;
    background:#F4F8FC;
    color:#2D3748;
    line-height:1.6;
}

header{
    background:#005691;
    color:#ffffff;
    text-align:center;
    padding:35px;
    box-shadow:0 4px 12px rgba(0,0,0,.15);
}

header h1{
    font-size:40px;
    margin-bottom:10px;
}

header p{
    font-size:18px;
}

section{
    width:85%;
    margin:30px auto;
    background:#ffffff;
    padding:25px;
    border-radius:12px;
    border-left:6px solid #005691;
    box-shadow:0 4px 12px rgba(0,0,0,.08);
}

section h2{
    color:#005691;
    border-bottom:2px solid #005691;
    padding-bottom:8px;
    margin-bottom:15px;
}

section h3{
    color:#1E3A5F;
    margin-bottom:10px;
}

ol,ul{
    padding-left:25px;
}

li{
    margin:10px 0;
}

pre{
    background:#EEF6FF;
    padding:20px;
    border-radius:8px;
    overflow:auto;
}

footer{
    background:#005691;
    color:#ffffff;
    text-align:center;
    padding:25px;
    margin-top:40px;
}

footer hr{
    width:60%;
    margin:15px auto;
}
</style>
</head>

<body>

<header>
<h1>Tech Enthusiastic</h1>
<p>Learn • Build • Deploy</p>
</header>

<section>
<h2>Welcome to Jagadeesh Web Server</h2>
<h3>Project-1 : 2-Tier Web Application Infrastructure</h3>
<p>
This project demonstrates how Terraform provisions a complete
2-Tier Web Application Infrastructure on Amazon Web Services (AWS).
</p>
</section>

<section>
<h2>Infrastructure Deployment Workflow</h2>
<ol>
<li>Configure Remote Backend (Amazon S3)</li>
<li>Configure AWS Provider</li>
<li>Create Amazon VPC</li>
<li>Create Public Subnet</li>
<li>Create Private Subnet</li>
<li>Attach Internet Gateway</li>
<li>Configure Route Table</li>
<li>Create Security Groups</li>
<li>Launch Web Server (EC2)</li>
<li>Launch Database Server (Private EC2)</li>
<li>Infrastructure Ready</li>
</ol>
</section>

<section>
<h2>2-Tier Architecture</h2>
<pre>
Internet
   │
Internet Gateway
   │
Public Subnet
(Web Server)
   │
Security Group
   │
Private Subnet
(Database Server)
</pre>
</section>

<section>
<h2>Technology Stack</h2>
<ul>
<li>Terraform</li>
<li>Amazon Web Services (AWS)</li>
<li>Amazon VPC</li>
<li>Amazon EC2</li>
<li>Amazon S3 (Remote Backend)</li>
<li>Internet Gateway</li>
<li>Security Groups</li>
</ul>
</section>

<footer>
<hr>
<h3>Created By</h3>
<p>Jagadeesh Surineni</p>

<h3>Mentored By</h3>
<p>Shiva Pothula</p>

<p>&copy; 2026 Tech Enthusiastic. All Rights Reserved.</p>
</footer>

</body>
</html>
EOF

# Restart Apache Service
systemctl restart httpd
