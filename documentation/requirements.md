# Repertoire Manager

## Descrição Geral

A aplicação permitirá que o usuário registre músicas que aprendeu, está aprendendo ou deseja aprender, e gerencie seu repertório. A aplicação irá gerar recomendações de manutenção de repertório e ajudar na memorização de músicas de acordo com as preferências do usuário.
Por exemplo: Se o usuário marca uma música como uma peça de seu repertório, a aplicação vai recomendar datas e lembrar quando o usuário deve praticá-la

### Informações pré-cadastradas na aplicação

Antes de qualquer usuário comum se cadastrar, a aplicação já deve conter:
  - Períodos musicais
  - Instrumentos
  - Compositores
  - Gêneros musicais

Esses dados podem ser cadastrados por um administrador, via terminal ou seeds.

### Cadastro de usuário

Usuários podem se cadastrar na aplicação informando nome de usuário, e-mail e senha. Ao concluir o cadastro, o usuário será direcionado para configurações do perfil, mas pode pular essa etapa. No perfil, o usuário informará instrumentos e compositores como favoritos.

### Cadastro de música

Os usuários podem cadastrar músicas na plataforma. O formulário deverá conter:
  - Título (obrigatório)
  - Opus
  - Número
  - Outros identificadores
  - Compositor (obrigatório)
  - Instrumento (obrigatório)
  - Período (obrigatório)
  - Data de início (opcional)
  - Data de término (opcional)
  - Nível de dificuldade
  - Incluir no repertório (opcional)
  - Observações

Os campos Compostor, Instrumento e Período devem ser carregados das informações pré-cadastradas na plataforma. Caso o usuário não encontre o que procura nessas opções, ele deverá ser capaz de cadastrar no mesmo formulário.

### Edição e exclusão de música cadastrada

Após cadastrar uma música, o usuário pode editar ou exclui-la a qualquer momento

### Índice de músicas cadastradas

Deverá existir um índice de músicas cadastradas pelo usuário, e ele deve ser dividido em sessões de músicas em andamento, músicas concluídas, músicas no repertório e lista de desejos. 

### Marcar música como concluída

O usuário poderá marcar músicas como concluídas. A música deve ter a data de término atualizada para a data em que essa marcação foi feita

### Calendário

O usuário deverá ter acesso a um calendário onde poderá visualizar as músicas recomendadas para tocar naquele dia para manutenção de repertório.
Quando uma música que o usuário marcou como peça de repertório é concluída, o calendário deverá sugerir repetições em intervalos. Inicialmente os intervalos podem ser uma vez por 7 dias seguidos, depois 4 vezes a cada 2 dias, 2 vezes a cada 4 dias, 1 vez depois de 7 dias, por último 1 vez a cada 30 dias. O usuário poderá reiniciar esse ciclo a qualquer momento ou tirar a peça do repertório se quiser.