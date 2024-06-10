**Descrição dos Arquivos Terraform**
	
	•	alb.tf - Criar os recursos necessarios para controlar os container via aplication load balance.
	•	autoscaling.tf - Cria os recursos necessário para realizar o auto escaling da api, metrica de referencia cpu > 50%.
	•	dashboard.tf - Cria o dashboard com monitoramento detalhado de cpu/memory e logs recentes da api.
	•	ecs.tf - Cria os recursos necessários para executar o serviço/container do flask-app.
	•	logs.tf - Cria o log group para armazenamento, retenção configurada para 7 dias.
	•	sg.tf - Criar os recursos referentes aos grupos de segurança.
	•	vpc.tf - Cria os recursos referentes a network do projeto.

**Pipeline de CI/CD com GitHub Actions**

.github/workflows/deploy.yml

O arquivo deploy.yml define o pipeline de CI/CD para automatizar o deployment da aplicação usando GitHub Actions. Este pipeline inclui as seguintes etapas:

	•	Checkout do Código: Faz o checkout do código do repositório.
	•	Configuração do Python: Instala a versão do Python necessária e as dependências da aplicação.
	•	Configuração do Terraform: Instala o Terraform e inicializa o diretório de trabalho.
	•	Configuração das Credenciais AWS: Configura as credenciais AWS necessárias para interagir com os serviços AWS.
	•	Login no Amazon ECR: Faz login no Amazon ECR para permitir o push da imagem Docker.
	•	Build, Tag e Push da Imagem Docker: Constrói, tagueia e empurra a imagem Docker para o Amazon ECR.
	•	Aplicação do Terraform: Executa o Terraform para criar/atualizar os recursos de infraestrutura.
	•	Força o Deployment no ECS: Atualiza o serviço ECS para utilizar a nova imagem Docker, forçando um novo deployment.

**Considerações Finais**

O projeto oferece uma solução completa de deployment e monitoramento de uma aplicação Flask no AWS ECS Fargate, com escalabilidade automática e monitoramento detalhado. A utilização do Terraform permite a automação da infraestrutura, enquanto o GitHub Actions facilita o CI/CD.
