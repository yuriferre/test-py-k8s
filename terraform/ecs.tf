resource "aws_ecs_cluster" "main" {
  name = "flask-app-cluster"
}

resource "aws_iam_role" "execution_role" {
  name = "ecsTaskExecutionRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ecs-tasks.amazonaws.com"
      }
    }]
  })
}

resource "aws_ecs_task_definition" "flask" {
  family                   = "flask-app-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.execution_role.arn

  container_definitions = jsonencode([{
    name      = "flask-app",
    image     = "637423320338.dkr.ecr.us-east-1.amazonaws.com/flask-app:latest",
    essential = true,
    portMappings = [{
      containerPort = var.app_port,
      hostPort      = var.app_port
    }]
    logConfiguration = {
      logDriver = "awslogs"
      options = {
        awslogs-group         = "/ecs/flask-app"
        awslogs-region        = var.region
        awslogs-stream-prefix = "flask"
      }
    }
  }])
}

resource "aws_ecs_service" "main" {
  name            = "flask-app-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.flask.arn
  desired_count   = var.desired_count
  launch_type     = "FARGATE"

  network_configuration {
    assign_public_ip = true
    subnets          = aws_subnet.public[*].id
    security_groups  = [aws_security_group.ecs.id]
  }

#   load_balancer {
#     target_group_arn = aws_lb_target_group.main.arn
#     container_name   = "flask-app"
#     container_port   = var.app_port
#   }

#   depends_on = [aws_lb_listener.http]
}