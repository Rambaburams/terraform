resource "aws_instance" "terraform" {
    count = length(var.instance)
    ami ="ami-09c813fb71547fc4f"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.allow-all-2.id]

    tags = {
      Name= var.instance[count.index]
      terraform= "true"
    }
}

resource "aws_security_group" "allow-all-2"{
    name="allow-all-2"
    description = "allow all groups"

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
      Name="allow-all-2"
    }
}