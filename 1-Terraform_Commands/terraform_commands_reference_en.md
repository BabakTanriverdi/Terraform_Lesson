# Terraform Commands and Explanations

This file is a comprehensive reference of Terraform CLI commands with explanations.

---

## 1. terraform init
**Initialize working directory**
- Downloads providers
- Configures backend
- Downloads modules

```bash
terraform init
terraform init -upgrade
terraform init -reconfigure
```

---

## 2. terraform plan
**Preview changes (dry-run)**

```bash
terraform plan
terraform plan -out=tfplan
terraform plan -var="env=dev"
terraform plan -var-file=dev.tfvars
```

---

## 3. terraform apply
**Create or update resources**

```bash
terraform apply
terraform apply -auto-approve
terraform apply tfplan
terraform apply -var-file=prod.tfvars
```

---

## 4. terraform destroy
**Delete all resources**

```bash
terraform destroy
terraform destroy -auto-approve
terraform destroy -target=aws_s3_bucket.example
```

---

## 5. terraform show
**Show state or plan content**

```bash
terraform show
terraform show tfplan
terraform show -json
```

---

## 6. terraform output
**Display output values**

```bash
terraform output
terraform output bucket_name
terraform output -json
```
---

## 7. terraform fmt
**Format code**

```bash
terraform fmt
terraform fmt -recursive
terraform fmt -check
```

---

## 8. terraform validate
**Validate syntax and structure**

```bash
terraform validate
```

---

## 9. terraform providers
**Provider information**

```bash
terraform providers
terraform providers mirror /path
terraform providers lock
```

---

## 10. terraform version
**Show Terraform version**

```bash
terraform version
```

---

## 11. terraform state
**Manage state file**

```bash
terraform state list
terraform state show <resource>
terraform state mv <old> <new>
terraform state rm <resource>
terraform state pull
terraform state push
terraform state replace-provider
```

---

## 12. terraform workspace
**Manage multiple environments (dev / test / prod)**

```bash
terraform workspace new dev
terraform workspace list
terraform workspace select prod
terraform workspace show
terraform workspace delete dev
```

---

## 13. terraform import
**Import existing resource to state**

```bash
terraform import aws_s3_bucket.example my-bucket-name
```

---

## 14. terraform taint / untaint
**Mark resource for recreation / remove taint**

```bash
terraform taint aws_instance.web
terraform untaint aws_instance.web
```

> Note: Taint commands are replaced with `-replace` in newer Terraform versions

---

## 15. terraform graph
**Generate dependency graph**

```bash
terraform graph
terraform graph | dot -Tpng > graph.png
```

---

## 16. terraform console
**Terraform expression testing environment**

```bash
terraform console
> var.region
> length(var.subnets)
```

---

## 17. terraform login / logout
**Terraform Cloud / Enterprise session**

```bash
terraform login
terraform logout
```

---

## 18. terraform force-unlock
**Manually unlock state**

```bash
terraform force-unlock LOCK_ID
```

---

## 19. terraform get
**Download modules**

```bash
terraform get
terraform get -update
```

---

## Summary – Typical Flow

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
terraform destroy
```

---

## Critical Commands for Terraform Associate Exam
- `init`
- `plan`
- `apply`
- `destroy`
- `state list / show / rm`
- `import`
- `workspace`
- `output`
- `fmt`
- `validate`

