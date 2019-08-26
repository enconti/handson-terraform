Terraform vpc_example Module.

Este módulo cria uma **VPC de Exemplo** com uma subnet  e aceita os seguintes parâmetros:

**name** (Nome do recurso, por exemplo instancia de produção)

**environment** (Ambiente do recurso, por exemplo staging, dev, production)

**subnet_cidr** (CIDR block para a subnet onde este recurso será criado, padrão 192.168.1.0/24)

**vpc_cidr** (CIDR block para criação da VPC, padrão 192.168.0.0/16)
