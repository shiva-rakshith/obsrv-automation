output "kubernetes_host" {
  value = aws_eks_cluster.eks_master.endpoint
}

output "kubernetes_ca_certificate" {
  value = base64decode(aws_eks_cluster.eks_master.certificate_authority.0.data)
}