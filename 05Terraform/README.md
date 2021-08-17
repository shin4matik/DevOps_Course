![alt](img/terraform-logo.jpg "logo")

#### Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently. Terraform can manage existing and popular service providers as well as custom in-house solutions.

### The key features of Terraform are:

* Infrastructure as Code: Infrastructure is described using a high-level configuration syntax. This allows a blueprint of your datacenter to be versioned and treated as you would any other code. Additionally, infrastructure can be shared and re-used.

* Execution Plans: Terraform has a "planning" step where it generates an execution plan. The execution plan shows what Terraform will do when you call apply. This lets you avoid any surprises when Terraform manipulates infrastructure.

* Resource Graph: Terraform builds a graph of all your resources, and parallelizes the creation and modification of any non-dependent resources. Because of this, Terraform builds infrastructure as efficiently as possible, and operators get insight into dependencies in their infrastructure.

* Change Automation: Complex changesets can be applied to your infrastructure with minimal human interaction. With the previously mentioned execution plan and resource graph, you know exactly what Terraform will change and in what order, avoiding many possible human errors.


## Basic Terraform CLI commands: 

* terraform init

* terraform plan

* terraform apply (yes) // --auto-approve

* terraform show

* terraform destroy



## SAMPLE 1. Create droplet by DigitalOcean Provider

### Terraform file: "digitallocen_droplet.tf"
```bash
terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "2.11.0"
    }
  }
}

variable "do_token" {}
variable "pvt_key" {}

provider "digitalocean" {
    token = var.do_token

}

resource "digitalocean_droplet" "server" {
  image  = "ubuntu-20-04-x64"
  name   = "server"
  region = "fra1"
  size   = "s-1vcpu-1gb"
  ssh_keys = [" <fingerprint> "]

connection {
    host = self.ipv4_address
    user = "root"
    type = "ssh"
    private_key = file(var.pvt_key)
    timeout = "2m"
  }


  provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
      # install nginx
      "sudo apt update",
      "sudo apt install -y nginx"
    ]
  }
}

```

### Terraform commands

* terraform init

* terraform plan -var "do_token=${DO_PAT}" -var "pvt_key=$HOME/.ssh/id_rsa"

* terraform apply -var "do_token=${DO_PAT}" -var "pvt_key=$HOME/.ssh/id_rsa"



## SAMPLE 2. Create droplet by AWS Provider

### Terraform file: "aws_httpd.tf"
```bash
provider "aws" {
  region = "eu-central-1"
}


resource "aws_instance" "my_webserver" {
  ami                    = "ami-03a71cec707bfc3d7"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.my_webserver.id]

# This is bash script-----------------  
  user_data              = <<EOF
#!/bin/bash
yum -y update
yum -y install httpd
myip=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
echo "<h2>WebServer with IP: $myip</h2><br>Build by Terraform!"  >  /var/www/html/index.html
sudo service httpd start
chkconfig httpd on
EOF
#-------------------------------------
}


resource "aws_security_group" "my_webserver" {
  name = "WebServer Security Group"
  description = "My First SecurityGroup"

#Input & output server rules
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

```

## SAMPLE 3. Create VPC by DO Provider
```bash
resource "digitalocean_vpc" "example_vpc" {
  name     = "example-project-network"
  region   = "fra1"
#  ip_range = "10.114.0.0/20"
}

resource "digitalocean_droplet" "server" {
  name     = "www-01"
  size     = "s-1vcpu-1gb"
  image    = "ubuntu-20-04-x64"
  region   = "fra1"
  vpc_uuid = digitalocean_vpc.example_vpc.id
}



```

### VPC info
* https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/vpc
* https://docs.digitalocean.com/products/networking/vpc/
* https://docs.digitalocean.com/products/networking/vpc/resources/best-practices/
* https://www.youtube.com/watch?v=nbo5HrmZjXo
* https://youtu.be/Q3Dxtkgsh9I  -->> (https://github.com/do-community/terraform-sample-digitalocean-architectures/tree/master/01-minimal-web-db-stack)



### Info

* https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs
* https://www.digitalocean.com/community/tutorials/how-to-use-terraform-with-digitalocean
* https://docs.digitalocean.com/reference/terraform/getting-started/
* https://youtu.be/UqxebzWKigY
* https://awsregion.info/




