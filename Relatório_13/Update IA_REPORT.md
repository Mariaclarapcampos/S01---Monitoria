Maria Clara Pereira Campos - 503
EXERCÍCIO 1 Exercício 1 — Farmácia da Maomao Maomao precisa calcular a dosagem e o preço das ervas que prepara para seus pacientes. Cada erva tem um preço base, e a dosagem varia de acordo com o peso e a idade de quem vai tomar. Defina um tipo Erva com os campos nome e precoBase. Implemente calculaDosagem :: Double -> Int -> String que recebe peso e idade e usa guards para retornar a dosagem como texto — "10ml" para crianças pequenas ou abaixo do peso, "25ml" para a faixa intermediária e "50ml" para os demais casos. Implemente ajustaPreco :: Erva -> Double que usa pattern matching no nome da erva para aplicar o fator de preço — "Ginseng" multiplica por 3.0, "Lotus" multiplica por 1.5 e qualquer outro retorna o preço base sem alteração. Implemente descricaoErva :: Erva -> Double -> Int -> String que recebe uma erva, o peso e a idade do paciente e retorna uma String com o nome da erva, o preço ajustado e a dosagem indicada. Na main, crie três ervas — "Ginseng", "Lotus" e "Camomila" — e exiba a descrição para pelo menos dois pacientes com idades e pesos diferentes, cobrindo todos os casos de dosagem.
Faça o codigo em LISP e me explique como funciona para fazer

Resposta:
Perfeito, vamos montar o código em Common Lisp para o exercício da Farmácia da Maomao e eu te explico passo a passo como funciona:
;; Definição de um tipo de dado estruturado para representar uma erva
(defstruct erva
  nome
  preco-base)

;; Função para calcular a dosagem com base em peso e idade
(defun calcula-dosagem (peso idade)
  (cond
    ((or (< idade 12) (< peso 30)) "10ml")   ;; crianças pequenas ou abaixo do peso
    ((and (< idade 60) (< peso 80)) "25ml") ;; faixa intermediária
    (t "50ml")))                            ;; demais casos

;; Função para ajustar o preço conforme o nome da erva
(defun ajusta-preco (erva)
  (case (string-downcase (erva-nome erva))
    ("ginseng" (* 3.0 (erva-preco-base erva)))
    ("lotus"   (* 1.5 (erva-preco-base erva)))
    (otherwise (erva-preco-base erva))))

;; Função que gera a descrição completa da erva para um paciente
(defun descricao-erva (erva peso idade)
  (format nil "Erva: ~a, Preço ajustado: R$~a, Dosagem: ~a"
          (erva-nome erva)
          (ajusta-preco erva)
          (calcula-dosagem peso idade)))

;; Função principal que cria ervas e mostra descrições para pacientes
(defun main ()
  (let ((ginseng  (make-erva :nome "Ginseng"  :preco-base 10.0))
        (lotus    (make-erva :nome "Lotus"    :preco-base 8.0))
        (camomila (make-erva :nome "Camomila" :preco-base 5.0)))
    ;; Paciente criança pequena
    (format t "~a~%" (descricao-erva ginseng 25 8))
    ;; Paciente adulto intermediário
    (format t "~a~%" (descricao-erva lotus 60 30))
    ;; Paciente adulto acima do peso
    (format t "~a~%" (descricao-erva camomila 85 65))))

(main)
🔎 Explicação passo a passo
defstruct erva: cria um tipo de dado chamado erva com dois campos: nome e preco-base.
calcula-dosagem: usa cond (equivalente aos guardsem Haskell) para decidir a dosagem:
10ml se idade < 12 ou peso < 30.
25ml se idade < 60 e peso < 80.
50ml nos demais casos.
ajusta-preco: usa case para verificar o nome da erva e aplicar o multiplicador correto.
descricao-erva: monta uma string com nome, preço ajustado e dosagem.
main: cria três ervas (Ginseng, Lotus, Camomila) e imprime a descrição para três pacientes diferentes, cobrindo todos os casos de dosagem.
👉 Assim você tem um programa completo em Lisp que segue exatamente o enunciado.
Quer que eu te mostre como rodar esse código no SBCL (um compilador de Common Lisp bem usado), passo a passo, para você ver a saída funcionando?
EXERCÍCIO 2 Exercício 2 — Fauna de Planet 4546B O Scanner de mão do Ryley está catalogando as criaturas encontradas em 4546B. Cada criatura registrada tem seu ambiente, nível de perigo e tempo de vida, e o sistema precisa filtrar e gerar relatórios sobre elas. Defina o tipo Criatura com os campos nome, ambiente, periculosidade e vidaMedia. Crie o tipo Periculosidade com os construtores Baixa, Media e Alta. Na main, defina uma lista catalogo com pelo menos quatro criaturas — um Peeper das Safe Shallows com periculosidade Baixa, um Reaper Leviathan com Alta, e duas criaturas do ambiente "Deep" à sua escolha. Implemente filtraPorPerigo :: [Criatura] -> [Criatura] usando filter para retornar apenas as criaturas cuja periculosidade não seja Baixa.
use PF com LISP 
o tipo periculosidade que ele quer com o construtores é o mesmo periculosidade que é variavel? Ou sao coisas diferentes?


