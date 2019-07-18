variable "stack" {
  type = object({
    profile = string
    id      = string
    name    = string
    region  = string
    domain  = string
  })
}

variable "ssh_public_key" {
  type = string
}

variable "master" {
  type = object({
    type = string
  })
}
