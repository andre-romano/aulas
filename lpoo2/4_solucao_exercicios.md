# Solucao dos Exercicios - Módulo 3 (Classes Abstratas, Composição e Conceitos avançados)

**Sumário**:
- [Solucao dos Exercicios - Módulo 3 (Classes Abstratas, Composição e Conceitos avançados)](#solucao-dos-exercicios---módulo-3-classes-abstratas-composição-e-conceitos-avançados)
  - [Exercicio 1](#exercicio-1)
  - [Exercicio 2](#exercicio-2)
  - [Exercicio 3](#exercicio-3)
  - [Exercicio 4](#exercicio-4)
  - [Exercicio 5](#exercicio-5)
  - [Exercicio 6](#exercicio-6)

## Exercicio 1

Respostas:
1. **Qual sao as dependências entre classes?**
   1. `Sistema` depende diretamente de `BancoDeDados`: ele conhece o nome da classe concreta e a instancia dentro do próprio construtor. `BancoDeDados`, por outro lado, não depende de `Sistema` — a dependência é unidirecional (`Sistema` → `BancoDeDados`).
2. **Quem é responsável por criar a instância de `BancoDeDados`? Justifique.**
   1. O próprio `Sistema`, dentro do seu `__init__`. Isso significa que a criação do objeto está embutida na classe que o utiliza, em vez de ser responsabilidade de quem usa `Sistema` (o que seria o caso em uma injeção de dependência).
3. **Existe acoplamento entre `Sistema` e `BancoDeDados`? Ele é baixo ou alto? Justifique.**
   1. Existe, e é um acoplamento alto: `Sistema` conhece exatamente a classe concreta `BancoDeDados` e a instancia diretamente (`BancoDeDados()`), em vez de depender de uma abstração/interface. Qualquer mudança no construtor de `BancoDeDados` (ex: passar a exigir parâmetros) obriga a alterar `Sistema` também.
4. **O que aconteceria se fosse necessário substituir `BancoDeDados` por outra implementação? Explique e justifique.**
   1. Seria necessário alterar o código-fonte de `Sistema`, pois a criação da instância está fixada (*hard-coded*) ali dentro. Isso também dificulta testes automatizados, já que não é possível substituir facilmente `BancoDeDados` por um "dublê de teste" (*mock*) sem modificar `Sistema`.
5. **Como você poderia melhorar o código acima?**
   1. Aplicando injeção de dependência: `Sistema` deve receber a instância de `BancoDeDados` externamente, via construtor, em vez de criá-la internamente:

```python
class BancoDeDados:
    pass

class Sistema:
    def __init__(self, banco: BancoDeDados):
        self.banco = banco

# uso:
banco = BancoDeDados()
sistema = Sistema(banco)
```

Isso reduz o acoplamento: `Sistema` passa a depender apenas do contrato de `BancoDeDados` (que poderia até ser uma interface/classe abstrata), permitindo trocar a implementação sem alterar `Sistema`.

## Exercicio 2

Respostas:
1. **A classe possui alta ou baixa coesão?**
   1. Baixa coesão, pois a classe reúne responsabilidades de domínios diferentes: cadastro/autenticação (`cadastrar`, `alterar_senha`), notificação (`enviar_email`), relatórios (`gerar_relatorio`) e persistência (`salvar_banco`).
2. **Qual(is) as responsabilidades que não deveriam estar na classe?**
   1. `enviar_email` (pertence a um serviço de notificação), `gerar_relatorio` (pertence a um serviço de relatórios) e `salvar_banco` (pertence a um repositório de persistência).
3. **Refatore o código acima, criando classes conforme necessário.**
```python
class Usuario:
    def cadastrar(self):
        pass

    def alterar_senha(self):
        pass

class EmailService:
    def enviar_email(self, usuario):
        pass

class RelatorioService:
    def gerar_relatorio(self, usuario):
        pass

class UsuarioRepositorio:
    def salvar(self, usuario):
        pass
```

4. **Explique por que sua solução (acima) possui maior coesão.**
   1. Cada classe agora concentra responsabilidades relacionadas a um único assunto: `Usuario` cuida apenas do que diz respeito ao próprio usuário; `EmailService` cuida apenas de notificação por e-mail; `RelatorioService`, apenas de relatórios; `UsuarioRepositorio`, apenas de persistência. Uma mudança em como os e-mails são enviados, por exemplo, não exige mais tocar na classe `Usuario`.

## Exercicio 3

Respostas:
1. **`PedidoService` cria sua própria instância de `NotificadorEmail` dentro do `__init__`. Isso é um exemplo de injeção de dependência, ou o oposto disso? Justifique.**
   1. É o **oposto**. `PedidoService` cria sua própria instância de `NotificadorEmail` internamente, acoplando-se diretamente à implementação concreta. Na injeção de dependência verdadeira, `PedidoService` receberia o notificador já pronto, de fora, via construtor.
2. **O que aconteceria se precisássemos notificar por SMS em vez de e-mail? O código atual permite essa troca com facilidade?**
   1. Não. Como `NotificadorEmail` está fixado dentro do `__init__`, a única forma de usar SMS seria alterar o código-fonte de `PedidoService` diretamente. Isso não escala caso seja necessário oferecer as duas opções ou trocar o meio de notificação dinamicamente.
3. **Refatoração:**

```python
from abc import ABC, abstractmethod

class NotificadorInterface(ABC):
    @abstractmethod
    def enviar(self, mensagem: str):
        pass

class NotificadorEmail(NotificadorInterface):
    def enviar(self, mensagem: str):
        print("E-mail enviado:", mensagem)

class NotificadorSMS(NotificadorInterface):
    def enviar(self, mensagem: str):
        print("SMS enviado:", mensagem)

class PedidoService:
    def __init__(self, notificador: NotificadorInterface):
        self.notificador = notificador

    def finalizar_pedido(self, pedido: str):
        self.notificador.enviar(f"Pedido {pedido} finalizado")

# uso:
service_email = PedidoService(NotificadorEmail())
service_email.finalizar_pedido(123)

service_sms = PedidoService(NotificadorSMS())
service_sms.finalizar_pedido(456)
```

4. **Depois da refatoração, `PedidoService` e o notificador ficaram mais ou menos acoplados? E cada classe ficou mais ou menos coesa? Justifique.**
   1. O **acoplamento diminuiu**: `PedidoService` agora depende apenas da abstração `NotificadorInterface`, não de uma implementação concreta específica — ele não precisa saber se está enviando e-mail, SMS, ou qualquer outro meio. A **coesão se manteve alta** em ambos os lados: `PedidoService` continua responsável apenas pela lógica de finalizar o pedido (delegando a notificação), e cada notificador concentra-se apenas em como enviar sua própria mensagem.

## Exercicio 4
Respostas:

1. **Há duplicação nesse código? Justifique.**
   1. Sintaticamente, as duas funções fazem uma multiplicação, mas isso **não** é duplicação de regra de negócio, pois são duas operações de domínios diferentes (área geométrica vs. valor monetário) que só coincidem na operação matemática usada.
2. **Existe alguma regra de negócio que se repete? Explique.**
   1. Não. "Área de um quadrado" e "total de uma compra" são conceitos completamente distintos. Se a fórmula de área mudasse amanhã, isso não deveria afetar o cálculo de total de compra, e vice-versa. Logo, não há uma mesma regra de negócio por trás das duas funções (a repetição aqui é apenas superficial).
3. **Refatore o código, criando funções conforme necessário.**
   1. A refatoração correta aqui é **manter as duas funções separadas**, já que unificá-las associaria artificialmente dois conceitos sem relação de negócio:

```python
def calcular_area_quadrado(lado):
    """Calcula a área de um quadrado de lado `lado`."""
    return lado * lado

def calcular_total_compra(preco, quantidade):
    """Calcula o valor total de uma compra, dado o preço unitário e a quantidade."""
    return preco * quantidade
```

4. **A sua solução está de acordo com o princípio DRY? Justifique.**
   1. Sim, embora de forma talvez contraintuitiva. **DRY** não significa "nunca escrever a mesma operação matemática duas vezes", significa "não ter a mesma regra de negócio definida em mais de um lugar". 
   2. Como são regras de negócio distintas que só coincidem na operação aritmética, mantê-las separadas é a aplicação correta de **DRY** e evita o erro oposto (uma abstração desnecessária unindo conceitos não relacionados).

## Exercicio 5
Respostas:
1. **O código acima pode ser simplificado, mantendo exatamente o mesmo comportamento?**
   1. Sim.
2. **Refatore o código:**

```python
def verificar_saldo_superior(saldo, valor):
    return saldo > valor
```

A expressão `saldo > valor` já produz um valor booleano (`True` ou `False`), tornando desnecessários a variável `resultado` e o bloco `if/else`.

3. **Qual princípio está sendo aplicado na refatoração? Justifique.**
   1. **KISS (Keep It Simple)**: a versão original tinha mais código do que o necessário para produzir o mesmo resultado, repetindo o mesmo padrão do exemplo `verificar_maioridade` descrito no guia. 
   2. A versão refatorada é mais curta e igualmente (ou mais) fácil de entender, reduzindo a chance de erro e o esforço de manutenção.

## Exercicio 6
Respostas:
1. **Qual princípio está sendo violado? Justifique.**
   1. **YAGNI**, pois o requisito pedia apenas nome e data, mas a implementação antecipou uma série de atributos e métodos não solicitados (``local``, ``capacidade``, ``palestrantes``, ``patrocinadores``, ``categorias_de_ingresso``, ``moeda``, ``taxa_de_cancelamento``, ``integração_de_pagamento_internacional``). Isso aumenta a complexidade e o esforço de manutenção sem necessidade real no momento.
2. **Reescreva a classe `Evento` contendo apenas o que foi efetivamente solicitado:**

```python
class Evento:
    def __init__(self, nome, data):
        self.nome = nome
        self.data = data
```

3. **Suponha que, meses depois, o sistema realmente precise suportar múltiplas moedas. Isso significa que implementar `converter_moeda()` desde o início teria sido uma boa decisão? Por que o YAGNI defende esperar?**
   1. Não necessariamente. Mesmo que a necessidade real apareça no futuro, implementá-la antecipadamente carrega riscos: 
      1. o requisito real, quando surgir, pode ser bem diferente do que foi imaginado (ex: pode exigir conversão em tempo real via API externa, não um método simples); 
      2. o código extra fica meses sendo mantido e testado sem gerar valor real; 
      3. a implementação "adivinhada" hoje pode precisar ser descartada ou reescrita quando o requisito real aparecer (gerando um retrabalho duplo). 
   2. O YAGNI defende esperar justamente porque só quando o requisito é concreto sabemos exatamente o que precisa ser implementado, evitando construir algo "no escuro".
