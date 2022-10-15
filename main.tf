resource "aws_kinesis_firehose_delivery_stream" "this" {
  name        = "${local.stack}-${var.kinesis_purpose}-kinesis-firehose-delivery-stream"
  destination = var.destination
  
  server_side_encryption {
    enabled = var.enable_encryption 
    key_type = var.encryption_key_type
  }

  s3_configuration {
    role_arn           = var.role_arn
    bucket_arn         = var.s3_bucket_arn
    buffer_size        = var.buffer_size
    buffer_interval    = var.buffer_interval
    compression_format = var.compression_format
  }

  http_endpoint_configuration {
    url                = var.url
    name               = var.http_endpoint_name
    access_key         = var.access_key
    buffering_size     = var.buffer_size
    buffering_interval = var.buffer_interval
    role_arn           = var.role_arn
    s3_backup_mode     = var.s3_backup_mode

    request_configuration {
      content_encoding = var.content_encoding

      common_attributes {
        name  = "nci.Program"
        value = var.program
      }

      common_attributes {
        name  = "nci.App"
        value = var.app
      }

      common_attributes {
        name  = "nci.Env"
        value = var.env
      }
    }
  }
}
