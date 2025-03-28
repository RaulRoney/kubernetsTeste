# Cria um arquivo local .txt com conteúdo dinâmico
resource "local_file" "arquivo_exemplo" {
  filename = "${path.module}/arquivo_criado_pelo_terraform.txt"
  content  = <<-EOT
    Arquivo gerado automaticamente pelo Terraform
    Data: ${timestamp()}
    Dono: ${var.nome_usuario}
    Projeto: Demonstração Atlantis
  EOT
}

# Variável para personalização
variable "nome_usuario" {
  description = "Nome do usuário que executou o Terraform"
  type        = string
  default     = "Visitante"
}

# Mostra o caminho do arquivo criado
output "caminho_arquivo" {
  value = local_file.arquivo_exemplo.filename
}