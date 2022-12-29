# terraform 버전과 provider 등 실행에 관련된 정보 작성
terraform {
  required_version = ">= 1.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = ">= 1.40.0"
    }
  }
}

provider "openstack" {
}