# Estudo Dirigido Prático: Gestão de Riscos e Confiabilidade 

## 1. Avaliação e Classificação de Riscos

### 1.1 Sistema de Classificação de Riscos

**Exemplo:**
```python
class ClassificadorRisco:
    def __init__(self):
        self.limite_intoleravel = 1000000  # Perda financeira em R$
        self.limite_aceitavel = 100000
    
    def classificar_risco(self, impacto, probabilidade):
        """
        Classifica riscos em:
        - Intolerável: impacto > 1M e probabilidade > 0.1
        - ALARP: entre aceitável e intolerável
        - Aceitável: impacto < 100K e probabilidade < 0.01
        """
        valor_esperado = impacto * probabilidade
        
        if impacto > self.limite_intoleravel and probabilidade > 0.1:
            return "INTOLERÁVEL"
        elif valor_esperado > self.limite_aceitavel:
            return "ALARP"
        else:
            return "ACEITÁVEL"

# Tarefa: Execute a análise para os seguintes cenários
analisador = ClassificadorRisco()
cenarios = [
    {"impacto": 1500000, "probabilidade": 0.2},  # Explosão em planta
    {"impacto": 500000, "probabilidade": 0.001},  # Falha de equipamento
    {"impacto": 80000, "probabilidade": 0.0001}    # Erro menor
]

for cenario in cenarios:
    classificacao = analisador.classificar_risco(cenario["impacto"], cenario["probabilidade"])
    print(f"Cenário: {cenario} -> Classificação: {classificacao}")
```

## 2. Decomposição de Riscos

### 2.1 Análise Hierárquica de Riscos
```python
class AnaliseRisco:
    def decompor_risco(self, risco_principal):
        """Decompõe um risco principal em sub-riscos"""
        riscos = {
            "Falha de Sistema": [
                "Falha de Hardware", 
                "Falha de Software",
                "Falha de Rede"
            ],
            "Falha de Hardware": [
                "CPU", 
                "Memória", 
                "Armazenamento"
            ]
        }
        return riscos.get(risco_principal, [])

# Tarefa: 
# 1. Complete a decomposição para "Falha de Software"
# 2. Implemente cálculo de probabilidade composta
analise = AnaliseRisco()
print("\nDecomposição de 'Falha de Sistema':")
print(analise.decompor_risco("Falha de Sistema"))
```

## 3. Árvore de Defeitos

### 3.1 Construção de Árvore de Defeitos
```python
class ArvoreDefeitos:
    def __init__(self):
        self.eventos = {
            "Sistema Falha": ["AND", "Hardware Falha", "Software Falha"],
            "Hardware Falha": ["OR", "CPU Falha", "Memória Falha"],
            "Software Falha": ["OR", "Bug Crítico", "Config Errada"]
        }
    
    def calcular_probabilidade(self, evento, probabilidades):
        """Calcula probabilidade usando álgebra booleana"""
        if evento not in self.eventos:
            return probabilidades.get(evento, 0)
        
        operador, *filhos = self.eventos[evento]
        
        if operador == "AND":
            prob = 1.0
            for filho in filhos:
                prob *= self.calcular_probabilidade(filho, probabilidades)
        else:  # OR
            prob = 1.0
            for filho in filhos:
                prob *= (1 - self.calcular_probabilidade(filho, probabilidades))
            prob = 1 - prob
            
        return prob

# Tarefa: 
# 1. Adicione mais eventos à árvore
# 2. Calcule P(Sistema Falha) com:
#    P(CPU Falha)=0.01, P(Memória Falha)=0.02, 
#    P(Bug Crítico)=0.001, P(Config Errada)=0.005
arvore = ArvoreDefeitos()
probabilidades = {
    "CPU Falha": 0.01,
    "Memória Falha": 0.02,
    "Bug Crítico": 0.001,
    "Config Errada": 0.005
}
print(f"\nP(Sistema Falha): {arvore.calcular_probabilidade('Sistema Falha', probabilidades):.6f}")
```

## 4. Requisitos de Segurança e Redução de Riscos

### 4.1 Sistema com Controles de Segurança
```python
class SistemaSeguro:
    def __init__(self):
        self.controles = {
            "autenticacao": False,
            "backup": False,
            "criptografia": False,
            "monitoramento": False
        }
        self.risco_base = 0.5  # Risco sem controles
    
    def aplicar_controles(self, *controles_ativos):
        """Aplica controles de segurança"""
        for controle in self.controles:
            self.controles[controle] = controle in controles_ativos
    
    def calcular_risco_residual(self):
        """Calcula risco residual após controles"""
        fator_reducao = 1.0
        if self.controles["autenticacao"]:
            fator_reducao *= 0.7
        if self.controles["backup"]:
            fator_reducao *= 0.6
        # Tarefa: Adicione fatores para outros controles
        return self.risco_base * fator_reducao

# Tarefa:
# 1. Complete os fatores de redução para todos controles
# 2. Experimente diferentes combinações de controles
sistema = SistemaSeguro()
sistema.aplicar_controles("autenticacao", "backup")
print(f"\nRisco residual: {sistema.calcular_risco_residual():.2f}")
```

## 5. Especificação e Métricas de Confiabilidade

### 5.1 Cálculo de Métricas de Confiabilidade
```python
class MetricasConfiabilidade:
    def __init__(self):
        self.tempos_falha = []  # Registro de tempos entre falhas (horas)
    
    def adicionar_falha(self, tempo_falha):
        self.tempos_falha.append(tempo_falha)
    
    def mttf(self):
        """Mean Time To Failure (tempo medio entre falhas)"""
        if not self.tempos_falha:
            return 0
        return sum(self.tempos_falha) / len(self.tempos_falha)
    
    def disponibilidade(self, tempo_total):
        """Calcula disponibilidade do sistema"""
        tempo_falha = sum(self.tempos_falha)
        return (tempo_total - tempo_falha) / tempo_total
    
    # Tarefa: Implemente mais métricas:
    # 1. Taxa de falha (failures por hora operacional)

# Teste as métricas
metricas = MetricasConfiabilidade()
metricas.adicionar_falha(100)  # Sistema falhou após 100h
metricas.adicionar_falha(150)  # Próxima falha após mais 150h
print(f"\nMTTF: {metricas.mttf():.1f} horas")
print(f"Disponibilidade em 1000h: {metricas.disponibilidade(1000):.2%}")
```

## Como Executar o Estudo Dirigido:

1. Implemente as partes incompletas de cada classe
2. Execute os cenários de teste fornecidos
3. Para cada tópico, responda:
   - Como a técnica ajuda na gestão de riscos?
   - Quais limitações você identificou?
   - Como poderia ser melhorada?

**Dicas:**
- Para a árvore de defeitos, verifique as leis de probabilidade
- Nas métricas de confiabilidade, atenção às unidades de medida
- Documente suas decisões de implementação
- Teste com valores extremos