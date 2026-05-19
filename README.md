# NASA Gallery

Aplicativo Flutter que pesquisa e exibe imagens do acervo público da NASA usando a API `images-api.nasa.gov`.

## Visão geral

- Busca imagens por palavra-chave
- Mostra a galeria de resultados com visualização de miniaturas
- Exibe detalhes da imagem em um diálogo ao tocar na foto
- Navegação entre telas usando `Navigator`

## Tecnologias

- Flutter 3/Dart
- `http` para requisições HTTP
- Material Design

## Estrutura do projeto

- `lib/main.dart` — ponto de entrada do app
- `lib/features/splash/` — tela de splash inicial
- `lib/features/home_page/` — página inicial do app
- `lib/features/gallery_page/gallery_page.dart` — busca e exibição da galeria NASA
- `lib/features/gallery_page/dialog_image_details.dart` — diálogo com detalhes da imagem
- `lib/service/nasa_service.dart` — serviço para buscar imagens na API da NASA
- `lib/widgets/` — componentes reutilizáveis
- `assets/` — imagens e fontes do app

## Dependências

- `flutter`
- `http`
- `cupertino_icons`

## Como executar

1. Instale o Flutter e configure seu ambiente.
2. No terminal, navegue até a pasta do projeto:
   ```bash
   cd /nasa-gallery
   ```
3. Instale as dependências:
   ```bash
   flutter pub get
   ```
4. Execute no dispositivo ou emulador:
   ```bash
   flutter run
   ```

## Uso

- O app inicia na tela de splash.
- Navegue para a tela de galeria.
- Use o campo de busca para pesquisar imagens por tema.
- Toque em uma miniatura para ver detalhes da imagem.

## Observações

- A busca atual é feita em tempo real usando a API pública da NASA.
- Caso não haja resultados, uma mensagem informativa é exibida.
- Se ocorrer uma falha de rede ou erro da API, a interface mostra uma mensagem de erro.

## Autores

#### Marcelo Henrique
#### Luanderson Arlindo
#### Arthur Gomes
#### José Renato
#### Luiz Orlando
