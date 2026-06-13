(defstruct local
  nome
  elemento
  dificuldade
  recompensa)

(defconstant +pyro+ 'Pyro)
(defconstant +hydro+ 'Hydro)
(defconstant +cryo+ 'Cryo)
(defconstant +electro+ 'Electro)
(defconstant +anemo+ 'Anemo)

(defun filter (pred lst)
  (remove-if-not pred lst))

;IA ajudou
(defun bonusElemental (loc)
  (let ((r (local-recompensa loc))
        (e (local-elemento loc)))
    (cond
      ((or (eq e +pyro+) (eq e +electro+)) (* r 1.20))
      ((eq e +cryo+) (* r 1.10))
      (t r))))

(defun valeAPena (loc)
  (and (> (bonusElemental loc) 500)
       (<= (local-dificuldade loc) 3)))

(defun rotaDeFarm (locais)
  (mapcar (lambda (l)
            (format nil "~a — Recompensa: R$~,2f"
                    (local-nome l)
                    (bonusElemental l)))
          (filter #'valeAPena locais)))

(defparameter *catalogo-teyvat*
  (list
   (make-local :nome "Domínio das Chamas" :elemento +pyro+ :dificuldade 3 :recompensa 420.0)
   (make-local :nome "Caverna Gelada" :elemento +cryo+ :dificuldade 2 :recompensa 480.0)
   (make-local :nome "Ruínas Electro" :elemento +electro+ :dificuldade 4 :recompensa 600.0)
   (make-local :nome "Fonte das Águas" :elemento +hydro+ :dificuldade 1 :recompensa 300.0)
   (make-local :nome "Vento Errante" :elemento +anemo+ :dificuldade 3 :recompensa 510.0)
   (make-local :nome "Campo Relampejante" :elemento +electro+ :dificuldade 3 :recompensa 450.0)))

(defun imprimir-local-com-bonus (l)
  (format t "~a (~a) Dificuldade: ~a Recompensa com bônus: R$~,2f~%"
          (local-nome l)
          (local-elemento l)
          (local-dificuldade l)
          (bonusElemental l)))

(defun main ()
  (format t "~%Catálogo completo:~%")
  (dolist (l *catalogo-teyvat*) (imprimir-local-com-bonus l))
  (format t "~%Rota de farm recomendada:~%")
  (dolist (s (rotaDeFarm *catalogo-teyvat*)) (format t "~a~%" s)))
(main)