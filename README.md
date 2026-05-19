# ☁️ Auth Service - Infra

Infraestrutura como código (IaC) para o serviço de autenticação, responsável por provisionar recursos na AWS com segurança e padronização.

O repositório é responsável por:

- Provisionamento de instância EC2 (t2.micro)
- Criação de repositório ECR para imagens Docker
- Configuração de Security Groups (SSH, HTTP, HTTPS)
- Pipeline de CI/CD automatizado via GitHub Actions
- Gestão de estado remoto seguro no S3

---

## 🚀 Como rodar

Clone o projeto:
```bash
git clone https://github.com/JG-OLIVEIRA/auth-service-infra.git
```

Inicialize o Terraform:
```bash
terraform init
```

Valide as configurações:
```bash
terraform validate
```

Planeje a infraestrutura:
```bash
terraform plan
```

Aplique as mudanças:
```bash
terraform apply
```

## 📡 Recursos principais

| Recurso | Tipo | Descrição |
|--------|-------------------|-------------------|
| `auth_service_server` | EC2 | Instância t2.micro para rodar o serviço |
| `auth_service_sg` | Security Group | Controle de tráfego (Entrada: 22, 80, 443 / Saída: ALL) |
| `ecr_auth-service` | ECR | Repositório de imagens Docker (MUTABLE) |

---

## ✨ Features

- ✅ Instância EC2 pré-configurada
- ✅ Repositório ECR para containers
- ✅ Security Group com controle granular
- ✅ Tráfego de saída (egress) totalmente liberado
- ✅ Estado remoto do Terraform no S3 (`terraform-state-jorgegdoliveira`)
- ✅ Lock de estado (state lock) ativado no backend
- ✅ CI/CD automatizado com GitHub Actions (Plan & Apply OR Destroy)
- ✅ Autenticação segura na AWS via OIDC (Role ARN)

---

# 🛠️ Tech Stack

## Infraestrutura

- **Terraform**
- **AWS (Amazon Web Services)**
- **GitHub Actions**
- **Ubuntu**

---

# 🧩 AWS Ecosystem

## Compute

- Amazon EC2
- IAM Instance Profile

## Containers

- Amazon ECR (Elastic Container Registry)

## Networking & Security

- Amazon VPC
- Security Groups
- IAM Roles (Integração OIDC com GitHub Actions)
- Key Pairs (SSH)

## Storage

- Amazon S3 (Terraform State Backend)

---

# 📂 Project Structure

O projeto segue a estrutura base do Terraform, separando a declaração de recursos por finalidade para facilitar a manutenção.

```bash
.
├── .github/workflows
│   └── terraform.yml       # Pipeline CI/CD para deploy via GitHub Actions
├── backend.tf              # Configuração do backend remoto no Amazon S3
├── ec2.tf                  # Declaração da instância EC2 e Security Groups
├── ecr.tf                  # Declaração do repositório ECR
├── provider.tf             # Configuração do provider AWS (us-east-1)
├── variables.tf            # Declaração de variáveis utilizadas no projeto
└── terraform.tfvars        # (Não versionado) Valores locais das variáveis
```