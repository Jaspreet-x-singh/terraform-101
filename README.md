# terraform-101

# 🌱 Terraform Learning Repository

Welcome to my Terraform learning journey! This repository is a collection of examples, modules, and notes as I explore infrastructure as code using [Terraform](https://www.terraform.io/).

## 📁 Repository Structure

```
terraform-learning/
├── modules/           # Reusable Terraform modules
├── environments/      # Environment-specific configurations (dev, staging, prod)
├── examples/          # Standalone examples for practice
├── notes/             # Markdown notes and references
└── README.md          # Project overview and instructions
```

## 🚀 Getting Started

To run any example:

```bash
cd examples/<example-name>
terraform init
terraform plan
terraform apply
```

> ✅ Prerequisites:
> - [Terraform CLI](https://developer.hashicorp.com/terraform/downloads)
> - Cloud provider credentials (e.g., AWS, Azure, GCP)

## 📚 Topics Covered

- ✅ Terraform Basics: Providers, Resources, Variables
- 📦 Modules and Reusability
- 🗂️ State Management and Remote Backends
- 🔐 Secrets and Security Best Practices
- 🧪 Testing and Validation
- ☁️ Multi-cloud Deployments
- 🧰 CI/CD Integration

## 🛠 Tools Used

- Terraform CLI
- Visual Studio Code
- GitHub
- Azure

## 📖 Resources

- [Terraform Docs](https://developer.hashicorp.com/terraform/docs)
- [Terraform Registry](https://registry.terraform.io/)
- [Awesome Terraform](https://github.com/shuaibiyy/awesome-terraform)

## ✅ To-Do

- [ ] Add examples for Azure
- [ ] Integrate with GitHub Actions
- [ ] Add diagrams using `terraform graph`
