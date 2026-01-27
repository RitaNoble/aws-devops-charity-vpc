# Secure AWS VPC + Charity Website (DevOps Project)

## Summary
This project designs and deploys a secure **2-tier AWS VPC** and hosts a **public-facing charity website** on an **EC2 NGINX web server**. It is built in a DevOps style: **Infrastructure as Code (Terraform)** + **CI/CD (GitHub Actions)**.

---

## Architecture
**Network**
- VPC CIDR: `10.0.0.0/16`
- Public Subnet: `10.0.1.0/24`
- Private Subnet: `10.0.2.0/24`
- Internet Gateway
- Route Tables (public route: `0.0.0.0/0 -> IGW`)

**Compute**
- Ubuntu EC2 instance in the Public Subnet
- NGINX installed and configured to serve the site

**Security**
- HTTP (80) allowed from anywhere
- HTTPS (443) allowed from anywhere
- SSH (22) allowed only from a trusted IP
- Outbound traffic allowed (required for `apt` + GitHub pulls)

---

## What I Built (Portfolio Proof)
- Designed a secure VPC with segmented subnets (public/private)
- Configured routing and internet gateway access
- Implemented security controls using Security Groups
- Deployed a charity website from GitHub on NGINX
- Rebuilt the infrastructure using Terraform
- Automated checks + deployments using GitHub Actions (CI/CD)

---

## Live Site
Once provisioned, the website is available at:
- `http://<EC2_PUBLIC_IP>`

> Note: For cost control, the EC2 instance can be terminated and recreated at any time using Terraform.

---

## Troubleshooting Highlight (Real DevOps Debugging)
During deployment, package installs (`apt`) failed due to blocked outbound connectivity.
**Root cause:** the Security Group had **no outbound rules**, preventing internet access.
**Fix:** restored outbound egress (`0.0.0.0/0`). Deployment immediately succeeded.

---

# Terraform Deployment

## Prerequisites
- Terraform installed
- AWS credentials configured locally
- Existing EC2 Key Pair name (e.g. `Charitykeypair`)
- Your public IP in CIDR format for SSH (e.g. `197.x.x.x/32`)

## Deploy
```bash
cd terraform
terraform init
terraform apply -auto-approve \
  -var="key_name=Charitykeypair" \
  -var="ssh_cidr=YOUR_PUBLIC_IP/32"

---

## 📸 Deployment Screenshots

### Architecture Diagram
![Architecture](screenshots/01-architecture-diagram.png)

---

### VPC Overview
![VPC](screenshots/02-vpc-overview.png)

---

### Subnets Configuration
![Subnets](screenshots/03-subnets.png)

---

### Route Table Configuration
![Route Table](screenshots/04-route-table.png)

---

### Security Group – Inbound Rules
![Inbound SG](screenshots/05-security-group-inbound.png)

---

### Security Group – Outbound Rules
![Outbound SG](screenshots/06-security-group-outbound.png)

---

### EC2 Instance List
![EC2](screenshots/07-ec2-instance-list.png)

---

### EC2 Instance Summary
![EC2 Summary](screenshots/08-ec2-instance-summary.png)

---

### NGINX Running
![NGINX](screenshots/09-nginx-running.png)

---

### Website Live
![Website](screenshots/10-website-live.png)
