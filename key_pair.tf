resource "aws_key_pair" "worker_key" {
  key_name   = "worker_key"
  public_key = file("./main_key.pem")
}
