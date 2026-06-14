resource "aws_batch_compute_environment" "main" {
  compute_environment_name = "${var.environment}-compute-env"
  type                     = var.compute_environment_type
  state                    = var.state
  service_role             = aws_iam_role.batch_service.arn

  compute_resources {
    type                = var.compute_resource_type
    max_vcpus          = var.max_vcpus
    min_vcpus          = var.min_vcpus
    desired_vcpus      = var.desired_vcpus
    instance_type      = var.instance_types
    subnets            = var.subnet_ids
    security_group_ids = var.security_group_ids
    instance_role      = aws_iam_instance_profile.batch.arn
  }
}

resource "aws_batch_job_queue" "main" {
  name                 = "${var.environment}-job-queue"
  state                = var.state
  priority             = var.job_queue_priority
  compute_environment_order {
    order              = 1
    compute_environment = aws_batch_compute_environment.main.arn
  }
}

resource "aws_batch_job_definition" "main" {
  name           = "${var.environment}-job-definition"
  type           = var.job_definition_type
  container_properties = jsonencode({
    image = var.container_image
    vcpus = var.vcpus
    memory = var.memory
    jobRoleArn = aws_iam_role.batch_job.arn
  })
}

data "aws_iam_policy_document" "batch_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["batch.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "batch_service" {
  name               = "${var.environment}-batch-service-role"
  assume_role_policy = data.aws_iam_policy_document.batch_assume_role.json
}

resource "aws_iam_role_policy_attachment" "batch_service_policy" {
  role       = aws_iam_role.batch_service.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBatchServiceRole"
}

resource "aws_iam_instance_profile" "batch" {
  name = "${var.environment}-batch-instance-profile"
  role = aws_iam_role.batch_instance.name
}

data "aws_iam_policy_document" "batch_instance_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "batch_instance" {
  name               = "${var.environment}-batch-instance-role"
  assume_role_policy = data.aws_iam_policy_document.batch_instance_assume_role.json
}

resource "aws_iam_role_policy_attachment" "batch_instance_policy" {
  role       = aws_iam_role.batch_instance.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

resource "aws_iam_role" "batch_job" {
  name = "${var.environment}-batch-job-role"
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
