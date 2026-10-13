# Sistema de vendas

## 1. Situação-problema

Uma pequena empresa de comércio eletrônico precisa desenvolver um sistema para gerenciar seus pedidos. Atualmente, todos os cálculos são realizados manualmente, o que provoca erros na aplicação de descontos e no cálculo dos valores de entrega.

A empresa comercializa produtos físicos e digitais, com regras diferentes:

- Produtos físicos possuem peso e podem gerar custos de entrega.
- Produtos digitais não possuem custo de entrega.
- Clientes comuns recebem 5% de desconto sobre os produtos.
- Clientes VIP recebem 10% de desconto sobre os produtos.
- O sistema deve permitir adicionar produtos a um pedido, calcular o valor total e apresentar um resumo da compra.

Desafio: desenvolver uma solução orientada a objetos, evitando concentrar todas as regras em uma única classe.

## 2. Requisitos de implementação

### Parte A — Modelagem e encapsulamento

Implementar uma classe abstrata `Produto`, com os atributos `codigo`, `nome` e `preco`, além dos métodos necessários.

O sistema deve impedir a criação de produtos com preço negativo e a alteração direta de seus atributos por outras classes.

Perguntas para reflexão:

1. Por que os atributos não devem ser públicos?
2. Qual a diferença entre utilizar um construtor e atribuir valores individualmente?
3. Todo atributo precisa ter um método `set`?

### Parte B — Herança e polimorfismo

Implementar duas subclasses:

- `ProdutoFisico`: possui peso e calcula o frete como R$ 5,00 por quilograma.
- `ProdutoDigital`: não possui peso nem custo de frete.

O método `calcularFrete()` deve ser declarado em `Produto` e implementado pelas subclasses.

```

Produto p1 = new ProdutoFisico("P01", "Teclado", 100.0, 2.0);
Produto p2 = new ProdutoDigital("P02", "E-book", 50.0);

System.out.println(p1.calcularFrete()); // 10.0
System.out.println(p2.calcularFrete()); // 0.0

```

O código acima representa o comportamento esperado; os construtores e métodos ainda deverão ser implementados por voces.

Pergunta central: por que é possível chamar `calcularFrete()` em objetos diferentes por meio de referências do tipo `Produto`?

### Parte C — Composição e regras de negócio

A classe `Pedido` deve possuir um cliente e uma coleção de produtos.

Implementar os seguintes métodos:

| Método               | Responsabilidade                      |
| -------------------- | ------------------------------------- |
| `adicionarProduto()` | Adiciona um produto ao pedido         |
| `calcularSubtotal()` | Soma os preços dos produtos           |
| `calcularDesconto()` | Calcula o desconto conforme o cliente |
| `calcularFrete()`    | Soma os fretes dos produtos           |
| `calcularTotal()`    | Retorna subtotal − desconto + frete   |
| `exibirResumo()`     | Apresenta as informações do pedido    |

A classe `Pedido` não deve verificar explicitamente se o cliente é VIP ou comum para determinar o desconto. Esse comportamento deve ser responsabilidade dos próprios objetos `Cliente`.

## 3. Teste de funcionamento

Considere o seguinte cenário:

Pedido de um cliente VIP

| Item    | Valor     | Peso    |
| ------- | --------- | ------- |
| Teclado | R$ 100,00 | 0,5 kg  |
| E-book  | R$ 50,00  | Digital |
| Mouse   | R$ 80,00  | 0,5 kg  |

Subtotal: 
- R$ 100 + R$ 50,00 + R$ 80,00 = 230,00

Desconto VIP (10%): 
- R$ 23,00

Frete (1,0 kg × R$ 5,00): 
- R$ 5,00

Total esperado: 
- **R$ 212,00**

O resultado produzido pelo programa deverá coincidir com o valor esperado.

## 4. Interacao com o usuário

O sistema deverá permitir que o usuário cadastre produtos, clientes e pedidos, além de exibir o resumo do pedido.

Crie um menu de opções para que o usuário possa interagir com o sistema, como:
1. Cadastrar produto
2. Cadastrar cliente
3. Cadastrar pedido
4. Exibir resumo do pedido

Use loops ``for`` e estruturas de decisão ``if/else`` para implementar o menu, garantindo que o usuário possa realizar múltiplas operações até decidir encerrar o programa. Exemplo:

python
```
continue = True
while continue:
    print("Menu:")
    print("1. Cadastrar produto")
    print("2. Cadastrar cliente")
    # demais opções aqui
    print("5. Sair")
    
    opcao = input("Escolha uma opção: ")
    
    if opcao == "1":
        # Lógica para cadastrar produto
        pass
    elif opcao == "2":
        # Lógica para cadastrar cliente
        pass
    elif opcao == "3":
        # Lógica para cadastrar pedido
        pass
    # demais opções aqui
    elif opcao == "5":
        # continue = False faz o programa encerrar
        continue = False
    else:
        print("Opção inválida. Tente novamente.")
```

## 5. Desafio 

Modifique o sistema para permitir que o usuário escolha entre diferentes tipos de frete, como:
- Frete normal: R$ 5,00 por quilograma
- Frete expresso: R$ 10,00 por quilograma

Permita ao usuario escolher o frete que deseja aplicar ao pedido, e ajuste o cálculo do frete de acordo com a escolha.

Crie uma classe ``MenuAbstract`` deve ter metodos para ``mostrar()`` menu e ``processar()`` a escolha do usuário. 
- A classe deve ser implementado de forma a permitir a adição de novos tipos de menus no futuro, sem a necessidade de modificar o código existente.
- ``mostrar()`` deve exibir as opções do menu e solicitar a escolha do usuário.
- O metodo ``processar()`` deve ser abstrato, e cada menu concreto deve implementar sua própria lógica de processamento das opções escolhidas pelo usuário. 
  - O metodo deve retornar o proximo menu a ser exibido, ou ``None`` caso o programa deva encerrar.
