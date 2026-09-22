# ADR 0001 — Arquitetura inicial e decisões de configuração

- **Status:** Aceito
- **Data:** 2026-09-22
- **Autor:** Felipe Silveira

## Contexto

O Tradutor de Palavras é um aplicativo mobile simples, desenvolvido
individualmente na disciplina de Programação Mobile e reaproveitado como item de
configuração na disciplina de Gerência de Configuração de Software. É necessário
registrar as decisões técnicas iniciais e a estratégia de configuração adotada.

## Decisões

1. **Framework:** Flutter/Dart, por permitir uma base de código única com foco
   em Android e por ser a stack usada na disciplina.
2. **Text-to-speech:** uso da biblioteca externa `flutter_tts` (pub.dev) em vez
   de implementação própria, reduzindo esforço e risco.
3. **Estado:** gerenciamento de estado local com `StatefulWidget`
   (`setState`), suficiente para o escopo atual (uma única tela).
4. **Dados:** vocabulário mantido em memória, em uma lista de objetos `Palavra`.
   Não há persistência nem backend — não há scripts de migração de banco (N/A).
5. **Estratégia de branching:** Trunk-Based Development, com `main` sempre
   implantável e branches de feature de vida curta.
6. **Versionamento:** SemVer + Conventional Commits, com tags marcando baselines.
7. **Qualidade:** `flutter analyze` + `flutter test` executados no pipeline de CI
   como quality gate obrigatório para merge.

## Consequências

- Simplicidade e baixo custo de manutenção para o escopo acadêmico.
- Caso o vocabulário cresça ou exija edição pelo usuário, será necessário
  reavaliar a decisão (5) e introduzir persistência (novo ADR).
