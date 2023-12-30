output "instance_ip" {
  value = aws_instance.ami_ring_ring.public_ip
}