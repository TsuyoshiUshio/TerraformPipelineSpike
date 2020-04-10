resource "local_file" "example1" {
  content  = var.example1
  filename = "example1.txt"
}

resource "local_file" "example2" {
  content  = var.example2
  filename = "example2.txt"
}
