// Security Group Resource for Module
resource "aws_security_group" "main_security_group" {
  name        = "${var.security_group_name}"
  description = "Security Group ${var.security_group_name}"
  vpc_id      = "${var.vpc_id}"

  // allows traffic from the SG itself for tcp
  ingress {
    from_port = 0
    to_port   = 65535
    protocol  = "tcp"
    self      = true
  }

  // allows traffic from the SG itself for udp
  ingress {
    from_port = 0
    to_port   = 65535
    protocol  = "udp"
    self      = true
  }

  // allow traffic for TCP 27017
  ingress {
    from_port   = 27017
    to_port     = 27017
    protocol    = "tcp"
    cidr_blocks = ["${var.source_cidr_block}"]
  }

  // allow traffic for TCP 27018
  ingress {
    from_port   = 27018
    to_port     = 27018
    protocol    = "tcp"
    cidr_blocks = ["${var.source_cidr_block}"]
  }
}

