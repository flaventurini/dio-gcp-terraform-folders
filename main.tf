provider "google" {
  project = "flaventurini-devops-iac"
  region  = "us-central1"
  zone    = "us-central1-c"
  credentials = "${file("serviceaccount.yaml")}"
}

// Criação de pastas

resource "google_folder" "Comercial" {
  display_name = "Comercial"
  parent       = "organizations/540829645030"
}

resource "google_folder" "ERP" {
  display_name = "ERP"
  parent       = google_folder.Comercial.name
}

resource "google_folder" "Mobile" {
  display_name = "Mobile"
  parent       = google_folder.Comercial.name
}

resource "google_folder" "ERP-Desenvolvimento" {
  display_name = "ERP-Desenvolvimento"
  parent       = google_folder.ERP.name
}

resource "google_folder" "ERP-Producao" {
  display_name = "ERP-Producao"
  parent       = google_folder.ERP.name
}

resource "google_folder" "Mobile-Desenvolvimento" {
  display_name = "Mobile-Desenvolvimento"
  parent       = google_folder.Mobile.name
}

resource "google_folder" "Mobile-Producao" {
  display_name = "Mobile-Producao"
  parent       = google_folder.Mobile.name
}

resource "google_folder" "Financeiro" {
  display_name = "Financeiro"
  parent       = "organizations/540829645030"
}

resource "google_folder" "SalesForce" {
  display_name = "SalesForce"
  parent       = google_folder.Financeiro.name
}

resource "google_folder" "SalesForce-Desenvolvimento" {
  display_name = "SalesForce-Desenvolvimento"
  parent       = google_folder.SalesForce.name
}

resource "google_folder" "SalesForce-Producao" {
  display_name = "SalesForce-Producao"
  parent       = google_folder.SalesForce.name
}

// Criação dos projetos

resource "google_project" "flaventurini-comercial-erp-dev" {
  name       = "SalesForce-Dev"
  project_id = "flaventurini-comercial-erp-dev"
  folder_id  = google_folder.ERP-Desenvolvimento.name
  auto_create_network=false
  billing_account = "018973-A8340F-83D8E5"

}

resource "google_project" "flaventurini-comercial-erp-prod" {
  name       = "SalesForce-Prod"
  project_id = "flaventurini-comercial-erp-prod"
  folder_id  = google_folder.ERP-Producao.name
  auto_create_network=false
  billing_account = "01B2C4-70459E-F53446"
}

resource "google_project" "flaventurini-comercial-mobile-dev" {
  name       = "SalesForce-Dev"
  project_id = "flaventurini-comercial-mobile-dev"
  folder_id  = google_folder.Mobile-Desenvolvimento.name
  auto_create_network=false
  billing_account = "018973-A8340F-83D8E5"

}

resource "google_project" "flaventurini-comercial-mobile-prod" {
  name       = "SalesForce-Prod"
  project_id = "flaventurini-comercial-mobile-prod"
  folder_id  = google_folder.Mobile-Producao.name
  auto_create_network=false
  billing_account = "01B2C4-70459E-F53446"
}

resource "google_project" "flaventurini-salesforce-dev" {
  name       = "SalesForce-Dev"
  project_id = "flaventurini-salesforce-dev"
  folder_id  = google_folder.SalesForce-Desenvolvimento.name
  auto_create_network=false
  billing_account = "018973-A8340F-83D8E5"

}

resource "google_project" "flaventurini-salesforce-prod" {
  name       = "SalesForce-Prod"
  project_id = "flaventurini-salesforce-prod"
  folder_id  = google_folder.SalesForce-Producao.name
  auto_create_network=false
  billing_account = "01B2C4-70459E-F53446"
}