# Amazon ECS

O Amazon ECS é um serviço gerenciado que facilita a execução de aplicações conteinerizadas na nuvem da AWS. Proporcionando um mecanismo de orquestração de contêineres altamente escalável e de desempenho rápido, o ECS permite que os desenvolvedores lancem, parem e gerenciem contêineres com chamadas de API simplificadas. Este capítulo explora as principais características do ECS, incluindo sua integração com o ecossistema AWS, simplificação da gestão de contêineres e opções de computação com EC2 e Fargate.

## Lock-in
Embora o Amazon ECS ofereça inúmeros benefícios em termos de integração, escalabilidade e gerenciamento, ele também leva a um certo grau de lock-in com a AWS. Isso significa que as aplicações e serviços que são profundamente integrados com o ECS e outros serviços da AWS podem ter dificuldades em migrar para outros provedores de nuvem sem uma revisão significativa da arquitetura e implementação.

## Control Plane Transparente
O ECS fornece um plano de controle ("control plane") gerenciado, o que significa que a AWS cuida da alta disponibilidade, escalabilidade e manutenção do serviço de orquestração para você. Esse plano de controle transparente permite que os desenvolvedores utilizem o ECS sem se preocuparem com a configuração e manutenção do sistema de orquestração de contêineres.

# ECS: Clusters
Os clusters no ECS organizam recursos de computação, seja através de máquinas virtuais EC2 ou capacidades de computação serverless com Fargate. Veremos conceitos importantes dos clusters para a orquestração eficiente de contêineres, explicando como eles facilitam o gerenciamento centralizado, a alocação de recursos e a implementação de práticas de isolamento de ambiente e escalabilidade.

Eles também proporcionam um meio de isolar ambientes dentro da mesma conta AWS. Por exemplo, você pode ter clusters separados para desenvolvimento, teste e produção, cada um com suas próprias configurações e políticas de segurança, garantindo um controle granular sobre os ambientes de aplicação.

# ECS: Services
O conceito de Services no ECS é importante para a manutenção e escalabilidade de aplicações. Os serviços garantem a execução de um número específico de instâncias de uma tarefa, balanceamento de carga, atualizações de serviço suaves e a descoberta de serviço. Este capítulo aborda como configurar um serviço no ECS, incluindo a definição da tarefa, configuração do load balancer e políticas de autoscaling.

Os Services no ECS é responsável por manter um número específico de instâncias de uma tarefa (definida em uma Task Definition) em execução. Ele assegura que o número de instâncias desejado esteja sempre ativo e disponível. Se uma tarefa falha ou é interrompida por qualquer motivo, o serviço ECS automaticamente lança uma nova instância da tarefa para substituir a que falhou, garantindo assim a disponibilidade constante da aplicação.

# ECS: Task Definition
As Task Definitions são o coração da execução de contêineres no ECS, atuando como um blueprint para suas aplicações. Este capítulo explica como as Task Definitions permitem a especificação detalhada de contêineres, incluindo a imagem do contêiner, recursos de computação alocados e configurações de rede, proporcionando flexibilidade e controle precisos sobre como as aplicações são executadas.

# ECS: Tasks
Este capítulo foca na execução de tasks, a unidade básica de execução no ECS. Explora como as tasks encapsulam um ou mais contêineres que devem ser executados juntos, descrevendo os componentes de uma task, seu ciclo de vida e a importância das tasks para a flexibilidade de execução e gerenciamento de recursos.

# ECS: Computing Types
A escolha entre as opções de computação EC2 e Fargate no ECS é importante para atender às necessidades específicas de gerenciamento de infraestrutura de uma aplicação. Este capítulo compara detalhadamente as vantagens e desvantagens de cada opção, ajudando você a tomar uma decisão informada com base em controle, custo e simplicidade operacional.

