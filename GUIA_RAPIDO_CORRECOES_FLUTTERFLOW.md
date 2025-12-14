# Guia Rápido de Correções - FlutterFlow

## 🚨 CORREÇÕES URGENTES (Fazer Hoje)

### 1. Remover Dados de Teste dos Campos de Cartão

**Página:** `PaymentUser`

**Passos no FlutterFlow:**
1. Abra a página `PaymentUser`
2. Clique em qualquer lugar vazio da página
3. No painel direito, vá em **"Backend/API Calls"** > **"Page Lifecycle"**
4. Em **"On Page Load"**, localize as ações que setam:
   - `textController3` (Número do cartão)
   - `textController4` (Validade)
   - `textController5` (CVV)
   - `textController6` (Nome)
   - `textController7` (CPF)
5. **DELETE** todas essas ações
6. Salve a página

**Por que é crítico:**
- Dados de teste podem ir para produção
- Violação de segurança PCI-DSS
- Pagamentos com dados falsos

---

### 2. Adicionar Validação de Estoque Antes de Pagar

**Página:** `CartUsers` (botão "Continuar")

**Passos no FlutterFlow:**

1. **Criar Custom Action:**
   - Menu: Custom Code > Actions > + Add Action
   - Nome: `validateStockAvailability`
   - Código:
   ```dart
   Future<bool> validateStockAvailability(
     List<DocumentReference> cartItems,
   ) async {
     for (var item in cartItems) {
       var cartDoc = await item.get();
       var productRef = cartDoc.get('product');
       var productDoc = await productRef.get();
       var quantityNeeded = cartDoc.get('quantity');
       var stockAvailable = productDoc.get('quantity');
       
       if (stockAvailable < quantityNeeded) {
         return false; // Sem estoque
       }
     }
     return true; // Tudo OK
   }
   ```

2. **Modificar botão "Continuar":**
   - Clique no botão "Continuar"
   - Em **Actions**, adicione ANTES de Navigate:
     ```
     Action 1: Call Custom Action
       - Action: validateStockAvailability
       - Parameters: FFAppState().cartUser
       - Set Variable: stockAvailable (Boolean)
     
     Action 2: Conditional
       - Condition: stockAvailable == true
       - Then: Navigate to PaymentUser
       - Else: Show Snack Bar "Produto sem estoque"
     ```

---

### 3. Corrigir Status de Pedidos Inconsistente

**Páginas:** `PaymentUser`

**Passos no FlutterFlow:**

1. **Para pagamento com Cartão (Crédito/Débito):**
   - Localize a ação "Create Document" do Order
   - Encontre o campo `status`
   - Mude de `"Pagamento Finalizado"` para `"Pagamento Confirmado"`

2. **Adicione verificação do status da API:**
   - ANTES de criar o Order:
   ```
   Action: Conditional
     If: PagamentoCartaoCall.status == 1 OR == 2
     Then: Create Order com status "Pagamento Confirmado"
     Else: Show error "Pagamento recusado"
   ```

3. **Para PIX:**
   - Mude status para `"Aguardando Pagamento"` (já está correto)
   - NÃO mude automaticamente para "Confirmado"
   - Implemente webhook para confirmar

---

## ⚠️ CORREÇÕES IMPORTANTES (Esta Semana)

### 4. Validar Campos de Cartão

**Página:** `PaymentUser`

Para cada campo de texto:

**Número do Cartão:**
1. Clique no TextField
2. Em **Properties** > **Validation**
3. Configure:
   - Input Type: `Number`
   - Min Length: `15`
   - Max Length: `16`
   - Required: `true`
   - Error Message: "Número do cartão inválido"

**Data de Validade:**
1. Configure:
   - Input Type: `Text`
   - Regex Pattern: `^(0[1-9]|1[0-2])\/20[2-9][0-9]$`
   - Error Message: "Data inválida (MM/YYYY)"

**CVV:**
1. Configure:
   - Input Type: `Number`
   - Min Length: `3`
   - Max Length: `4`
   - Error Message: "CVV inválido"

---

### 5. Código de Pedido Único

**Página:** `PaymentUser`

Substitua:
```dart
codigo: random_data.randomInteger(1, 9999)
```

Por:
```dart
codigo: DateTime.now().millisecondsSinceEpoch % 1000000
```

**Como fazer no FlutterFlow:**
1. Localize a ação "Create Document" do Order
2. No campo `codigo`, clique em "Set from Variable"
3. Selecione "Custom Code"
4. Cole: `DateTime.now().millisecondsSinceEpoch.toInt() % 1000000`

---

### 6. Adicionar Tratamento de Erros

**Página:** `PaymentUser` (botão "Continuar")

**Reordenar Actions:**

```
ORDEM ATUAL (ERRADA):
1. Criar Order
2. Chamar API de Pagamento
3. Deletar Carrinho

ORDEM CORRETA:
1. Validar dados
2. Chamar API de Pagamento
3. IF pagamento sucesso:
   a. Criar Order
   b. Criar Order Products
   c. Atualizar Estoque
   d. Deletar Carrinho
   e. Navegar para confirmação
4. ELSE:
   - Mostrar erro
   - Manter carrinho
```

