# Enterprise-Grade Todo Application — Infrastructure + Application Monorepo

A fully automated, production-ready Todo Application built with **Azure**, **Terraform Modules**, **ArgoCD**, and **GitHub Actions CI/CD**. This monorepo hosts both **microservices** and **infrastructure-as-code**, managed using industry-standard enterprise patterns.

---

## 🚀 Overview

This repository contains:

* Complete **Infrastructure** provisioning using **Terraform Modular Architecture**.
* **Azure Kubernetes Service (AKS)** based microservice deployment.
* GitOps workflow via **ArgoCD**.
* CI/CD pipelines via **GitHub Actions** for each microservice.
* Centralized **Environment Management**.
* Enterprise-compliant folder + deployment structure.

---

## 🗂️ Repository Structure

```
├── .github/workflows/
│   ├── add-task.yml
│   ├── delete-task.yml
│   ├── dev-pipeline.yml
│   ├── get-task.yml
│   └── todo-ui.yml
│
├── Add-Task/                  # Microservice 1
├── Delete-task/               # Microservice 2
├── Get-Task/                  # Microservice 3
├── Micro-todo-ui/             # Frontend Application
│
├── ArgoCD Application/        # App-of-app GitOps definitions
│
├── Environment/               # Environment-specific TF variables
│   ├── dev/
│   ├── qa/
│   └── prod/
│
├── Modules/                   # Terraform reusable modules
│   ├── azurerm_acr/
│   ├── azurerm_compute_service/
│   ├── azurerm_keyvault/
│   ├── azurerm_kubernetes_services/
│   ├── azurerm_networking/
│   ├── azurerm_resource_group/
│   ├── azurerm_sql_database/
│   ├── azurerm_sql_server/
│   └── azurerm_storage_account/
│
├── .gitignore
├── LICENSE
└── README.md
```

---

## 🧱 Architecture

### **High-Level Architecture Flow**

```
Frontend (Micro-todo-ui)
       ↓
Backend APIs (Add-Task, Delete-task, Get-Task)
       ↓
Azure Kubernetes Service (AKS)
       ↓
Azure Container Registry (ACR)
       ↓
Azure KeyVault (Secrets Mgmt)
       ↓
Azure SQL Server + Database
       ↓
Virtual Network + Subnets
```

### **Orchestration & Automation**

* **Terraform** → Provisions all Azure infra using reusable modules
* **Github Actions** → Builds apps, pushes images, deploys manifests
* **ArgoCD** → Pulls manifests & deploys to AKS (GitOps)

---

## 🌍 Environments

Each environment has separate variables & state.

```
Environment/
├── dev/
├── qa/
└── prod/
```

Enterprise-grade isolation:

* Separate networking
* Separate AKS nodepools
* Dedicated ACR, Keyvault
* Independent SQL databases

---

## ⚙️ Terraform Modules (Enterprise Architecture)

Each module follows **inputs/outputs**, **locals**, and **AzureRM best practices**.

### Modules include:

* **Resource Group Module** — naming + tagging strategy
* **Networking Module** — VNet, NSG, Subnets
* **Compute Module** — AKS Nodepools
* **Kubernetes Module** — Full AKS deployment
* **KeyVault Module** — Secret & identity mgmt
* **Storage Module** — Blob storage for app data
* **SQL Server + SQL DB Modules** — Tiered database deployment
* **ACR Module** — Private registry

Each module ensures:

* Idempotency
* Standardized tags
* Standard naming conventions
* Reusability across environments

---

## 🧪 Microservices

Each microservice has:

* Own Dockerfile
* Own GitHub Actions pipeline
* Cluster-level K8s manifests
* Versioned deployment strategy

### Microservices

| Service       | Purpose              |
| ------------- | -------------------- |
| Add-Task      | Add a new Todo item  |
| Get-Task      | Retrieve tasks       |
| Delete-task   | Delete a Todo item   |
| Micro-todo-ui | React/Vue/Angular UI |

---

## 🤖 CI/CD Workflows (GitHub Actions)

### Build → Push → Deploy

Each workflow performs:

1. **Build Docker Image**
2. **Scan vulnerabilities** (optional enterprise feature)
3. **Push to ACR**
4. **Commit updated manifest to ArgoCD folder**
5. **Trigger GitOps deployment**

### Example Flow:

```
Developer Commit → GitHub Actions → ACR → ArgoCD → AKS
```

---

## 🔁 GitOps with ArgoCD

Your ArgoCD config is in:

```
ArgoCD Application/
```

ArgoCD responsibilities:

* Sync K8s manifests to AKS
* Auto-heal drift
* Versioned rollbacks
* Automated deployment history

---

## 🧑‍💻 Local Development

### Prerequisites:

* Node / Python / Go (based on microservice)
* Docker
* kubectl + az cli
* Terraform

### Run Locally

```
docker build -t add-task .
docker run -p 8080:8080 add-task
```

---

## 🌐 Deployment

### Deploy Infra

```
cd Environment/dev
terraform init
terraform plan
terraform apply
```

### Deploy Microservices

CI/CD automatically deploys — or manually push manifest to Argo folder.

---

## 📌 Roadmap (Enterprise Enhancements)

* Add Monitoring (Azure Monitor / Prometheus+Grafana)
* Add Alerting
* Add Service Mesh (Istio/Linkerd)
* Add API Gateway (Azure APIM)
* Add Secret Rotation

---

## 🤝 Contributing

Enterprise code guidelines:

* Mandatory PR reviews
* Semantic commit messages
* Linting + Formatting
* Unit tests for services

---

## 📄 License

This project **PuneetKSharma-O/Todo_App_Microservices** is licensed under the **Mozilla Public License 2.0 (MPL-2.0)**.

**Author:** Puneet Sharma
