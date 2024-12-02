# Desafio Técnico: Simulação de Hierarquia de Processos com o Programa "Família"  

Bem-vindo ao repositório do projeto desenvolvido durante o **Desafio Técnico** da Real Seguro Viagem. Este projeto simula a hierarquia de processos, utilizando a metáfora de uma família, onde cada membro tem um papel e um ciclo de vida próprio.

---

## 📜 Descrição  

O programa utiliza **processos paralelos** em Ruby para simular os ciclos de vida de diferentes membros de uma família. Cada membro (pai, filhos e netos) possui uma **expectativa de vida definida** e executa suas ações em tempos determinados. A hierarquia é representada de forma que os filhos e netos são criados como subprocessos do pai ou dos filhos, respectivamente.

---

## 🛠️ Tecnologias Utilizadas  

- **Linguagem de Programação**: Ruby  
- **Funcionalidades**:  
  - Criação e gerenciamento de processos paralelos utilizando `fork`.  
  - Gerenciamento de tempo de vida com `sleep`.  
  - Monitoramento de processos com `Process.wait` e `Process.waitall`.  

---

## 📂 Estrutura do Código  

### Principais Funções  

1. **`simulate_life(role, lifespan)`**  
   - Simula o ciclo de vida de um membro da família.  
   - Exibe mensagens indicando nascimento, idade atual e morte.  

2. **`create_grandchild(role, lifespan, delay)`**  
   - Cria um processo representando um neto com um atraso (`delay`) no nascimento.  

3. **`create_child(role, lifespan, grandchild_role, grandchild_lifespan, grandchild_delay)`**  
   - Cria um processo representando um filho e, em seguida, cria netos associados a ele.  

4. **`simulate_family`**  
   - Gerencia a execução da família, iniciando o pai, filhos e netos, e aguardando o término de todos os processos.  

---

## 🔧 Exemplo de Execução  

Ao executar o programa, a saída representa o ciclo de vida dos membros da família, indicando:  
1. O nascimento de cada membro com seu PID.  
2. O envelhecimento com mensagens de idade a cada ano.  
3. O momento em que cada membro morre.  

Exemplo de saída:  
```plaintext
Família começa (PID: 12345)  
Pai nasceu (PID: 12345)  
Pai tem 1 anos de idade (PID: 12345)  
Filho 1 nasceu (PID: 12346)  
Neto 1 nasceu (PID: 12347)  
...  
Pai morreu aos 60 anos (PID: 12345)  
Família terminou (PID: 12345)  
```

---

## 📋 Requisitos  

- Ruby instalado (versão 2.6 ou superior).  

---

## 🚀 Como Executar  

1. Clone este repositório:  
   ```bash
   git clone https://github.com/seu-usuario/desafio-familia.git
   cd desafio-familia
   ```  

2. Execute o programa:  
   ```bash
   ruby familia.rb
   ```  

---

## 🛡️ Estrutura de Dados  

A hierarquia da família é definida em um hash que especifica os papéis e suas respectivas expectativas de vida:  
```ruby
LIFE_SPAN = {
  father: 60,
  child: 30,
  grandchild1: 12,
  grandchild2: 18
}
```

---

## 📖 Conceitos Aplicados  

- **Processos Paralelos**: Gerenciamento e criação de processos usando `fork`.  
- **Hierarquia de Processos**: Representação de relações familiares em uma árvore de processos.  
- **Sincronização**: Uso de `Process.wait` e `Process.waitall` para garantir o término correto dos subprocessos.  

---

## 🖋️ Autor  

Desenvolvido por Carlos Henrique durante o desafio da Real Seguro Viagem.