Resposta:

São conceitos diferentes, mesmo que tenham nomes parecidos.
Pelo enunciado, você tem:
Periculosidade → um tipo (ou enumeração).
Baixa, Media, Alta → os construtores/valores desse tipo.
periculosidade → um campo da estrutura Criatura.
Em pseudocódigo:
Tipo Periculosidade
    = Baixa
    | Media
    | Alta

Tipo Criatura
    nome
    ambiente
    periculosidade : Periculosidade
    vidaMedia
Então, para um Peeper:
nome = "Peeper"
ambiente = "Safe Shallows"
periculosidade = Baixa
vidaMedia = ...
Observe que:
periculosidade é o atributo da criatura.
Baixa é o valor armazenado nesse atributo.
Periculosidade é o tipo do atributo.
Em Lisp funcional, normalmente você representaria os construtores como símbolos:
'baixa
'media
'alta
e o campo periculosidade da criatura guardaria um desses valores.
Portanto, a resposta é: não, não são a mesma coisa. O campo periculosidade é uma variável/atributo da criatura; Periculosidade é o tipo desse campo, cujos valores possíveis são Baixa, Media e Alta.
Implemente filtraPorPerigo :: [Criatura] -> [Criatura] usando filter para retornar apenas as criaturas cuja periculosidade não seja Baixa.
Não entendi explique

Resposta:
filtraPorPerigo
Objetivo 
 Retornar uma lista contendo apenas as criaturas cuja periculosidade não seja Baixa.
Como funciona a versão com filter
(defun filter (pred lst)
  (remove-if-not pred lst))

(defun filtraPorPerigo (lista-criaturas)
  (filter (lambda (c)
            (not (eq (criatura-periculosidade c) +baixa+)))
          lista-criaturas))
