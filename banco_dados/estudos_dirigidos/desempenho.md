
# **Roteiro de Estudo Dirigido**  
- **Tema:** Desempenho e Otimizações em Bancos de Dados Relacionais
- **Duração:** 2h  

---

## **1. Objetivos da Atividade**  
✔️ Compreender os principais fatores que afetam o desempenho de um banco de dados relacional.  
✔️ Identificar técnicas e estratégias para otimizar consultas SQL e estrutura de tabelas.  
✔️ Aplicar índices, análise de planos de execução e outras boas práticas de otimização.  

---

## **2. Material Necessário**  
- MySQL instalado no ambiente de laboratório (e.g., XAMPP).  
- Ferramenta de administração de banco de dados (phpmyadmin, pgAdmin, MySQL Workbench, etc.).  

---

## **3. Atividade**  

### **🕒 30 min → Introdução e Conceitos Fundamentais** 
- Pesquise como os seguintes fatores que afetam a performance:  
  - Estrutura das tabelas e normalização  
  - Índices  
  - Custos de leitura e escrita  
  - Locks e concorrência  
  - Plano de execução das consultas  
- Pesquise como usar  ``EXPLAIN`` e ``EXPLAIN ANALYZE``
  - (MySQL + PostgreSQL) ``EXPLAIN`` fornece uma estimativa do plano de execução de uma consulta.
  - (PostgreSQL apenas) ``EXPLAIN ANALYZE`` executa a consulta, mostra o plano de execução e indica seu desempenho real .  

---

### **🕒 30 min → Índices e sua influência no desempenho** 
- Crie um banco de dados simples e realize testes com e sem índices.  

1. Crie uma tabela de exemplo:  
   ```sql
   CREATE TABLE pedidos (
       id SERIAL PRIMARY KEY,
       cliente VARCHAR(100),
       data_pedido DATE,
       valor DECIMAL(10,2)
   );
   ```
2. Insira 500.000 registros na tabela:
   ```sql
   DELIMITER $$

   CREATE PROCEDURE InserirPedidos()
   BEGIN
      DECLARE i INT DEFAULT 1;
      
      START TRANSACTION;
      WHILE i <= 500000 DO
         INSERT INTO pedidos (cliente, data_pedido, valor)
         VALUES (
               CONCAT('Cliente ', FLOOR(RAND() * 10000)),  -- Nome aleatório
               CURDATE() - INTERVAL FLOOR(RAND() * 365 * 5) DAY,  -- Datas nos últimos 5 anos
               ROUND(RAND() * 500 + 50, 2)  -- Valores entre 50 e 550
         );
         SET i = i + 1;
      END WHILE;
      COMMIT;
   END$$

   DELIMITER ;

   CALL InserirPedidos();
   ```
3. Execute a seguinte consulta **sem índice** e avalie seu desempenho usando `EXPLAIN`:  
   ```sql
   SELECT * FROM pedidos WHERE cliente = 'João da Silva';
   ```
4. Crie um **índice** na coluna `cliente`:  
   ```sql
   CREATE INDEX idx_cliente ON pedidos(cliente);
   ```
5. Reexecute a consulta e comparar o desempenho usando `EXPLAIN`.  

📝 **Discussão:** Explique brevemente quando índices ajudam e quando podem prejudicar a performance?  

---

### **🕒 30 min → Otimização de Consultas SQL**
Reescreva as seguintes consultas SQL ineficientes, otimizando elas para obter melhor desempenho.  

❌ **Consulta ineficiente 01 (WHERE com função)**  
```sql
SELECT * FROM pedidos WHERE EXTRACT(YEAR FROM data_pedido) = 2023;
```

❌ **Consulta ineficiente 02 (ORDER BY sem índice)**  
```sql
SELECT * FROM pedidos ORDER BY cliente;
```

❌ **Consulta ineficiente 03 (LIKE com curinga no início)**  
```sql
SELECT * FROM pedidos WHERE cliente LIKE '%Silva';
```

Cada aluno ou grupo deve justificar suas otimizações.  

---

### **🕒 30 min → Desafios Finais e Discussão** 

💬 **Discussão final:** Elabore uma breve apresentação sobre os principais aprendizados da atividade, dificuldades em sua realização e como elas foram (ou nao) superadas.
