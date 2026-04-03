# Azure IAM & RBAC with Terraform

## 📌 Overview
This project demonstrates the implementation of Identity and Access Management (IAM) in Azure using Terraform.

It focuses on creating a secure, non-human identity (Service Principal) and assigning controlled access to Azure resources using Role-Based Access Control (RBAC).

---

## 🏗️ Architecture

### Components:
- Resource Group
- Storage Account
- Azure AD Application
- Service Principal
- RBAC Role Assignment

### Flow:
1. Create Azure AD Application
2. Create Service Principal
3. Assign RBAC role at Resource Group level
4. Output identity details for authentication

---

## 🔐 Security Considerations

- Use of Service Principal instead of user credentials
- Implementation of RBAC for access control
- Application of Least Privilege (Reader role)
- No hardcoded secrets in Terraform files

---

## 📁 Terraform Features Used

- Providers: azurerm, azuread
- Input variables
- Output values
- Data sources
- Resource dependencies

---

## ▶️ How to Deploy
terraform init

terraform plan

terraform apply
