# Diagrama do Fluxo de Compra Correto

## 🔄 Fluxo Atual (COM PROBLEMAS)

```
[Menu] 
  ↓
[Seleciona Produto]
  ↓
[Adiciona ao Carrinho] ← ProductCartUser criado no Firestore
  ↓
[Carrinho (CartUsers)]
  ↓ Clica "Continuar"
  ↓ ❌ SEM VALIDAÇÃO DE ESTOQUE
  ↓
[Página de Pagamento (PaymentUser)]
  ↓ ❌ CAMPOS PRÉ-PREENCHIDOS COM DADOS DE TESTE
  ↓ Clica "Continuar"
  ↓
  ├─[Se PIX]
  │   ↓ ❌ CRIA ORDER ANTES DA API
  │   ├─ Cria Order (status: "Aguardando Pagamento")
  │   ├─ Chama API Pix
  │   ├─ Deleta Carrinho
  │   └─ Vai para [Página PIX]
  │       ↓ ❌ NÃO TEM CONFIRMAÇÃO AUTOMÁTICA
  │       └─ Aguarda pagamento manual
  │
  └─[Se Cartão]
      ↓ Valida Marca do Cartão
      ↓ Chama API de Pagamento
      ↓ ❌ CRIA ORDER APÓS API MAS SEM TRATAMENTO DE ERRO
      ├─ Se sucesso (status 1 ou 2):
      │   ├─ Cria Order (status: "Pagamento Finalizado") ❌ INCONSISTENTE
      │   ├─ Cria OrderProducts
      │   ├─ ❌ ATUALIZA ESTOQUE (pode dar negativo)
      │   ├─ Deleta Carrinho
      │   └─ Vai para [Room]
      │       ↓ ❌ SEM VALIDAÇÃO DE NÚMERO
      │       └─ Vai para [OrderDone]
      │           └─ ❌ TEMPO FIXO "25 min"
      │
      └─ Se falha:
          └─ Mostra erro (mas Order pode ter sido criado) ❌
```

---

## ✅ Fluxo Correto (COMO DEVE SER)

