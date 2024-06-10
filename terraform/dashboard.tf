resource "aws_cloudwatch_dashboard" "ecs_dashboard" {
  dashboard_name = "ECS-Dashboard"

  dashboard_body = jsonencode({
    widgets = [
      {
        type = "metric",
        x = 0,
        y = 0,
        width = 12,
        height = 6,
        properties = {
          metrics = [
            [ "AWS/ECS", "CPUUtilization", "ClusterName", var.cluster_name, "ServiceName", var.service_name ],
            [ ".", "MemoryUtilization", ".", ".", ".", "." ]
          ],
          view = "timeSeries",
          stacked = false,
          region = var.region,
          period = 300,
          stat = "Average",
          title = "ECS Service CPU and Memory Utilization"
        }
      },
      {
        type = "metric",
        x = 12,
        y = 0,
        width = 12,
        height = 6,
        properties = {
          metrics = [
            [ "AWS/ECS", "CPUUtilization", "ClusterName", var.cluster_name ],
            [ ".", "MemoryUtilization", ".", "." ]
          ],
          view = "timeSeries",
          stacked = false,
          region = var.region,
          period = 300,
          stat = "Average",
          title = "ECS Cluster CPU and Memory Utilization"
        }
      },
      {
        type = "log",
        x = 0,
        y = 6,
        width = 24,
        height = 6,
        properties = {
          query = "fields @timestamp, @message | sort @timestamp desc | limit 20",
          logGroupNames = ["/ecs/flask-app"],
          region = var.region,
          title = "Recent Log Events"
        }
      }
    ]
  })
}