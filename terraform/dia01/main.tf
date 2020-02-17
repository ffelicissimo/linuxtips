provider "aws" {
  alias = "east"
  region  = "us-east-1"
  version = "~> 2.0"
}

provider "aws" {
  alias  = "west"
  region = "us-west-2"
  version = ">= 2.7.0"
}

#module "west" {
  #source = "./servers"
  #servers = 2
    #providers = {
      #aws = "aws.west"
    #}
#}

terraform {
  backend "s3" {
    # Lembre de trocar o bucket para o seu, não pode ser o mesmo nome
    bucket = "ffelicissimotf1"
    key    = "terraform-fernando.tfstate"
    region = "us-east-1"
  }
}