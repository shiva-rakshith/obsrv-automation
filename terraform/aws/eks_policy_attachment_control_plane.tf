resource "aws_iam_role_policy_attachment" "AmazonEKSClusterPolicyControlPlane" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
    role    = aws_iam_role.eks_control_plane_role.name
}