module "s3_resources" {
  source      = "./modules/s3"
  environment = var.environment
}
