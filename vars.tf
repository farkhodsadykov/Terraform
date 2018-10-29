# Region on the aws server
variable "region" {
  default = "us-east-1"
}

# variable call appname
variable "appname" {
  default = "artemis"
}

# The password  for mysql server
variable "mysql_password" {
  default = "Redhat2018"
}

# Our Database on MYSQL
variable "wordpress_database" {
  default = "wordpress"
}

# Our wordpress user on mysql
variable "wordpress-user" {
  default = "worduser"
}

# Our wordpress password
variable "wordpress_pass" {
  default = "xBDuJfUrscVWB"
}

# Variable call amis for each images for regions
variable "amis" {
  type = "map"
  default = {
     us-east-1 = "ami-0922553b7b0369273"
     us-east-2 = "ami-0b59bfac6be064b78"
   }

}
