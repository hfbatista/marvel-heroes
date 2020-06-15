
## Aplicativo de Teste Marvel-Heroes .

![Swift](https://img.shields.io/badge/linguagem-Swift-blue.svg?style=plastic)

## Funcionalidades

- Requisição Http para API externa da Marvel
- Listagem dos Herois buscados na API
- Filtro de itens na lista
- Exibir detalhes do Heroi escolhido
- Seialização e Deserialização do JSON 
- Armazenmento de informaçoes em diretório interno do App
- Requisitar API apenas quando não houver lista salva internamente 

## Requisitos

- iOS 13+
- Xcode 11.4+
- Cocoapods

## Contato

hfbatista@hotmail.com.

## Blibliotecas

- Alamofire v.5.2
- AlamofireImage v.4.1




```

## Descriçao

O projeto é capas de buscar uma lista dos herois na marvel e armazena internamente pra não ter que realizar a busca toda vez que abrir o App, mostra os detalhes dos Herois deisponiveis com suas respectivas imagens 

- Utilisado a biblioteca Alamofire por simplificar o código de requisição REST para a API da marvel 
- Utilizafo a biblioteca AlamifireImage por tornar possivel o download das thumbnails, retornadas pela API, de maneira assyncrona para serem exibidas na tela. 

