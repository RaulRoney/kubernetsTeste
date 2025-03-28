terraform {
  backend "remote" {
    hostname = "terrakube-api.officecom.app"
    organization = "officecom"
    workspaces {
      name = "work-teste"
    }
  }
  required_providers {
    terrakube = {
      source = "AzBuilder/terrakube"
    }
  }
}


resource "oci_core_vcn" "generated_oci_core_vcn" {
	cidr_block = "10.0.0.0/16"
	compartment_id = "ocid1.compartment.oc1..aaaaaaaa5cdnqz2nmo2idnhbfowalsfxk2qy2kyu3tnqqn6672ru52jmcxma"
	display_name = "oke-vcn-quick-cluster1-bf5d35e59"
	dns_label = "cluster2"
}