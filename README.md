# TVShowsAPP

## Sobre
Este aplicativo tem o objetivo de otimizar buscas de séries com uma interface pensada na esperiência do usuário seguindo a Human interface guidelines (HIG), me organizei para realiza-lo em 2 semanas.

## Features
* Lista todas as séries fornecidas pela API
* Buscar todas as series por nome
* Informações da série: episódios, resumo, programação da série, gênero.
* Informações dos episódios: nome, número, temporada e resumo do episodio.
* Permite favoritar séries que ficam disponiveis para serem consultadas a qualquer momento.
* Sistema para configuração de PIN (6-digitos) e bloqueio por, se compativel com o modelo, FaceID ou TouchID.

## Arquitetura
Foi utlizado o padrão arquitetural MVVM para este projeto pensando na complexidade e facilidade na realização de testes e reuso de código, como padrão de navegação foi utilizado o *coordinator*, seus beneficios como reuso e manutenabilidade estão descritos em: [Navengando com coordinators](https://www.notion.so/Navegando-com-Coordinators-727359c2618b462d90d9c2cf2a5c5902)

Também utilizei repository, pensando que, caso queira salvar dados em algum outro banco ou simplismente decidir trocar a forma como estão sendo salvo os dados, poderia ser facilmente alterado através do repository
facilitando ainda mais uma possivel manuntenção de código.

Cada tela é descrita dentro da pasta Scene e possui uma view(components em viewCode que iram ser apresentados na tela), uma viewModel(onde irá conter a logica de negocio e handler de eventos) e por fim uma controller(responsavel por inicializar a view e os eventos da viewmodel)

## Interface
* Na prototipagem decidi colocar as coisas basicas que vinha a minha mente com relação aos requisitos.
![](https://github.com/viniciusmesquitac/TVShowsAPP/blob/dd970020663c1dce81ca1d2eead97e625a3cca0e/Documentation/wireframe.png "Wireframe")
 testes, Hi-Fi, nesta etapa, estudei um pouco sobre como seria a transiçao da tela de shows para a tela de detalhes, segundo a hig, isso não deve ser feito em uma modal caso você ainda vá realziar outras tarfas como por exemplo visualizar um episódio, mesmo algumas streamings de video fazendo esse percurso, decidi depois, voltar ao padrão mais comum ao usuário iOS que é uma pushViewController.
![](https://github.com/viniciusmesquitac/TVShowsAPP/blob/dd970020663c1dce81ca1d2eead97e625a3cca0e/Documentation/hifi-dark.png "Hi-fi Dark")
* Foi utilizado ViewCode com criação de componentes reutilizaveis como as celulas de tableView e Componentes de texto.

## Microinterações
* Loading durante as chamadas de API.
* Fade-in de posters ao carregar.
* Feedback ao favoritar um item.
* Feedback de error ao colocar um pin Incorreto.

## API TVMaze
Foi utilizado a a api http://www.tvmaze.com/api para realizar as requisições, criei uma camada de network para realizar requisições gets, e criei um router para gerar as urls,
com isso, fica super facil criar uma nova requisição que ficam na classe TVMazeAPI.

## Persistência de dados.
Para realizar a persistência dos dados foi utilizado CoreData pelas facilidades de ser um framework nativo e trazer diversos beneficos de performace, eu criei modelos DAO no coreData para gerenciar os objetos e uma classe
reponsavel por gerenciar o container que serão salvos as series que forem favoritadas.

## Segurança
Implementei o desbloqueio de faceID ou TouchID Dependendo do dispositivo e adicionei o bloquei por PIN Code de 6 digitos, Foi utilizado o proprio framework de Seguraça e o KeyChain para guardar o codigo a ser salvo.

## Executar o Projeto
Após clonar o projeto, nenhuma configuração é necessária, basta abrir o arquivo TVShowAPP.xcworkspace, e executar o comando no diretorio raiz.
```shell
$ pod install
```

## Swift Lint
Foi utilizado o swift lint como Style Guide de código do projeto.

## Testes Unitários
Realizei testes para cada logica realizada nos arquivos de ViewModel e em algumas classes auxiliares como a de Keychain para verificar se os dados estão sendo salvos corretamente.

## Projeto finalizado.
<img width="320" alt="TVShows" src="https://github.com/viniciusmesquitac/TVShowsAPP/blob/617901ab8418f50ba20cea6ed133d3cd28b3184c/Documentation/Screenshots/Simulator%20Screen%20Shot%20-%20iPhone%208%20-%202021-04-12%20at%2014.28.49.png"> <img width="320" alt="Favoritos" src="https://github.com/viniciusmesquitac/TVShowsAPP/blob/617901ab8418f50ba20cea6ed133d3cd28b3184c/Documentation/Screenshots/Simulator%20Screen%20Shot%20-%20iPhone%208%20-%202021-04-12%20at%2014.30.05.png"> <img width="320" alt="Settings" src="https://github.com/viniciusmesquitac/TVShowsAPP/blob/617901ab8418f50ba20cea6ed133d3cd28b3184c/Documentation/Screenshots/Simulator%20Screen%20Shot%20-%20iPhone%208%20-%202021-04-12%20at%2014.30.10.png"> <img width="320" alt="PinCode" src="https://github.com/viniciusmesquitac/TVShowsAPP/blob/617901ab8418f50ba20cea6ed133d3cd28b3184c/Documentation/Screenshots/Simulator%20Screen%20Shot%20-%20iPhone%208%20-%202021-04-12%20at%2014.30.13.png"> <img width="320" alt="Search" src="https://github.com/viniciusmesquitac/TVShowsAPP/blob/617901ab8418f50ba20cea6ed133d3cd28b3184c/Documentation/Screenshots/Simulator%20Screen%20Shot%20-%20iPhone%208%20-%202021-04-12%20at%2014.30.42.png">