**Como fazer:**
1. Clique no botão "Continuar"
2. Em Actions, reorganize usando "Conditional"
3. Coloque "Create Order" DENTRO do conditional de sucesso
4. Adicione error handling no else

---

## 📱 MELHORIAS RECOMENDADAS

### 7. Validar Número do Apartamento

**Página:** `Room`

1. Clique no TextField do número do quarto
2. Configure validação:
   - Input Type: `Number`
   - Min Value: `1`
   - Max Value: `(número máximo de quartos do hotel)`
   - Required: `true`

3. Adicione Custom Action para validar se quarto existe:
```dart
Future<bool> validateRoomExists(int roomNumber) async {
  // Query Firestore para verificar se quarto existe
  var rooms = await FirebaseFirestore.instance
    .collection('rooms')
    .where('number', isEqualTo: roomNumber)
    .get();
  return rooms.docs.isNotEmpty;
}
```

---

### 8. Tempo Estimado Dinâmico

**Página:** `OrderDone`

1. **Criar Custom Action:**
```dart
Future<int> calculateEstimatedTime(
  DocumentReference orderRef
) async {
  var orderDoc = await orderRef.get();
  var products = await FirebaseFirestore.instance
    .collection('order_products')
    .where('order', isEqualTo: orderRef)
    .get();
  
  int baseTime = 10; // minutos base
  int itemTime = products.docs.length * 5;
  
  // Contar pedidos em preparação
  var activeOrders = await FirebaseFirestore.instance
    .collection('order')
    .where('status', isEqualTo: 'Em Preparação')
    .get();
  
  int queueTime = activeOrders.docs.length * 3;
  
  return baseTime + itemTime + queueTime;
}
```

2. **Na página OrderDone:**
   - Page State Variable: `estimatedTime` (int)
   - On Page Load: Call `calculateEstimatedTime`
   - Substitua `'25 min'` por `'${estimatedTime} min'`

---

### 9. Loading States

**Todas as páginas com ações de backend:**

1. **Adicionar Page State Variable:**
   - Nome: `isLoading`
   - Type: `Boolean`
   - Default: `false`

2. **No botão de ação:**
   - Disable quando: `isLoading == true`
   - Show loading spinner quando: `isLoading == true`

3. **Action Flow:**
   ```
   1. Update Page State: isLoading = true
   2. Execute backend actions
   3. Update Page State: isLoading = false
   ```

---

### 10. Notificações Push

**Settings > Push Notifications:**

1. Configure Firebase Cloud Messaging
2. Adicione certificados iOS
3. Configure Android

**On App Launch:**
```
Action Flow:
1. Request Notification Permissions
2. Get FCM Token
3. Save Token to User Document
```

**Cloud Function (Firebase):**
```javascript
exports.notifyOrderReady = functions.firestore
  .document('order/{orderId}')
  .onUpdate(async (change, context) => {
    const newStatus = change.after.data().status;
    
    if (newStatus === 'Pronto para Entrega') {
      const userId = change.after.data().user;
      const userDoc = await admin.firestore()
        .doc(`users/${userId.id}`).get();
      const fcmToken = userDoc.data().fcmToken;
      
      await admin.messaging().send({
        token: fcmToken,
        notification: {
          title: 'Pedido Pronto!',
          body: 'Seu pedido está pronto para entrega.'
        }
      });
    }
  });
```

---

## 🧪 Como Testar

### Teste 1: Fluxo Completo de Compra
1. Adicione produto ao carrinho
2. Vá para carrinho
3. Clique em "Continuar"
4. Verifique validação de estoque
5. Preencha dados de pagamento
6. Verifique validações dos campos
7. Finalize pagamento
8. Verifique criação do pedido
9. Confirme atualização de estoque

### Teste 2: Casos de Erro
1. Tente pagar sem estoque
2. Tente pagar com cartão inválido
3. Tente pagar com dados vazios
4. Simule falha de rede
5. Verifique que carrinho não é perdido

### Teste 3: PIX
1. Selecione PIX como pagamento
2. Preencha dados
3. Verifique geração do QR Code
4. Confirme status "Aguardando Pagamento"
5. NÃO deve mudar automaticamente

---

## 📋 Checklist de Verificação

Antes de fazer deploy:

- [ ] Removidos dados de teste
- [ ] Validação de estoque implementada
- [ ] Status de pedidos padronizados
- [ ] Campos de cartão validados
- [ ] Código de pedido único
- [ ] Tratamento de erros adicionado
- [ ] Loading states implementados
- [ ] Testado fluxo completo
- [ ] Testado casos de erro
- [ ] Notificações configuradas

---

## 🆘 Problemas Comuns

**Problema:** Pedido criado mas pagamento falha
- **Solução:** Mude ordem das actions (pagar ANTES de criar order)

**Problema:** Estoque negativo
- **Solução:** Adicione validação ANTES do pagamento

**Problema:** Código duplicado
- **Solução:** Use timestamp ou UUID

**Problema:** Carrinho perde dados
- **Solução:** Sincronize com Firestore no app start

**Problema:** Loading não aparece
- **Solução:** Use Page State Variables, não App State

---

## 📞 Suporte

Para dúvidas sobre implementação:
1. Consulte documentação FlutterFlow
2. Revise código gerado em `lib/`
3. Teste em modo debug antes de deploy

**Última atualização:** 2025-12-14