```
[Menu/Categorias]
  ↓
[Item Details]
  ↓ Seleciona quantidade/opcionais
  ↓ Clica "Adicionar ao Carrinho"
  ↓
[Validation Layer] ✅ NOVO
  ├─ Verifica estoque disponível
  ├─ Valida quantidade mínima/máxima
  └─ Valida se produto está ativo
  ↓ Se válido:
  ↓
[ProductCartUser criado]
  ├─ Firestore: product, quantity, total, user
  ├─ AppState.cartUser atualizado
  └─ AppState.somaCarrinho calculado
  ↓
[Carrinho (CartUsers)]
  ↓
  ├─ Mostra lista de produtos
  ├─ Permite alterar quantidade
  ├─ Permite remover items
  └─ Mostra total atualizado
  ↓ Clica "Continuar"
  ↓
[Validação de Estoque] ✅ CRÍTICO
  ├─ Para cada item no carrinho:
  │   ├─ Busca produto atual no Firestore
  │   ├─ Compara quantity necessária vs disponível
  │   └─ Se insuficiente: Mostra erro + remove item
  └─ Se tudo OK: Continua
  ↓
[Página de Pagamento (PaymentUser)]
  ↓
  ├─ ✅ Campos VAZIOS (sem dados de teste)
  ├─ ✅ Validação em tempo real
  ├─ Seleciona método: Pix | Débito | Crédito
  └─ Clica "Continuar"
  ↓
[Validação de Formulário] ✅ NOVO
  ├─ Valida todos os campos obrigatórios
  ├─ Valida formato de cartão (Luhn algorithm)
  ├─ Valida data de validade (futura)
  ├─ Valida CVV (3-4 dígitos)
  └─ Se inválido: Mostra erros específicos
  ↓ Se válido:
  ↓
  ├─────────────────────────────────────────────────────────
  │                                                         │
  │  [Se PIX]                      [Se Cartão]             │
  │    ↓                              ↓                     │
  │  [Loading State ON] ✅          [Loading State ON] ✅  │
  │    ↓                              ↓                     │
  │  [API Pix]                      [Valida Marca]         │
  │    ├─ nomeCompleto                ↓                     │
  │    ├─ cpfCnpj                   [API Pagamento]        │
  │    ├─ tipo: CPF                   ├─ type              │
  │    └─ valor                       ├─ cardNumber        │
  │    ↓                              ├─ cvv               │
  │  [Resposta API]                   ├─ expedition        │
  │    ├─ Se sucesso:                 ├─ holderName        │
  │    │   ├─ QR Code gerado          └─ valor             │
  │    │   ├─ Payment ID              ↓                     │
  │    │   └─ Continua             [Resposta API]          │
  │    │                              ↓                     │
  │    └─ Se erro:                    ├─ Se status 1 ou 2: │
  │        ├─ Mostra erro             │   └─ Continua      │
  │        ├─ Loading OFF             │                     │
  │        └─ PARA (mantém carrinho)  └─ Se erro:          │
  │    ↓                                  ├─ Mostra erro    │
  │  [Transação Firestore] ✅ NOVO       ├─ Loading OFF    │
  │    ├─ BEGIN TRANSACTION              └─ PARA           │
  │    ├─ Cria Order:                    ↓                  │
  │    │   ├─ user                     [Transação] ✅       │
  │    │   ├─ date                       ├─ BEGIN           │
  │    │   ├─ status: "Aguardando"      ├─ Cria Order:     │
  │    │   ├─ total                     │   ├─ status:     │
  │    │   ├─ payment: "Pix"            │   │  "Confirmado"│
  │    │   ├─ codigo (único)            │   ├─ codigo      │
  │    │   └─ finished: false           │   ├─ payment     │
  │    │                                 │   └─ total       │
  │    ├─ Cria OrderProducts            ├─ Cria Products  │
  │    ├─ ❌ NÃO atualiza estoque      ├─ Atualiza Estoque│
  │    ├─ Deleta ProductCartUser        ├─ Delete Cart    │
  │    ├─ Limpa AppState                ├─ Limpa AppState │
  │    ├─ COMMIT                         └─ COMMIT         │
  │    └─ Se erro: ROLLBACK            ↓                   │
  │    ↓                              [Room Selection]     │
  │  [Página PIX]                       ├─ Valida número ✅│
  │    ├─ Mostra QR Code                ├─ 1-999          │
  │    ├─ Código copiável               └─ ou "Retirar"   │
  │    ├─ Valor                         ↓                   │
  │    ├─ Payment ID                  [Atualiza Order]    │
  │    └─ ✅ Webhook aguardando         └─ room: number    │
  │    ↓                                ↓                   │
  │  [Quando pago via Webhook]       [OrderDone] ✅        │
  │    ├─ Update Order status           ├─ Calcula tempo  │
  │    │   └─ "Pagamento Confirmado"    │   estimado      │
  │    ├─ ✅ Notifica usuário           ├─ Mostra código  │
  │    └─ Vai para [Room]               ├─ Mostra total   │
  │                                      └─ Opção: Ver     │
  │                                          Pedidos        │
  └─────────────────────────────────────────────────────────
```

---

## 🔐 Camada de Segurança (Deve ser adicionada)

```
[Cloud Functions - Firebase]
  ↓
[validateStockTransaction]
  ├─ Input: List<ProductCart>
  ├─ Para cada item:
  │   ├─ Firestore Transaction
  │   ├─ Lock do produto
  │   ├─ Verifica estoque
  │   ├─ Reserva quantidade
  │   └─ Se falhar: Rollback completo
  └─ Output: Success/Failure

[processPaymentWebhook]
  ├─ Input: Payment notification
  ├─ Valida assinatura
  ├─ Busca Order por Payment ID
  ├─ Atualiza status
  ├─ ✅ Envia notificação push
  └─ Log da transação

[sendOrderNotifications]
  ├─ Trigger: Order status change
  ├─ "Aguardando Pagamento" → No action
  ├─ "Pagamento Confirmado" → Push: "Pagamento confirmado"
  ├─ "Em Preparação" → Push: "Pedido em preparo"
  ├─ "Pronto para Entrega" → Push: "Pedido pronto!"
  └─ "Entregue" → Push: "Bom apetite!"
```

---

## 📊 Estados do Pedido (Ciclo de Vida)

