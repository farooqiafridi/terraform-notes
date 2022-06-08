variable "AWS_ACCESS-KEY" {
  type        = string
  default     = "AKIAWDDHSJIQJTQO5B57"
  description = "my aws secret key"
}
variable AWS_SECRET_KEY {
  type        = string
  default     = "su32Vh5W9fTspMFX0Dq88SiX7pi9CI+qIqVGG0kE"
  description = "description"
}

variable "AMIS" {
    type = map
    default = {
        us-east-1 = "ami-0f40c8f97004632f9"
        us-east-2 = "ami-05692172625678b4e"
        us-west-2 = "ami-0352d5a37fb4f603f"
        us-west-1 = "ami-0f40c8f97004632f9"
    }
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "my-affu-key"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "my-affu-key.pub"
}

variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}
