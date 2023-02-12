variable "cluster_name" {
  description = "The name to use for all the cluster resources"
  type = string
}
variable "db_remote_state_bucket" {
  description = "The name of the S3 bucket used for the database's remote state storage"
  type        = string
  default     = "terraform-up-and-running-state-jd"
}

variable "db_remote_state_key" {
  description = "The name of the key in the S3 bucket used for the database's remote state storage"
  type        = string
  default     = "terraform-up-and-running-jd"
}