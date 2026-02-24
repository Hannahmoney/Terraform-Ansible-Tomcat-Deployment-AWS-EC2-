# 🚀 Terraform + Ansible Tomcat Deployment (AWS EC2)

This project provisions infrastructure using **Terraform** and configures a Tomcat application using **Ansible**.

It demonstrates clear separation between:

- Infrastructure provisioning (Terraform)
- Configuration management (Ansible)

An **Ubuntu EC2 instance** was used as the Ansible control server.

---

## 🏗 Architecture

<img src="images/architecture.png" width="700">

---

## 📂 Project Structure

├── ec2.tf
├── securitygrp.tf
├── provider.tf
├── ansibleconfig
├── inventory.ini
├── target/
│   └── LoginWebApp.war
└── images/
    └── architecture.png

---

## ⚙️ Prerequisites (Control Server - Ubuntu)

The following tools were installed on the Ubuntu control server:

- Terraform
- AWS CLI
- AWS credentials configured (`aws configure` or IAM role)
- Ansible
- SSH key pair

---

## 🔐 SSH Configuration

To allow the Ansible controller to connect to the newly created EC2 instance:

### Generate SSH key pair on the control server:

```bash
ssh-keygen
```
Copy public key to the target EC2 instance:
```bash
ssh-copy-id ec2-user@<EC2_PUBLIC_IP>
```
Or manually append the public key to:

~/.ssh/authorized_keys

on the target server.

This enables passwordless SSH access for Ansible.

🚀 Deployment Steps
1️⃣ Provision Infrastructure

```bash
terraform init
terraform apply
```
This creates:

EC2 instance

Security Group (Port 22 and 8080)

2️⃣ Inventory Configuration

The public IP is automatically written from ec2.tf.

Example inventory structure:

[web]
<EC2_PUBLIC_IP> ansible_user=ec2-user
3️⃣ Run Ansible Playbook
```bash
ansible-playbook -i inventory.ini ansibleconfig
```
This will:

Install Java

Install and configure Tomcat

Deploy LoginWebApp.war

Start Tomcat

4️⃣ Access the Application

Open in browser:
```bash
http://<EC2_PUBLIC_IP>:8080/LoginWebApp
```
🧠 Concepts Demonstrated

Infrastructure as Code (IaC)

Configuration Management

SSH key-based authentication

Automated application deployment

AWS Security Group configuration
