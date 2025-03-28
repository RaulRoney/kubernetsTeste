terraform {
  required_providers {
    terrakube = {
      source = "AzBuilder/terrakube"
    }
  }
}

provider "terrakube" {
  endpoint             = "https://terrakube-api.officecom.app"
  token                = "eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJUZXJyYWt1YmUiLCJzdWIiOiJyYXVsLnJvbmV5QG9mZmljZWNvbS5jb20uYnIgKFRva2VuKSIsImF1ZCI6IlRlcnJha3ViZSIsImp0aSI6ImI1NDc0YjI2LTUyMGUtNDUxYS04ZTIyLTc4NTM0ZDE4NzA4OCIsImVtYWlsIjoicmF1bC5yb25leUBvZmZpY2Vjb20uY29tLmJyIiwiZW1haWxfdmVyaWZpZWQiOnRydWUsIm5hbWUiOiJyYXVsLnJvbmV5QG9mZmljZWNvbS5jb20uYnIgKFRva2VuKSIsImdyb3VwcyI6WyJBZG1pbiIsIlRFUlJBS1VCRV9BRE1JTiJdLCJpYXQiOjE3NDMxMDE2NjYsImV4cCI6MTc0Mzk2NTY2Nn0.iON9AjxKI4jSoSjD-OWLl1e7KdLeF3NLcrzOGrOScJI"
  insecure_http_client = false
}

provider "oci" {
  tenancy_ocid = "ocid1.tenancy.oc1..aaaaaaaa5stecstypgdr4eywsblqnkzc5diaqo7rndxmiyqlvh76lklirlpa"
  user_ocid = "ocid1.user.oc1..aaaaaaaayuf5scanhtrzv4bpquwqyzwlv5wmebufgrog6iy67ibai3b7i5eq"
  private_key_path = "/home/dev/.oci/sessions/DEFAULT/raul.roney@officecom.com.br_2025-03-12T18_22_28.449Z.pem"
  fingerprint = "44:25:d7:ed:84:dd:7d:26:72:f5:8a:f2:60:9d:89:69"
  region = "sa-saopaulo-1" 
  }