Ao utilizar o Amazon Elastic Container Service (ECS), duas principais opções de computação estão disponíveis para executar suas aplicações conteinerizadas: Amazon EC2 (Elastic Compute Cloud) e AWS Fargate. Cada uma oferece um modelo de gestão de recursos diferente, adaptando-se a diversos casos de uso e preferências de gerenciamento de infraestrutura.

## Amazon EC2
 Amazon EC2 permite que você tenha controle granular sobre as instâncias de servidor que hospedam seus contêineres. Neste modelo, você é responsável por escolher o tipo de instância, configurar e otimizar o ambiente de servidor, o que inclui o gerenciamento de rede, armazenamento e segurança. As instâncias EC2 fornecem a flexibilidade de executar contêineres em servidores virtuais que você pode ajustar conforme necessário.

Você tem controle total sobre o ambiente de execução, permitindo personalizações profundas conforme as necessidades específicas da sua aplicação.

Com a capacidade de reservar instâncias ou utilizar instâncias spot, é possível otimizar os custos baseado no seu uso.

EC2 oferece uma diversidade de tipos de instâncias que se adequam a diferentes cargas de trabalho e perfis de desempenho.

## Fargate
O AWS Fargate é um modelo de computação serverless para contêineres, eliminando a necessidade de provisionar e gerenciar servidores. Com Fargate, você especifica a CPU e a memória necessárias para a aplicação, e o Fargate se encarrega de tudo o que é necessário para executar, escalar e gerenciar a infraestrutura de contêineres.

 Não há necessidade de escolher tipos de instância, gerenciar clusters de contêineres ou escalar grupos de instâncias. O que pode ser algo a ser considerado como ponto negativo em vários cenários.

Permite que você se concentre totalmente no desenvolvimento e na implantação de aplicações, sem se preocupar com a infraestrutura subjacente, principalmente com cenários de autoscaling.

# ECS: Capacity Providers e Autoscaling
Explorando os conceitos de Capacity Providers e Auto Scaling, ee possivel descrever como essas funcionalidades fornecem flexibilidade, otimização de custos e eficiência operacional na gestão de capacidade de computação para contêineres. Discute estratégias de uso, configuração e os benefícios de utilizar essas abordagens para escalonamento dinâmico de recursos.

O Auto Scaling no Amazon Elastic Container Service (ECS) é uma característica crucial que permite que as aplicações se adaptem dinamicamente à carga de trabalho, garantindo que haja sempre a quantidade certa de recursos disponíveis para atender à demanda. O ECS integra-se com o serviço AWS Application Auto Scaling para oferecer essa funcionalidade, permitindo o dimensionamento automático tanto do nível de tarefa (tasks) quanto do nível de serviço. Aqui está uma visão detalhada de como o Auto Scaling funciona no ECS e como ele pode beneficiar suas aplicações.

    1. Service Auto Scaling: Permite que você ajuste automaticamente o número de instâncias de uma tarefa (tasks) em execução com base em políticas de dimensionamento definidas. Isso é feito monitorando métricas de desempenho (como CPU e uso de memória) ou métricas personalizadas através do Amazon CloudWatch e ajustando o número de instâncias da tarefa para manter a performance desejada.


    2. Cluster Auto Scaling: Utilizando os Capacity Providers, o ECS pode também escalar automaticamente a quantidade de capacidade de computação disponível em um cluster ECS. Isso significa adicionar ou remover instâncias EC2 em um cluster EC2-backed ou ajustar a capacidade de processamento quando usando o Fargate. Essa capacidade garante que sempre haja recursos computacionais suficientes disponíveis para lançar novas tarefas conforme necessário, sem sobrecarregar os recursos existentes.

O dimensionamento automático garante que você utilize os recursos de forma eficiente, escalando para cima para atender ao aumento da demanda e para baixo durante períodos de baixa utilização, ajudando assim a otimizar os custos, em elhora a disponibilidade e o desempenho das aplicações ajustando dinamicamente a capacidade para atender às mudanças na demanda.