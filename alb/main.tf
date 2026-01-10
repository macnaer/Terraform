module "sg" {
  source = "./modules/security_group"
}

module "ec2" {
  source    = "./modules/ec2"
  alb_sg_id = module.sg.alb_sg_id
}
