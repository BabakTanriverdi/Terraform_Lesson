<img src="terraform.jpg"><br>

# Terraform Lessons by Babak

> **Comprehensive Terraform Course**
> Covers Terraform **v0.12 → v1.x** with a strong focus on **modern Terraform best practices (Terraform 1.x)**.

---

## 📌 Course Scope

This repository provides structured Terraform lessons, examples, and command references, including:

* Terraform Core concepts (Init, Plan, Apply, Destroy)
* State management & workspaces
* Variables, outputs, and locals
* Modules & reusable infrastructure
* AWS provider usage
* Modern Terraform 1.x workflow & best practices

---

## 🧩 Supported Terraform Versions

* ✅ Terraform v0.12 – v0.15 (legacy concepts)
* ✅ Terraform v1.x (recommended & actively used)

> ⚠️ **Note:** Some commands from older versions (e.g. `terraform taint`) are deprecated in Terraform 1.x and replaced with newer workflows.

---

## 🔐 AWS Credentials Configuration

### Windows (PowerShell)

```powershell
$env:AWS_ACCESS_KEY_ID="xxxxxxxxxxxxxxxxx"
$env:AWS_SECRET_ACCESS_KEY="yyyyyyyyyyyyyyyyyyyyyyyyyyyy"
$env:AWS_DEFAULT_REGION="zzzzzzzzz"
```

### Linux / macOS (Shell)

```bash
export AWS_ACCESS_KEY_ID="xxxxxxxxxxxxxxxxx"
export AWS_SECRET_ACCESS_KEY="yyyyyyyyyyyyyyyyyyyyyyyyyyyy"
export AWS_DEFAULT_REGION="zzzzzzzzz"
```

> ✅ **Best Practice:** Prefer using `~/.aws/credentials` and IAM roles for production environments.

---

## ⚙️ Core Terraform Commands

```bash
terraform init        # Initialize working directory
terraform plan        # Show execution plan
terraform apply       # Apply infrastructure changes
terraform destroy     # Destroy managed infrastructure
```

### Additional Useful Commands

```bash
terraform fmt         # Format Terraform files
terraform validate    # Validate configuration syntax
terraform show        # Show current state or plan
terraform output      # Display output values
terraform console     # Interactive Terraform console
terraform import      # Import existing resources
```

---

## 📦 Terraform State Commands

```bash
terraform state list
terraform state show <RESOURCE>
terraform state pull
terraform state rm <RESOURCE>
terraform state mv <SOURCE> <DESTINATION>
```

### Example: Bulk State Move

```bash
for x in $(terraform state list | grep xyz); do \
  terraform state mv "$x" "$x"
done
```

> ⚠️ **Warning:** State operations are destructive. Always back up your state file before modifying it.

---

## 🧠 Terraform Workspaces

```bash
terraform workspace show
terraform workspace list
terraform workspace new <NAME>
terraform workspace select <NAME>
terraform workspace delete <NAME>
```

### Workspace Variable

```hcl
${terraform.workspace}
```

Used to differentiate environments such as `dev`, `test`, and `prod`.

---

## 🗂️ Recommended Project Structure

```text
.
├── main.tf
├── providers.tf
├── variables.tf
├── outputs.tf
├── versions.tf
├── terraform.tfvars
├── modules/
│   └── vpc/
└── README.md
```

---

## 🧩 Versions & Providers (Terraform 1.x)

```hcl
terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
```

---

## 🚀 Best Practices (Terraform 1.x)

* Use **remote backends** (S3 + DynamoDB) for state locking
* Always run `terraform fmt` and `terraform validate`
* Pin provider versions
* Use modules for reusable components
* Avoid hardcoding secrets
* Use `-target` only for exceptional cases

---

## 📚 Who Is This For?

* DevOps Engineers
* Cloud Engineers
* System Administrators
* Terraform beginners → intermediate users

---

## ✍️ Author

**Babak Tanriverdiyev**
Terraform & DevOps Lessons

---

> ⭐ This README is aligned with **current Terraform 1.x standards** and is suitable for real-world, production-oriented learning.

