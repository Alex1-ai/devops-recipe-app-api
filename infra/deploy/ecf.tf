###############################
# ECS Cluster for running app #
###############################
resource "aws_ecs_cluster" "main" {
    name = "${local.prefix}-cluster"

}
