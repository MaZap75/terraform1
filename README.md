# Create pod in Openshift by Terraform using GitHub Action

## Passaggi principali:
1. **Creare un security token** per connettersi a OpenShift.
2. **Modificare `terraform.yml`** con l'URL corretto dell'API OpenShift.

## `main.tf`
Definisci la configurazione del Pod specificando:
- **Nome del Pod**
- **Progetto**
- **Porta del container**
- **Altre specifiche**
