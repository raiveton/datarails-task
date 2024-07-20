# IAM role for eks

resource "aws_iam_role" "datarails-demo" {
  name = "eks-cluster-datarails-demo"
  tags = {
    tag-key = "eks-cluster-datarails-demo"
  }

  assume_role_policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": [
                    "eks.amazonaws.com"
                ]
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
POLICY
}

# eks policy us-east-1b

resource "aws_iam_role_policy_attachment" "datarails-demo-AmazonEKSClusterPolicy" {
  role       = aws_iam_role.datarails-demo.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

# bare minimum requirement of eks

resource "aws_eks_cluster" "datarails-demo" {
  name     = var.eks_name
  role_arn = aws_iam_role.datarails-demo.arn

  vpc_config {
    subnet_ids = [
      aws_subnet.private-us-east-1a.id,
      aws_subnet.private-us-east-1b.id,
      aws_subnet.public-us-east-1a.id,
      aws_subnet.public-us-east-1b.id
    ]
  }

  depends_on = [aws_iam_role_policy_attachment.datarails-demo-AmazonEKSClusterPolicy]
}