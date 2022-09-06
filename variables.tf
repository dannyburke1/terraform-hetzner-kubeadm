variable "api_key" {
  default = "" // Change this to your own, don't commit it.
}

variable "os_image" {
  default = "centos-7"
}

variable "instance_type" {
  default = "cpx11"
}

variable "master_node_count" {
  default = "1"
}

variable "worker_node_count" {
  default = "3"
}

variable "multi_master" {
  default = false
}
