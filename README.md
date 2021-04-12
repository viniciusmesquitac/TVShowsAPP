# TVShowsAPP

## Sobre
### Este aplicativo tem o objetivo de otimizar buscas de séries com uma interface pensada na esperiência do usuário seguindo a Human interface guidelines (HIG), me organizei para realiza-lo em 2 semanas,


## Features
* Lista todas as séries fornecidas pela API
* Buscar todas as series por nome
* Informações da série: episódios, resumo, programação da série, gênero.
* Informações dos episódios: nome, número, temporada e resumo do episodio.
* Permite favoritar séries que ficam disponiveis para serem consultadas a qualquer momento.
* Sistema para configuração de PIN (6-digitos) e bloqueio por, se compativel com o modelo, FaceID ou TouchID.

## Arquitetura
Foi utlizado o padrão arquitetural MVVM para este projeto pensando na complexidade e facilidade na realização de testes e reuso de código, como padrão de navegação foi utilizado o *coordinator*, seus beneficios como reuso e manutenabilidade estão descritos em: Navengando com coordinators[https://www.notion.so/Navegando-com-Coordinators-727359c2618b462d90d9c2cf2a5c5902]

Também utilizei repository, pensando que, caso queira salvar dados em algum outro banco ou simplismente decidir trocar a forma como estão sendo salvo os dados, poderia ser facilmente alterado através do repository
facilitando ainda mais uma possivel manuntenção de código.

## Interface
* Prototipagem, testes, Hi-Fi.
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

## Executar o Projeto
Após clonar o projeto, nenhuma configuração é necessária, basta abrir o arquivo TVShowAPP.xcworkspace file.
$ pod install

## Swift Lint
Foi utilizado o swift lint como Style Guide de código do projeto.

## Testes Unitários
Realizei testes para cada logica realizada nos arquivos de ViewModel e em algumas classes auxiliares como a de Keychain para verificar se os dados estão sendo salvos corretamente.
