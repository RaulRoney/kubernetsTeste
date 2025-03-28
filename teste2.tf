# Arquivo Terraform que só exibe uma mensagem de sucesso
resource "null_resource" "sucesso" {
  triggers = {
    mensagem = "Apply bem-sucedido!"
  }

  provisioner "local-exec" {
    command = "echo '✅ Apply concluído com sucesso!'"
  }
}

output "mensagem_sucesso" {
  value = null_resource.sucesso.triggers.mensagem
}