resource "hcloud_ssh_key" "this" {
  name       = "pub-key"
  public_key = file("~/.ssh/id_rsa.pub")
}