Explicação linha a linha
filter: é um wrapper que usa remove-if-not do Common Lisp. Recebe um predicado pred e uma lista lst, e retorna os elementos para os quais pred é verdadeiro.
filtraPorPerigo: recebe lista-criaturas e chama filter com um predicado anônimo (lambda (c) ...).
(lambda (c) ...): para cada criatura c, pega o campo periculosidade com (criatura-periculosidade c).
(eq ... +baixa+): compara se a periculosidade é exatamente o símbolo +baixa+ (que representa 'Baixa). eq é usado para comparar símbolos.
(not (eq ...)): inverte a condição — o predicado retorna T quando a periculosidade não é Baixa. Assim filter mantém só essas criaturas.
Exemplo de uso e resultado esperado
Supondo o catálogo:
(defparameter *catalogo*
  (list
   (make-criatura :nome "Peeper" :ambiente "Safe Shallows" :periculosidade +baixa+ :vidaMedia 5)
   (make-criatura :nome "Reaper Leviathan" :ambiente "Open Ocean" :periculosidade +alta+ :vidaMedia 100)
   (make-criatura :nome "Ghost Leviathan" :ambiente "Deep" :periculosidade +alta+ :vidaMedia 150)
   (make-criatura :nome "Crab Squid" :ambiente "Deep" :periculosidade +media+ :vidaMedia 40)))
Chamada:
(filtraPorPerigo *catalogo*)
Resultado (lista contendo as 3 criaturas cuja periculosidade é Media ou Alta):
Reaper Leviathan
Ghost Leviathan
Crab Squid
Peeper é removido porque sua periculosidade é Baixa.
Observações e alternativas rápidas
Você pode usar remove-if em vez de filterinvertendo a condição:
(remove-if (lambda (c) (eq (criatura-periculosidade c) +baixa+)) lista-criaturas)
Ou usar looppara legibilidade:
(loop for c in lista-criaturas
      unless (eq (criatura-periculosidade c) +baixa+)
      collect c)
Use eq para comparar símbolos; se você usar strings para periculosidade, troque por string=.
Se quiser, eu mostro a saída formatada real chamando (mapcar #'criatura-nome (filtraPorPerigo *catalogo*)) para ver só os nomes das criaturas filtradas.
Exercício 3 — Loja Clandestina de Iwai Você gerencia uma loja secreta que vende armas, poções e artefatos mágicos. Cada item tem um preço e uma força mágica, e os itens mais poderosos recebem um bônus especial na hora da venda. Defina o tipo TipoItem com os construtores Arma, Pocao e Artefato. Defina o tipo Item com os campos nome, tipo, preco e forcaMagica. Implemente adicionaImposto :: Double -> Double que aumenta o preço em 15%. Implemente bonusMaldicao :: Double -> Double usando guards — se forcaMagica for maior que 80, multiplica por 1.5, caso contrário retorna o valor original. Implemente descricaoVenda :: Item -> String que recebe um item já processado e retorna uma String com o nome, o preço com imposto e a força mágica com bônus aplicado. Implemente processaVenda :: [Item] -> [String] que em sequência: filtra só os itens do tipo Arma com filter, aplica adicionaImposto no preço de cada um com map, aplica bonusMaldicao na força mágica com map, e por fim usa descricaoVenda para formatar o resultado de cada arma. Na main, crie um catálogo com pelo menos cinco itens misturando os três tipos, chame processaVenda e exiba o resultado.
me ajude com a parte de descricaoVEnda
REsposta:
(defun descricaoVenda (it)
  (format nil "~a - Preço: R$~,2f - Força Mágica: ~,2f"
          (item-nome it)
          (item-preco it)
          (item-forcaMagica it)))
me ajude com a parte de processaVenda

Reposta:
processaVenda
(defun processaVenda (itens)
  (mapcar #'descricaoVenda
          (mapcar #'processa-item
                  (filter (lambda (i) (eq (item-tipo i) +arma+)) itens))))
Explicação curta
Filtra apenas itens do tipo +arma+ com filter.
Aplica imposto e bônus a cada arma com processa-item (usando mapcar).
Formata cada item processado em string com descricaoVenda (outro mapcar).
EXERCÍCIO 4 Exercício 4 — Viajantes de Teyvat O Viajante está catalogando os domínios e chefes de campo encontrados em Teyvat. Cada local tem um elemento associado, um nível de dificuldade e uma recompensa em mora. Nahida precisa ajudar a calcular qual rota de farm vale mais a pena. Defina o tipo Elemento com os construtores Pyro, Hydro, Cryo, Electro e Anemo. Defina o tipo Local com os campos nome, elemento, dificuldade e recompensa. Implemente bonusElemental :: Local -> Double usando guards — se o elemento for Pyro ou Electro aplica um bônus de 20% na recompensa, se for Cryo aplica 10%, e nos demais casos retorna a recompensa original. Implemente valeAPena :: Local -> Bool que retorna True se a recompensa com bônus for maior que 500 e a dificuldade for menor ou igual a 3. Implemente rotaDeFarm :: [Local] -> [String] que usa filter com valeAPena para selecionar os locais recomendados e map para formatar cada um como "[NOME] — Recompensa: [VALOR]". Na main, crie um catálogo com pelo menos cinco locais com elementos e dificuldades variados, exiba a lista completa com bonusElemental de cada um e em seguida exiba apenas a rota de farm recomendada.
me ajude com a parte de bonusElemental

Resposta:
(defun bonusElemental (loc)
  (let ((r (local-recompensa loc))
        (e (local-elemento loc)))
    (cond
      ((or (eq e +pyro+) (eq e +electro+)) (* r 1.20))
      ((eq e +cryo+) (* r 1.10))
      (t r))))




Feedback:
A IA me ajudou saciando as partes que eu estava com dúvida, a primeira questão que foi feita toda com a IA foi a que mais me ajudou, pois deixou claro para mim como funciona os códigos em LISP.
