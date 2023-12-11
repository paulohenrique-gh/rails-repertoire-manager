# Repertoire Manager 

Versão Ruby: 3.2.1

Versão Rails: 7.1.2

Instalar dependências:
```
bundle install
```

Criar o banco de dados:
```
rails db:migrate
```

Iniciar o servidor:
```
rails server
```

Porta padrão: [3000](http://localhost:3000)

## Cadastro de usuário
Para acessar qualquer funcionalidade, é necessário criar uma conta de usuário. O cadastro é feito com nome de usuário, e-mail e senha.

## Cadastro de instrumento
O usuário pode cadastrar instrumentos em sua conta, através de um formulário disponível na página de índice dos instrumentos, disponível na opção "Instrumentos" do menu. O único dado obrigatório é o nome do instrumento. Após o cadastro, o instrumento é listado no índice com um link para sua página de detalhes. A partir da página de detalhes, também é possível entrar no formulário de edição

## Cadastro de período musical
O usuário pode cadastrar períodos musicais. Na opção "Períodos" está disponível um link que direciona para o formulário de cadastro. Os dados necessários são: nome do período, ano aproximado de início e ano aproximado de término. Opcionalmente, o usuário pode incluir notas sobre o período. Após cadastro, o período fica disponível no índice de períodos, com um link para sua página de detalhes. A partir da página de detalhes, é possível editar o período