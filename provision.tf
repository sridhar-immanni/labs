resource "null_resource" "sree" {  
  connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.PATH_TO_PUBLIC_KEY)
  }

provisioner "ansible" {
    plays {
        playbook = "./provisioner.yaml"
        hosts = vars.public_ip.id
    }
    become = "yes"
    local = "yes"
 }
}
