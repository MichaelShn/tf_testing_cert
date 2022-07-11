terraform {
  required_version = ">= 0.14.0"
  required_providers {
    template = {
      source = "hashicorp/template"
      version = "2.1.2"
    }
  }
}

data "template_file" "template" {
  template = <<EOF
This is a PRODUCTION certificate, issuer: $${issuer}  entity: $${entity}
EOF
  vars = {
    issuer = var.issuer
    entity = var.entity
  }
}

output "certificate" {
  value = data.template_file.template.rendered
}
