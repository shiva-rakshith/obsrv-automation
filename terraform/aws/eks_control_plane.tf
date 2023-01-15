resource "aws_eks_cluster" "eks_control_plane" {
    name = "${var.building_block}-${var.env}-eks"
    role_arn = aws_iam_role.eks_control_plane_role.arn
    version = var.eks_version
   
    vpc_config {
     subnet_ids = aws_subnet.public_subnets[*].id
    }

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSClusterPolicyControlPlane,
  ]
}