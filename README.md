# Tradutor de Palavras

Aplicativo mobile (Flutter/Dart) que apresenta um vocabulário em **Português** e
exibe, sob demanda, a tradução em **Inglês** e **Espanhol**, com leitura em voz
alta da palavra (text-to-speech).

Projeto utilizado como **item de configuração** na disciplina de Gerência de
Configuração de Software (GCS), servindo de base para o Plano de Gerenciamento de
Configuração (PGC) com enfoque DevOps.

## Funcionalidades

- Navegação circular por uma lista de 12 palavras (Anterior / Próxima).
- Exibição sob demanda da tradução (Inglês e Espanhol).
- Leitura da palavra em voz alta (`flutter_tts`, biblioteca externa do pub.dev).

## Stack

| Item | Valor |
|------|-------|
| Linguagem | Dart |
| Framework | Flutter (SDK `^3.13.2`) |
| Dependência externa | `flutter_tts ^4.2.5` |
| Lint | `flutter_lints ^6.0.0` |
| Plataforma-alvo | Android |

## Como executar

```bash
flutter pub get
flutter run
```

## Como testar

```bash
flutter analyze          # análise estática (lint)
flutter test --coverage  # testes de widget + cobertura
```

## Estrutura do repositório

```
tradutor/
├── .github/workflows/   # pipelines de CI (build, lint, testes, APK)
├── android/             # projeto Android (manifests, gradle)
├── docs/adr/            # Architecture Decision Records
├── lib/                 # código-fonte da aplicação (main.dart)
├── test/                # testes automatizados de widget
├── analysis_options.yaml
├── pubspec.yaml         # dependências e versão (SemVer)
└── pubspec.lock         # versões travadas das dependências
```

## Versionamento

- **Versionamento Semântico** (`MAJOR.MINOR.PATCH`) — ver `CHANGELOG.md`.
- **Conventional Commits** (`feat`, `fix`, `docs`, `chore`, `test`, `ci`…).
- Cada release estável é marcada com uma **tag** (`vX.Y.Z`), que constitui uma
  *baseline* do produto.

## Autoria

Felipe Silveira — projeto acadêmico.
