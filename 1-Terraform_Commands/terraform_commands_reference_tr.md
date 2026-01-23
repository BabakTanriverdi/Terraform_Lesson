# Terraform Komutları ve Açıklamaları

Bu dosya Terraform CLI komutlarının açıklamalı bir referansıdır.

---

## 1. terraform init
**Çalışma dizinini başlatır**
- Provider’ları indirir
- Backend’i yapılandırır
- Modülleri indirir

```bash
terraform init
terraform init -upgrade
terraform init -reconfigure
```

---

## 2. terraform fmt
**Kod formatlama**

```bash
terraform fmt
terraform fmt -recursive
terraform fmt -check
```

---

## 3. terraform validate
**Sözdizimi ve yapı kontrolü**

```bash
terraform validate
```

---

## 4. terraform plan
**Değişiklik ön izlemesi (dry-run)**

```bash
terraform plan
terraform plan -out=tfplan
terraform plan -var="env=dev"
terraform plan -var-file=dev.tfvars
```

---

## 5. terraform apply
**Kaynakları oluşturur / günceller**

```bash
terraform apply
terraform apply -auto-approve
terraform apply tfplan
terraform apply -var-file=prod.tfvars
```

---

## 6. terraform destroy
**Tüm kaynakları siler**

```bash
terraform destroy
terraform destroy -auto-approve
terraform destroy -target=aws_s3_bucket.example
```

---

## 7. terraform show
**State veya plan içeriğini gösterir**

```bash
terraform show
terraform show tfplan
terraform show -json
```

---

## 8. terraform output
**Output değerlerini gösterir**

```bash
terraform output
terraform output bucket_name
terraform output -json
```

---

## 9. terraform providers
**Provider bilgileri**

```bash
terraform providers
terraform providers mirror /path
terraform providers lock
```

---

## 10. terraform version
**Terraform sürümü**

```bash
terraform version
```

---

## 11. terraform state
**State dosyası yönetimi**

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
**Çoklu ortam yönetimi (dev / test / prod)**

```bash
terraform workspace new dev
terraform workspace list
terraform workspace select prod
terraform workspace show
terraform workspace delete dev
```

---

## 13. terraform import
**Mevcut kaynağı state’e ekler**

```bash
terraform import aws_s3_bucket.example my-bucket-name
```

---

## 14. terraform taint / untaint
**Kaynağı yeniden oluşturulacak olarak işaretler / taint’i kaldırır**

```bash
terraform taint aws_instance.web
terraform untaint aws_instance.web
```

> Not: Taunt komutları yeni Terraform sürümlerinde `-replace` ile değiştirildi

---

## 15. terraform graph
**Bağımlılık grafiği üretir**

```bash
terraform graph
terraform graph | dot -Tpng > graph.png
```

---

## 16. terraform console
**Terraform expression test ortamı**

```bash
terraform console
> var.region
> length(var.subnets)
```

---

## 17. terraform login / logout
**Terraform Cloud / Enterprise oturumu**

```bash
terraform login
terraform logout
```

---

## 18. terraform force-unlock
**State kilidini manuel açar**

```bash
terraform force-unlock LOCK_ID
```

---

## 19. terraform get
**Modülleri indirir**

```bash
terraform get
terraform get -update
```

---

## Özet – Tipik Akış

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
terraform destroy
```

---

## Sınav (Terraform Associate) İçin Kritik Komutlar
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

