resource "aws_iam_role_policy_attachment" "AmazonEKSClusterPolicy" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
    role    = aws_iam_role.eks_master_role.name
}

resource "aws_iam_role_policy_attachment" "eks_s3_policy" {
    policy_arn = "arn:aws:iam::725876873105:policy/obsrv-eks-cluster-s3-policy"
    role    = aws_iam_role.eks_master_role.name
}