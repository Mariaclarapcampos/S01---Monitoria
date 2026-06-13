(defstruct criatura
  nome
  ambiente
  periculosidade
  vidaMedia)

(defconstant +baixa+  'Baixa)
(defconstant +media+  'Media)
(defconstant +alta+   'Alta)

;IA ajudou
(defun filter (pred lst)
  (remove-if-not pred lst))

(defun filtraPorPerigo (lista-criaturas)
  (filter (lambda (c)
            (not (eq (criatura-periculosidade c) +baixa+)))
          lista-criaturas))
;--------------------------------------

(defparameter *catalogo*
  (list
   (make-criatura :nome "Peeper"
                  :ambiente "Safe Shallows"
                  :periculosidade +baixa+
                  :vidaMedia 5)
   (make-criatura :nome "Reaper Leviathan"
                  :ambiente "Open Ocean"
                  :periculosidade +alta+
                  :vidaMedia 100)
   (make-criatura :nome "Ghost Leviathan"
                  :ambiente "Deep"
                  :periculosidade +alta+
                  :vidaMedia 150)
   (make-criatura :nome "Crab Squid"
                  :ambiente "Deep"
                  :periculosidade +media+
                  :vidaMedia 40)))

(defun imprimir-criatura (c)
  (format t "~a (~a) : ~a, vida média ~a~%"
          (criatura-nome c)
          (criatura-ambiente c)
          (criatura-periculosidade c)
          (criatura-vidaMedia c)))

(defun main ()
  (format t "~%Catálogo completo:~%")
  (dolist (c *catalogo*) (imprimir-criatura c))
  (format t "~%Criaturas filtradas (periculosidade != Baixa):~%")
  (dolist (c (filtraPorPerigo *catalogo*)) (imprimir-criatura c)))
(main)