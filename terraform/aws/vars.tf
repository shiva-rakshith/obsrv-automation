variable "env" {
    type = string
    description = "Environment name. All resources will be prefixed with this value."
    default = "dev"
}

variable "building_block" {
    type = string
    description = "Building block name. All resources will be prefixed with this value."
    default = "obsrv"
}

variable "region" {
    type = string
    description = "AWS region to create the resources."
    default = "us-east-2"
}

variable "vpc_cidr" {
    type = string
    description = "VPC CIDR range"
    default = "10.10.0.0/16"
}

variable "vpc_instance_tenancy" {
    type = string
    description = "VPC tenancy type."
    default = "default"
}

variable "additional_tags" {
    type        = map(string)  
    description = "Additional tags for the resources. These tags will be applied to all the resources."
    default     = {}
}

variable "availability_zones" {
    type        = list(string)
    description = "AWS Availability Zones."
    default     = ["us-east-2a", "us-east-2b", "us-east-2c"]
}

variable "public_subnet_cidrs" {
    type        = list(string)
    description = "Public subnet CIDR values."
    default     = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]
}

variable "auto_assign_public_ip" {
    type        = bool
    description = "Auto assign public ip's to instances in this subnet"
    default     = true
}

variable "igw_cidr" {
    type = string
    description = "Internet gateway CIDR range."
    default = "0.0.0.0/0"
}

variable "eks_control_plane_role" {
    type = string
    description = "EKS control plane role name."
    default = "eks_control_plane_role"
}

variable "eks_data_plane_role" {
    type = string
    description = "EKS data plane role name.."
    default = "eks_data_plane_role"
}

variable "node_group_name" {
    type = string
    description = "EKS node group name.."
    default = "eks_spot_node_group"
}

variable "eks_node_group_ami_type" {
    type = string
    description = "EKS node group AMI type."
    default = "AL2_x86_64"
}

variable "eks_node_group_instance_type" {
    type = list(string)
    description = "EKS nodegroup instance types."
    default = ["t3a.large"]
}

variable "eks_node_group_capacity_type" {
    type = string
    description = "EKS node group type. Either SPOT or ON_DEMAND can be used"
    default = "SPOT"
}

variable "eks_node_group_scaling_config" {
    type = map(string)
    description = "EKS node group auto scaling configuration."
    default = {
      desired_size = 0
      max_size   = 3
      min_size   = 0
    }
}

variable "eks_version" {
    type = string
    description = "EKS version."
    default = "1.24"
}

locals {
    common_tags = {
      Environment = "${var.env}"
      BuildingBlock = "${var.building_block}"
    }

    availability_zones = [for zone in ["a", "b", "c"] : "${var.region}${zone}"]
}