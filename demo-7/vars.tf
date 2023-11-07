variable "AWS_REGION" {
    default = "us-west-2"
}

variable "AMIS" {
    type        = map(string)
    default     = {
        us-east-1 = "ami-0b0ea68c435eb488d"
        us-west-2 = "ami-0688ba7eeeeefe3cd"
        eu-west-1 = "ami-0f29c8402f8cce65c"
    }
}