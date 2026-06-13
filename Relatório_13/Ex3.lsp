(defstruct item
  nome
  tipo
  preco
  forcaMagica)

(defconstant +arma+ 'Arma)
(defconstant +pocao+ 'Pocao)
(defconstant +artefato+ 'Artefato)

(defun filter (pred lst)
  (remove-if-not pred lst))

(defun adicionaImposto (preco)
  (* preco 1.15))

(defun bonusMaldicao (forca)
  (cond
    ((> forca 80) (* forca 1.5))
    (t forca)))

;IA ajudou
(defun descricaoVenda (it)
  (format nil "~a - Preço: R$~,2f - Força Mágica: ~,2f"
          (item-nome it)
          (item-preco it)
          (item-forcaMagica it)))

(defun processa-item (it)
  (make-item
   :nome (item-nome it)
   :tipo (item-tipo it)
   :preco (adicionaImposto (item-preco it))
   :forcaMagica (bonusMaldicao (item-forcaMagica it))))

;IA ajudou
(defun processaVenda (itens)
  (let ((armas (filter (lambda (i) (eq (item-tipo i) +arma+)) itens)))
    (mapcar (lambda (i) (descricaoVenda (processa-item i))) armas)))

(defparameter *catalogo-loja*
  (list
   (make-item :nome "Espada de Ferro"     :tipo +arma+     :preco 120.0 :forcaMagica 30.0)
   (make-item :nome "Pocao de Cura"       :tipo +pocao+    :preco 25.0  :forcaMagica 10.0)
   (make-item :nome "Amuleto Antigo"      :tipo +artefato+ :preco 300.0 :forcaMagica 95.0)
   (make-item :nome "Arco Longo"          :tipo +arma+     :preco 200.0 :forcaMagica 45.0)
   (make-item :nome "Lâmina Maldita"      :tipo +arma+     :preco 450.0 :forcaMagica 120.0)
   (make-item :nome "Elixir da Sorte"     :tipo +pocao+    :preco 60.0  :forcaMagica 85.0)))

(defun main ()
  (dolist (desc (processaVenda *catalogo-loja*))
    (format t "~a~%" desc)))
(main)