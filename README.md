<div align="center">

# 🏛️ Azure CAF Modular Infrastructure Framework
### Enterprise Multi-Environment Terraform Architecture (Bastion, NAT Gateway & Multi-Tier Compute)

[![Platform](https://img.shields.io/badge/Platform-Microsoft_Azure-0078D4?style=for-the-badge&logo=microsoftazure&logoColor=white)](https://azure.microsoft.com)
[![IaC](https://img.shields.io/badge/IaC-Terraform_Modular-7B2CBF?style=for-the-badge&logo=terraform&logoColor=white)](https://terraform.io)
[![Governance](https://img.shields.io/badge/Architecture-Cloud_Adoption_Framework-00FF66?style=for-the-badge&logo=microsoft&logoColor=0B0813)](#-architectural-framework)
[![Tiers](https://img.shields.io/badge/Environments-Dev_%26_Prod_Isolated-00E5FF?style=for-the-badge&logo=azureartifacts&logoColor=0B0813)](#-multi-environment-topology)

**Designed by [Mihir Maurya](https://github.com/MihirMaurya-dev) · Enterprise Cloud Architect & DevSecOps**

</div>

---

## 🏗️ Architectural Framework

This repository provides an enterprise-ready, modular Infrastructure as Code (IaC) framework implementing the **Microsoft Cloud Adoption Framework (CAF)**. It separates reusable infrastructure building blocks into individual modules and orchestrates multi-tier enterprise deployments across isolated `Dev` and `Prod` environments.

```mermaid
graph TD
    subgraph Modules["🧩 Reusable Modular Components"]
        M_RG["📁 Resource Group Module"]
        M_VNET["🌐 Virtual Network Module"]
        M_SNET["⚡ Subnet Generator Module"]
        M_PIP["📍 Public IP Module"]
        M_NAT["🛡️ NAT Gateway Module"]
        M_BST["🔒 Azure Bastion Module"]
        M_VM["💻 Virtual Machine Module"]
    end

    subgraph Envs["🚀 Isolated Environments"]
        DEV["🧪 Dev Environment\n(Dynamic Sizing & Low Cost)"]
        PROD["🏢 Prod Environment\n(High Availability & Strict NSGs)"]
    end

    Modules --> DEV
    Modules --> PROD

    classDef modStyle fill:#1d0738,stroke:#9d4edd,stroke-width:2px,color:#fff;
    classDef devStyle fill:#08182b,stroke:#00e5ff,stroke-width:2px,color:#fff;
    classDef prodStyle fill:#032111,stroke:#00ff66,stroke-width:2px,color:#fff;

    class Modules,M_RG,M_VNET,M_SNET,M_PIP,M_NAT,M_BST,M_VM modStyle;
    class DEV devStyle;
    class PROD prodStyle;
```

---

## 🧰 Technology Stack & Tooling

<div align="center">

<a href="https://skillicons.dev">
  <img src="https://skillicons.dev/icons?i=azure,terraform,bash,powershell,git,githubactions,linux,vscode&theme=dark&perline=8" alt="Technology Stack" />
</a>

</div>

<br/>

---

## 📂 Repository Topology

```text
azure-caf-modular-iac/
├── Environments/
│   ├── Dev/                  # 🧪 Development environment deployment
│   │   ├── main.tf           # Module orchestrations
│   │   └── variables.tf
│   └── Prod/                 # 🚀 Production environment deployment
│       ├── main.tf           # Production sizing & security controls
│       └── variables.tf
│
└── modules/                  # 🧩 REUSABLE TERRAFORM MODULES
    ├── bastion/              # Azure Bastion Host for zero-public-IP management
    ├── NAT gateway/          # Outbound Internet egress security
    ├── public_ip/            # Standard SKU Public IP allocations
    ├── resource_group/       # Resource Group & Tagging governance
    ├── subnet/               # Subnet & NSG association generator
    ├── virtual_machine/      # Managed disk compute instances with OS profiles
    └── virtual_network/      # Address space and DNS configurations
```

---

## 🔒 Security & Governance Controls

1. **Zero Public Ingress for Compute**:
   Virtual machines have no public IP addresses assigned. All administrative access is strictly channeled through **Azure Bastion** over TLS.
2. **Deterministic Egress Control**:
   Outbound traffic from private subnets is routed through an enterprise **NAT Gateway** with static egress IPs.
3. **Environment Isolation**:
   `Dev` and `Prod` environments maintain distinct state files and variable specs to prevent environment crosstalk.

---

<div align="center">

**[Portfolio](https://mihirmaurya-dev.github.io/)** · **[LinkedIn](https://linkedin.com/in/mihirmauryaa1)** · **[DevOps Knowledge Vault](https://github.com/MihirMaurya-dev/DevOps-Notes)**

</div>
