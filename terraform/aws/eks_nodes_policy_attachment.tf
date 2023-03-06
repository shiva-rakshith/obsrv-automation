resource "aws_iam_role_policy_attachment" "AmazonEKSWorkerNodePolicy" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
    role    = aws_iam_role.eks_nodes_role.name
}

resource "aws_iam_role_policy_attachment" "AmazonEKS_CNI_Policy" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
    role    = aws_iam_role.eks_nodes_role.name
}

resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerRegistryReadOnly" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
    role    = aws_iam_role.eks_nodes_role.name
}

resource "aws_iam_role_policy_attachment" "AmazonEBSCSIDriverPolicy" {
    policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
    role    = aws_iam_role.eks_nodes_role.name
}

resource "aws_iam_role_policy_attachment" "node_s3_policy" {
    policy_arn = "arn:aws:iam::725876873105:policy/obsrv-eks-cluster-s3-policy"
    role    = aws_iam_role.eks_nodes_role.name
}