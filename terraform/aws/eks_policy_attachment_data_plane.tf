resource "aws_iam_role_policy_attachment" "AmazonEKSWorkerNodePolicyDataPlane" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
    role    = aws_iam_role.eks_data_plane_role.name
}

resource "aws_iam_role_policy_attachment" "AmazonEKS_CNI_PolicyDataPlane" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
    role    = aws_iam_role.eks_data_plane_role.name
}

resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerRegistryReadOnlyDataPlane" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
    role    = aws_iam_role.eks_data_plane_role.name
}