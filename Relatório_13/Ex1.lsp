;Feito com IA
; Definição de um tipo de dado estruturado para representar uma erva
(defstruct erva
  nome
  preco-base)

; Função para calcular a dosagem com base em peso e idade
(defun calcula-dosagem (peso idade)
  (cond
    ((or (< idade 12) (< peso 30)) "10ml")   ; crianças pequenas ou abaixo do peso
    ((and (< idade 60) (< peso 80)) "25ml") ; faixa intermediária
    (t "50ml")))                            ; demais casos

; Função para ajustar o preço conforme o nome da erva
(defun ajusta-preco (erva)
  (case (string-downcase (erva-nome erva))
    ("ginseng" (* 3.0 (erva-preco-base erva)))
    ("lotus"   (* 1.5 (erva-preco-base erva)))
    (otherwise (erva-preco-base erva))))

; Função que gera a descrição completa da erva para um paciente
(defun descricao-erva (erva peso idade)
  (format nil "Erva: ~a, Preço ajustado: R$~a, Dosagem: ~a"
          (erva-nome erva)
          (ajusta-preco erva)
          (calcula-dosagem peso idade)))

; Função principal que cria ervas e mostra descrições para pacientes
(defun main ()
  (let ((ginseng  (make-erva :nome "Ginseng"  :preco-base 10.0))
        (lotus    (make-erva :nome "Lotus"    :preco-base 8.0))
        (camomila (make-erva :nome "Camomila" :preco-base 5.0)))
    ; Paciente criança pequena
    (format t "~a~%" (descricao-erva ginseng 25 8))
    ; Paciente adulto intermediário
    (format t "~a~%" (descricao-erva lotus 60 30))
    ; Paciente adulto acima do peso
    (format t "~a~%" (descricao-erva camomila 85 65))))
(main)