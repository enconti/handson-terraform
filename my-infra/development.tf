module "instance_dev" {
  source = "../modules/instance_example/"
  
  name = "instance development"
  environment = "development"
  vpc_id = "123"
  subnet_id = "123"
}