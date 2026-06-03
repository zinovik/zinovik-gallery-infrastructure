1. Create Google Cloud Project manually
2. Create Spacelift stack manually, add GCP integration, add Spacelift service account to `tfvars` (`spacelift_service_account_email`)
3. Run `bootstrap` locally (`cd bootstrap && terraform init && terraform plan && terraform apply`)
4. Add env vars and secrets to Spacelift stack manually
5. Deploy Google Cloud Run using GitHub Actions
6. Run `spacelift` on Spacelift
