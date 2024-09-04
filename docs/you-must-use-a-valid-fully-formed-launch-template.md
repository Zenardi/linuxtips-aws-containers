# Corrigindo o erro: You must use a valid fully-formed launch template.

Error: creating Auto Scaling Group (linuxtips-ecs-cluster-on-demand20240904153949625600000007): ValidationError: You must use a valid fully-formed launch template. Value (teste) for parameter iamInstanceProfile.name is invalid. Invalid IAM Instance Profile name

## Correção
Caso a sua conta não tenha a Instance Profile ecsInstanceProfile, você pode corrigir o erro criando uma role de IAM especifica para esse caso. Exemplo abaixo:
```yml
resource "aws_iam_role" "main" {
  name               = format("%s-instance-profile", var.project_name)

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action    = "sts:AssumeRole"
      Effect    = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "ec2_role" {
  role       = aws_iam_role.main.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

resource "aws_iam_role_policy_attachment" "ec2_ssm" {
  role       = aws_iam_role.main.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
}

resource "aws_iam_instance_profile" "main" {
  name = format("%s-instance-profile", var.project_name)
  role = aws_iam_role.main.name
}
```

Agora você pode alterar nos seus Lauch Template trocando a referência da role manualmente para a nova:

```yml
//...  

  iam_instance_profile {
    name = aws_iam_instance_profile.main.name
  }
```