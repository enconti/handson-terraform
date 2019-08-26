module "instance_stg" {
  source = "../modules/instance_example/"

  name = "instance staging"
  environment = "staging"
  vpc_id = "123"
  subnet_id = "123"
}