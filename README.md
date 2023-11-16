# Terraform Coursework
- Notes and examples from Edward Viaene's course on UDEMY
- Course: https://www.udemy.com/course/learn-devops-infrastructure-automation-with-terraform/learn/lecture/5853788?start=0#overview

## Terraform Basics

### demo-1: Variables
- Create an EC2 Instance
- Splitting provider, instance info, variables, and secrets into separate files and have them reference each other

### demo-2: Software provisioning
- Create EC2 Instance
- Apply a ssh key pair generated by the user (.pem format must be used for the private key)
- Use provisioner tags to connect to instance and add shell script to install nginx
- This is effectively terraforms approach to "bootstrapping" and adding startup actions to an instance

### demo-2b: Software provisioning (Windows)
- Not included in notes
- Same as demo-2 but for windows instances

### demo-3: Outputting Variables
- Create an instance
- Send private ip to a text file using local-exec provisioner command
- Use output block to share public IP in terminal
- Key pair block not used, but can be added if you wanted to access the instance

### demo-4: Terraform remote state
- Re-use the setup from demo-3, store the state file in s3
- s3 config is defined in backend.tf
- Benefit is the source-of-truth for the state is stored remotely, not locally.
- Variables are not allowed in backend.tf config

### demo-5: Data Sources
- Use data block to pull AWS CIDR block data and apply it when creating a security group
- Useful for managing dynamic data in your infrastructure
- Using terraform apply will execute the data block again and apply changes to the security group

### demo-6: Modules
- Modules are effectively templates you can reference. Like interfaces
- If module is referenced, need to run terraform get first to fetch it
- Compiles but fails at the bootstrap step. I think more commands are required for the remote-exec to run out of the module

## Terraform with AWS

### demo-7: VPCs and NAT
- Full scale VPC, public and private subnets IGW and table mapping
- NAT gateway setup is there to demo granting internet access to the private subnets and resources for updates, etc

### demo-8: Launch EC2 into a VPC
- Like demo-7 but adding an instance, security group, and key pairs
- Instance file includes properties to define which subnet the instance will be placed in and which sg(s) will be applied

### demo-9: EBS Volumes
- Similar to demo-8 but includes an EBS volume resource block in the instance file
- Requires volume and attachment blocks
- Demo included quick steps for mounting volume to EC2 and saving that config. Good to know

### demo-10: Userdata
- Use user_data parameter within the instance resource block to execute scripts provided by "user"
- Scripts include an init and a shell, designed installs lvm2 and docker, and mounts the volume
- Useful for disc management and persistence
- Script includes checked not to override data or config if a disc with data already exists, mounted to the instance

### demo-11: Route53
- Demo of resource blocks used to create domain listings in Route 53
- MX records are for mail domains, they can be configured to point to any mail service (ie: gmail)
- Demo not executed as Wilson does not own any of the domains listed (route53.tf is not committed to Wilson's repo)

### demo-12: RDS
- Launching an RDS resource from scratch
- RDS requires subnet and parameter group, this will be launched in a custom VPC
- Output.tf file included for easy finding of new public IPs, for demo purposes
- RDS password variable blank in config, so pass it inline on apply
