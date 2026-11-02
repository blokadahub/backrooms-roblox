# Backrooms Roblox — projeto para celular

Protótipo de Backrooms construído com **Luau + Rojo 7.7.1**, compilado no **GitHub Actions** e publicado na experiência Roblox existente via **Open Cloud**.

## Arquivos

- `default.project.json`: estrutura do lugar usada pelo Rojo.
- `src/Backrooms.server.luau`: constrói uma sala inicial das Backrooms quando o servidor inicia.
- `.github/workflows/publish.yml`: valida, compila e, opcionalmente, publica o lugar.

## Testar a compilação sem publicar

1. Abra a aba **Actions** deste repositório.
2. Selecione **Construir e publicar Backrooms no Roblox**.
3. Clique em **Run workflow** e escolha a branch `main`.
4. Deixe a opção **publicar** desmarcada e execute.
5. Um resultado verde confirma somente a construção do arquivo, **não** o funcionamento do jogo.
6. O arquivo `backrooms-rbxlx` estará na seção **Artifacts** da execução.

## Publicar no Roblox

**Atenção: publicar substitui o conteúdo do lugar de destino.** Use apenas uma experiência de testes, ou faça backup do lugar antes de publicar.

Em **Settings → Secrets and variables → Actions**, configure:

| Tipo | Nome |
| --- | --- |
| Secret | `ROBLOX_API_KEY` |
| Variable | `ROBLOX_UNIVERSE_ID` |
| Variable | `ROBLOX_PLACE_ID` |

A chave de API do Roblox deve ter a permissão **universe-places: Write** restrita à experiência que receberá as atualizações. Nunca cole a chave nos arquivos do repositório.

Depois de uma compilação de teste bem-sucedida, execute o mesmo workflow marcando **publicar**. Confirme o retorno com `versionNumber` e teste o jogo no aplicativo Roblox. O fluxo não publica automaticamente a cada commit.

## Limitações da primeira versão

O mapa inicial é uma sala experimental. Não há ainda labirinto procedural, objetivo de fuga, áudio ambiente, monstros ou testes automáticos de jogabilidade. O script cria os objetos quando o servidor começa.

## Documentação

- [Roblox — Publicação de lugares pela Open Cloud](https://create.roblox.com/docs/cloud/guides/usage-place-publishing)
- [Rojo](https://rojo.space/docs/)
- [GitHub — Execução manual de workflows](https://docs.github.com/en/actions/how-tos/manage-workflow-runs/manually-run-a-workflow)
