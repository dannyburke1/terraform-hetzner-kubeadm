resource "hcloud_ssh_key" "this" {
  name       = "my-pubkey"
  public_key = file("~/.ssh/id_rsa.pub")
}
