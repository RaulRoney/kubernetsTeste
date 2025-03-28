# test_path.tf - Imprime caminhos do repositório Terraform

# Cria um arquivo com as informações de path
resource "local_file" "path_info" {
  filename = "${path.module}/path_info.txt"
  content  = <<-EOT
    Informações de Caminho:
    ----------------------
    Diretório do Módulo (path.module): ${path.module}
    Diretório Raiz (path.root): ${path.root}
    Caminho Absoluto (abspath): ${abspath(path.module)}
    Workspace Atual: ${terraform.workspace}
  EOT
}

# Outputs para visualização no terminal
output "caminhos" {
  description = "Informações de caminho do repositório"
  value = {
    module_path   = path.module
    root_path     = path.root
    absolute_path = abspath(path.module)
    workspace     = terraform.workspace
  }
}

output "arquivo_gerado" {
  description = "Localização do arquivo com as informações"
  value       = local_file.path_info.filename
}