provider "aws" {
  alias  = "tokyo"
  region = "ap-northeast-1"
}

provider "aws" {
  alias  = "osaka"
  region = "ap-northeast-3"
}
