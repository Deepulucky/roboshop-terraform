env = "dev"

tags = {
  company_name  = "XYZ Tech"
  business      = "ecommerce"
  business_unit = "retail"
  cost_center   = "322"
  project_name  = "roboshop"
}


vpc = {
  main = {
    cidr_block = "10.0.0.0/16"
    subnets = {
      web    = { cidr_block = ["10.0.0.0/24", "10.0.1.0/24"] }
      app    = { cidr_block = ["10.0.2.0/24", "10.0.3.0/24"] }
      db     = { cidr_block = ["10.0.4.0/24", "10.0.5.0/24"] }
      public = { cidr_block = ["10.0.6.0/24", "10.0.7.0/24"] }
    }
  }
}

default_vpc_id        = "vpc-053d5cff1ef7e1fd2"
default_vpc_rt        = "rtb-0afb751f902c88904"
allow_ssh_cidr        = ["172.31.0.0/16"]
zone_id               = "Z019183117R4826VIH8DK" 
kms_key_id            = "f0a71b80-90c3-4da1-a189-b4b95e9764e8"
kms_key_arn           = "arn:aws:kms:us-east-1:739561048503:key/f0a71b80-90c3-4da1-a189-b4b95e9764e8"
//allow_prometheus_cidr = ["172.31.95.219/32"]

rabbitmq = {
  main = {
    instance_type = "t3.small"
    component     = "rabbitmq"
  }
}

rds = {
  main = {
    component      = "rds"
    engine         = "aurora-mysql"
    engine_version = "5.7.mysql_aurora.2.11.3"
    db_name        = "dummy"
    instance_count = 1
    instance_class = "db.t3.small"
  }
}

documentdb = {
  main = {
    component         = "docdb"
    engine            = "docdb"
    engine_version    = "4.0.0"
    db_instance_count = 1
    instance_class    = "db.t3.medium"
  }
}

elasticache = {
  main = {
    component               = "elasticache"
    engine                  = "redis"
    engine_version          = "6.x"
    replicas_per_node_group = 1
    num_node_groups         = 1
    node_type               = "cache.t3.micro"
    parameter_group_name    = "default.redis6.x.cluster.on"
  }
}

alb = {
  public = {
    name               = "public"
    internal           = false
    load_balancer_type = "application"
    subnet_ref         = "public"
  }
  private = {
    name               = "private"
    internal           = true
    load_balancer_type = "application"
    subnet_ref         = "app"
  }
}

# components   = {
#   frontend  = {
#     tags = { Monitor = "true" , env = "dev" }
#   }
#   mongodb   = {
#     tags = { env = "dev" }
#   }
#   catalogue = {
#     tags = { Monitor = "true" , env = "dev" }
#   }
#   redis     = {
#     tags = { env = "dev" }
#   }
#   user      = {
#     tags = { Monitor = "true" , env = "dev" }
#   }
#   cart      = {
#     tags = { Monitor = "true" , env = "dev" }
#   }
#   mysql     = {
#     tags = { env = "dev" }
#   }
#   shipping  = {
#     tags = { Monitor = "true" , env = "dev" }
#   } 
#   rabbitmq  = {
#     tags = { env = "dev" }
#   }
#   payment   = {
#     tags = { Monitor = "true" , env = "dev" }
#   }

# }


#component = 
# vpc = {
#   main = {
#     cidr_block = "10.0.0.0/16"
#     subnets = {
#       public = {
#         name       = "public"
#         cidr_block = ["10.0.0.0/24", "10.0.1.0/24"]
#         azs        = ["us-east-1a", "us-east-1b"]
#       }
#       web = {
#         name       = "web"
#         cidr_block = ["10.0.2.0/24", "10.0.3.0/24"]
#         azs        = ["us-east-1a", "us-east-1b"]
#       }
#       app = {
#         name       = "app"
#         cidr_block = ["10.0.4.0/24", "10.0.5.0/24"]
#         azs        = ["us-east-1a", "us-east-1b"]
#       }
#       db = {
#         name       = "db"
#         cidr_block = ["10.0.6.0/24", "10.0.7.0/24"]
#         azs        = ["us-east-1a", "us-east-1b"]
#       }
#     }
#   }
# }
