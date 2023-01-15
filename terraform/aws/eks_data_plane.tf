resource "aws_eks_node_group" "eks_data_plane" {
    cluster_name  = aws_eks_cluster.eks_control_plane.name
    node_group_name = var.node_group_name
    node_role_arn  = aws_iam_role.eks_data_plane_role.arn
    subnet_ids   = aws_subnet.public_subnets[*].id
    ami_type = var.eks_node_group_ami_type
    instance_types = var.eks_node_group_instance_type
    capacity_type = var.eks_node_group_capacity_type
   
    scaling_config {
        desired_size = var.eks_node_group_scaling_config["desired_size"]
        max_size = var.eks_node_group_scaling_config["max_size"]
        min_size = var.eks_node_group_scaling_config["min_size"]
    }

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicyDataPlane,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_PolicyDataPlane,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnlyDataPlane
  ]
}