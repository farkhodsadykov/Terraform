# Region on the aws server
variable "region" {
  default = "us-east-1"
}

# variable call appname
variable "appname" {
  default = "artemis"
}


# Variable call amis for each images for regions
variable "amis" {
  type = "map"
  default = {
     us-east-1 = "ami-0922553b7b0369273"
     us-east-2 = "ami-0b59bfac6be064b78"
   }

}

# variable for mysql user root pass
variable "mysql_password" {
  default = "Redhat2018"
}


# Variable v_data will store all credentials wordpres > mysql 
variable "m_data" {
  type = "map"
  default = {
     wordpress_user = "worduser"
     wordpress_pass = "xBDuJfUrscVWB"
     wordpress_database = "wordpress"
   }
}