```
[Novo] (não existe ainda)
  ↓ Pagamento iniciado
[Aguardando Pagamento] (PIX)
  ↓ Webhook confirma
  ├─ PIX pago → [Pagamento Confirmado]
  └─ Timeout → [Cancelado]

[Pagamento Confirmado] (Cartão aprovado ou PIX confirmado)
  ↓ Admin aceita
[Em Preparação]
  ↓ Admin marca como pronto
[Pronto para Entrega]
  ↓ Entregue ao cliente
[Entregue]
  ↓
[Concluído]

[Cancelado] (pode acontecer em qualquer etapa)
  └─ Motivos: Timeout PIX, Admin cancelou, Cliente cancelou
```

---

## 🔄 Sincronização de Dados

```
[App State (Memória)]           [Firestore (Database)]
     ↕️                                 ↕️
  cartUser  ←→ Sync ←→  ProductCartUser (Collection)
  somaCarrinho                   ↕️
     ↕️                         Menu (Products)
  orderId                          ↕️
  pedidoEmAndamento           Order (Collection)
                                   ↕️
                             OrderProducts (Collection)
```

**Regra:** Sempre que alterar Firestore, sincronize App State
**Regra:** App State é cache temporário, Firestore é source of truth

---

## ⚡ Pontos Críticos de Performance

```
[1. Listagem de Produtos]
    ↓
    Problema: Query sem limite
    Solução: Adicionar .limit(20) + pagination
    
[2. Carrinho]
    ↓
    Problema: StreamBuilder para cada item
    Solução: Um StreamBuilder para lista completa
    
[3. Cálculo de Total]
    ↓
    Problema: Recalcula em cada render
    Solução: Usar cached value, atualizar só quando muda
    
[4. Imagens]
    ↓
    Problema: Carrega imagem full size
    Solução: Usar thumbnails + lazy loading
```

---

## 🧪 Cenários de Teste

### Teste 1: Compra Normal com Cartão
```
✅ Adicionar produto
✅ Ir para carrinho
✅ Verificar estoque (deve passar)
✅ Preencher cartão válido
✅ Pagamento aprovado
✅ Estoque atualizado
✅ Carrinho limpo
✅ Pedido criado
✅ Navegar para Room
✅ Informar apartamento
✅ Ver confirmação com código
```

### Teste 2: Produto Sem Estoque
```
✅ Adicionar produto
✅ Outro usuário compra último item
✅ Ir para carrinho
✅ Clicar continuar
❌ Deve mostrar erro "Sem estoque"
✅ Produto removido do carrinho
✅ Carrinho atualizado
```

### Teste 3: Pagamento com Cartão Recusado
```
✅ Adicionar produto
✅ Ir para carrinho
✅ Preencher cartão (será recusado)
✅ Clicar continuar
❌ API retorna erro
✅ Mensagem de erro exibida
✅ Order NÃO foi criado
✅ Carrinho mantido
✅ Estoque NÃO alterado
```

### Teste 4: PIX Abandonado
```
✅ Adicionar produto
✅ Selecionar PIX
✅ Pagar (cria order)
✅ Ver QR Code
❌ Usuário não paga
⏱️ Timeout 15 minutos
✅ Webhook marca como cancelado
✅ Estoque NÃO foi alterado (correto)
```

### Teste 5: Falha de Rede
```
✅ Adicionar produto
✅ Ir para pagamento
✅ Preencher dados
❌ Desconectar internet
✅ Clicar continuar
❌ Erro de rede
✅ Mensagem de erro
✅ Loading desabilitado
✅ Pode tentar novamente
✅ Dados do formulário mantidos
```

---

## 📝 Notas Importantes

1. **NUNCA** criar Order antes de confirmar pagamento
2. **SEMPRE** validar estoque antes de processar pagamento
3. **SEMPRE** usar transações para operações críticas
4. **SEMPRE** ter rollback em caso de erro
5. **NUNCA** armazenar dados completos de cartão
6. **SEMPRE** logar erros para debugging
7. **SEMPRE** notificar usuário sobre mudanças de status

---

**Legenda:**
- ✅ Implementado corretamente
- ❌ Problema identificado
- 🔄 Precisa de sincronização
- ⚡ Ponto de atenção de performance
- 🔐 Requer segurança adicional
