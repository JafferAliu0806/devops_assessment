#Create Launch config

resource "aws_launch_template" "webserver-launch-config" {
  name_prefix            = "webserver-launch-config"
  image_id               = var.ami
  instance_type          = "t2.micro"
  key_name               = "test"
  vpc_security_group_ids = ["${aws_security_group.webserver_sg.id}"]

  iam_instance_profile {
    name = "assessment-s3-readonly"
  }

  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      volume_size           = 10
      volume_type           = "gp2"
      encrypted             = true
      delete_on_termination = true
    }
  }

  lifecycle {
    create_before_destroy = true
  }
  user_data = filebase64("${path.module}/run_webserver.sh")

}

resource "aws_lb" "ALB-tf" {
  name               = "sg-ALG-tf"
  internal           = false
  load_balancer_type = "application"
  subnets            = aws_subnet.public.*.id
  security_groups    = [aws_security_group.lb.id]

  tags = {
    name    = "sg-AppLoadBalancer-tf"
    Project = "sg-assignment"
  }
}




# Create Auto Scaling Group

resource "aws_autoscaling_group" "sg-ASG-tf" {
  name                 = "sg-ASG-tf"
  desired_capacity     = 3
  max_size             = 6
  min_size             = 3
  force_delete         = true
  depends_on           = [aws_lb.ALB-tf]
  target_group_arns    = ["${aws_lb_target_group.TG-tf.arn}"]
  health_check_type    = "EC2"
  vpc_zone_identifier  = aws_subnet.private.*.id

  launch_template {
    id      = aws_launch_template.webserver-launch-config.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "sg-ASG-tf"
    propagate_at_launch = true
  }
}

# Create Target group

resource "aws_lb_target_group" "TG-tf" {
  name       = "sg-TargetGroup-tf"
  depends_on = [aws_vpc.sg-vpc]
  port       = 80
  protocol   = "HTTP"
  vpc_id     = aws_vpc.sg-vpc.id
  health_check {
    interval            = 70
    path                = "/index.html"
    port                = 80
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 60
    protocol            = "HTTP"
    matcher             = "200,202"
  }
  tags = {
    name    = "sg-TargetGroup-tf"
    Project = "sg-assignment"
  }

}


# Create ALB Listener 

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.ALB-tf.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.TG-tf.arn
  }
  tags = {
    name    = "sg-lister-front_end"
    Project = "sg-assignment"
  }
}
