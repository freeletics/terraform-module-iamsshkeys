variable "profile_prefix" {
  description = "Name of the iam instance profile"
  default     = "pull_sshkeys"
}

variable "role_prefix" {
  description = "Name of the iam role"
  default     = "pull_sshkeys"
}
