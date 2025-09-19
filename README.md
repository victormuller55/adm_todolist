# ADM TodoList

**ADM TodoList** é um aplicativo de gerenciamento de tarefas, desenvolvido em Flutter. Com ele, você pode criar, editar, concluir ou excluir tarefas de forma prática e intuitiva. O app oferece suporte a múltiplos idiomas (inglês e português) e modos de exibição claros e escuros, garantindo uma experiência personalizada para cada usuário.

## Funcionalidades

* **Adicionar tarefas**: Crie novas tarefas com facilidade.
* **Editar tarefas**: Altere detalhes de tarefas já criadas.
* **Excluir tarefas**: Remova tarefas que não são mais necessárias.
* **Marcar como concluída**: Mantenha suas tarefas organizadas marcando-as como concluídas.
* **Modo claro e escuro**: Escolha o tema que mais combina com você.
* **Suporte a múltiplos idiomas**: Inglês e português disponíveis para o usuário.

---

## Tecnologias e Linguagens

* **Linguagens**: Dart, Flutter
* **Gerenciamento de estado**: BLoC (flutter\_bloc, bloc, equatable)
* **Armazenamento local**: Hive (hive, hive\_flutter, hive\_generator, path\_provider)
* **Internacionalização**: flutter\_localization, flutter\_intl, intl\_utils
* **Testes**: bloc\_test, mocktail
* **Outras funcionalidades**: HTTP requests (http), vibração do dispositivo (vibration)

---

## Dependências

```yaml
dependencies:
  flutter_bloc: ^9.1.1
  bloc: ^9.0.0
  equatable: ^2.0.7
  http: ^1.5.0
  hive: ^2.2.3
  hive_flutter: ^1.1.0
  path_provider: ^2.1.5
  hive_generator: ^2.0.1
  build_runner: ^2.4.13
  vibration: ^3.1.3
  flutter_localization: ^0.3.3
  flutter_intl: ^0.0.1
  intl_utils: ^2.8.8
  bloc_test: ^10.0.0
  mocktail: ^1.0.4
```

---

## Instalação

1. Clone o repositório:

```bash
git clone https://github.com/seu-usuario/adm-todolist.git
```

2. Entre na pasta do projeto:

```bash
cd adm-todolist
```

3. Instale as dependências:

```bash
flutter pub get
```

4. Gere os arquivos do Hive e internacionalização (se aplicável):

```bash
flutter pub run build_runner build --delete-conflicting-outputs
flutter pub run intl_utils:generate
```

5. Execute o app:

```bash
flutter run
```
