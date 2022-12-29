# 리소스를 생성하는데 사용할 변수 정 + 인스턴스를 생성할 서브넷 설정
variable "default_image" {
  type    = string
  default = "CentOS 7.9"
}

variable "default_network_cidr" {
  type    = string
  default = "172.16.0.0/20"
}

variable "instance_name" {
  type    = string
  default = "lena-tf-instance"
}

variable "instance_count" {
  type    = number
  default = 1
}

variable "instance_flavor" {
  type    = string
  default = "a1-2-co"
}