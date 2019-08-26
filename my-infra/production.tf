module "instance_prd" {
  source = "../modules/instance_example/"

  name = "instance production"
  environment = "production"
  vpc_id = "123"
  subnet_id = "123"
}