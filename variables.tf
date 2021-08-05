variable "namespace" {
  default = "arsh-ns"
}

variable user_images {
  type = list(string)
  default = [
    "gcr.io/xyz/abc",
    "docker.io/nnnn",
    "mginx",
    "test value"
  ]
}
