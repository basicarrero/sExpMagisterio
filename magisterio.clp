;;;======================================================
;;;   Sistema Vocacional Grado Magisterio prototipo_1
;;;======================================================

;;;******************************
;;;* INFERENCE ENGINE TEMPLATES *
;;;******************************

(deftemplate alumnoPrimaria
	(slot id)
	(slot religion (type NUMBER) (default 0))
	(slot musica (type NUMBER) (default 0))
	(slot efisica (type NUMBER) (default 0))
	(slot ingles (type NUMBER) (default 0))
	(slot frances (type NUMBER) (default 0))
	(slot apt (type NUMBER) (default 0))
	(slot al (type NUMBER) (default 0)))

(deftemplate alumnoInfantil
	(slot id)
	(slot religion (type NUMBER) (default 0))
	(slot efisica (type NUMBER) (default 0))
	(slot ingles (type NUMBER) (default 0))
	(slot nde (type NUMBER) (default 0)))

(deftemplate creyente (slot id))
(deftemplate practicante (slot id))
(deftemplate colaboradorReligioso (slot id))
(deftemplate religioso (slot id))
(deftemplate proReligionCP (slot id))

(deftemplate deportista (slot id))
(deftemplate deportistaProfesional (slot id))
(deftemplate buenaForma (slot id))
(deftemplate deporteEquipo (slot id))
(deftemplate entusiastaDeporte (slot id))

(deftemplate paisAngloparlante (slot id))
(deftemplate academiaIngles (slot id))
(deftemplate amigosIngleses (slot id))
(deftemplate padreBilingueIngles (slot id))
(deftemplate leeIngles (slot id))

(deftemplate experienciaDiscapacitados (slot id))
(deftemplate proIntegracion (slot id))
(deftemplate paciente (slot id))
(deftemplate estructurado (slot id))
(deftemplate trabajoIndividual (slot id))

(deftemplate estanciaEstranjero (slot id) (slot idioma))
(deftemplate academiaIdiomas (slot id) (slot idioma))
(deftemplate amigosExtranjeros (slot id) (slot idioma))
(deftemplate padreBilingue (slot id) (slot idioma))
(deftemplate lecturaIdiomas (slot id) (slot idioma))

(deftemplate instrumentoMusical (slot id))
(deftemplate conservatorio (slot id))
(deftemplate grupoMusical (slot id))
(deftemplate cantante (slot id))
(deftemplate musicaClasica (slot id))

(deftemplate bibliografiaDiscapacidad (slot id))
(deftemplate lenguaSignos (slot id))
(deftemplate lenguajeBase (slot id))
(deftemplate lenguajePrioridad (slot id))

;;;******************************
;;;* INFERENCE ENGINE RULES     *
;;;******************************

(defrule creyente
	(or ?alumno <- (alumnoInfantil (id ?i)(religion ?r))
	    ?alumno <- (alumnoPrimaria (id ?i)(religion ?r)))
	?propiedad <- (creyente (id ?i))
	=>
	(retract ?propiedad)
	(modify ?alumno (religion (+ ?r 1))))

(defrule practicante
	(or ?alumno <- (alumnoInfantil (id ?i)(religion ?r))
	    ?alumno <- (alumnoPrimaria (id ?i)(religion ?r)))
	?propiedad <- (practicante (id ?i))
	=>
	(retract ?propiedad)
	(modify ?alumno (religion (+ ?r 1))))

(defrule colaboradorReligioso
	(or ?alumno <- (alumnoInfantil (id ?i)(religion ?r))
	    ?alumno <- (alumnoPrimaria (id ?i)(religion ?r)))
	?propiedad <- (colaboradorReligioso (id ?i))
	=>
	(retract ?propiedad)
	(modify ?alumno (religion (+ ?r 1))))

(defrule religioso
	(or ?alumno <- (alumnoInfantil (id ?i)(religion ?r))
	    ?alumno <- (alumnoPrimaria (id ?i)(religion ?r)))
	?propiedad <- (religioso (id ?i))
	=>
	(retract ?propiedad)
	(modify ?alumno (religion (+ ?r 1))))

(defrule proReligionCP
	(or ?alumno <- (alumnoInfantil (id ?i)(religion ?r))
	    ?alumno <- (alumnoPrimaria (id ?i)(religion ?r)))
	?propiedad <- (proReligionCP (id ?i))
	=>
	(retract ?propiedad)
	(modify ?alumno (religion (+ ?r 1))))

;;;******************************

(defrule deportista
	(or ?alumno <- (alumnoInfantil (id ?i)(efisica ?ef))
	    ?alumno <- (alumnoPrimaria (id ?i)(efisica ?ef)))
	?propiedad <- (deportista (id ?i))
	=>
	(retract ?propiedad)
	(modify ?alumno (efisica (+ ?ef 1))))

(defrule deportistaProfesional
	(or ?alumno <- (alumnoInfantil (id ?i)(efisica ?ef))
	    ?alumno <- (alumnoPrimaria (id ?i)(efisica ?ef)))
	?propiedad <- (deportistaProfesional (id ?i))
	=>
	(retract ?propiedad)
	(modify ?alumno (efisica (+ ?ef 1))))

(defrule buenaForma
	(or ?alumno <- (alumnoInfantil (id ?i)(efisica ?ef))
	    ?alumno <- (alumnoPrimaria (id ?i)(efisica ?ef)))
	?propiedad <- (buenaForma (id ?i))
	=>
	(retract ?propiedad)
	(modify ?alumno (efisica (+ ?ef 1))))

(defrule deporteEquipo
	(or ?alumno <- (alumnoInfantil (id ?i)(efisica ?ef))
	    ?alumno <- (alumnoPrimaria (id ?i)(efisica ?ef)))
	?propiedad <- (deporteEquipo (id ?i))
	=>
	(retract ?propiedad)
	(modify ?alumno (efisica (+ ?ef 1))))

(defrule entusiastaDeporte
	(or ?alumno <- (alumnoInfantil (id ?i)(efisica ?ef))
	    ?alumno <- (alumnoPrimaria (id ?i)(efisica ?ef)))
	?propiedad <- (entusiastaDeporte (id ?i))
	=>
	(retract ?propiedad)
	(modify ?alumno (efisica (+ ?ef 1))))

;;;******************************

(defrule paisAngloparlante
	(or ?alumno <- (alumnoInfantil (id ?i)(ingles ?ing))
	    ?alumno <- (alumnoPrimaria (id ?i)(ingles ?ing)))
	?propiedad <- (paisAngloparlante (id ?i))
	=>
	(retract ?propiedad)
	(modify ?alumno (ingles (+ ?ing 1))))

(defrule academiaIngles
	(or ?alumno <- (alumnoInfantil (id ?i)(ingles ?ing))
	    ?alumno <- (alumnoPrimaria (id ?i)(ingles ?ing)))
	?propiedad <- (academiaIngles (id ?i))
	=>
	(retract ?propiedad)
	(modify ?alumno (ingles (+ ?ing 1))))

(defrule amigosIngleses
	(or ?alumno <- (alumnoInfantil (id ?i)(ingles ?ing))
	    ?alumno <- (alumnoPrimaria (id ?i)(ingles ?ing)))
	?propiedad <- (amigosIngleses (id ?i))
	=>
	(retract ?propiedad)
	(modify ?alumno (ingles (+ ?ing 1))))

(defrule padreBilingueIngles
	(or ?alumno <- (alumnoInfantil (id ?i)(ingles ?ing))
	    ?alumno <- (alumnoPrimaria (id ?i)(ingles ?ing)))
	?propiedad <- (padreBilingueIngles (id ?i))
	=>
	(retract ?propiedad)
	(modify ?alumno (ingles (+ ?ing 1))))

(defrule leeIngles
	(or ?alumno <- (alumnoInfantil (id ?i)(ingles ?ing))
	    ?alumno <- (alumnoPrimaria (id ?i)(ingles ?ing)))
	?propiedad <- (leeIngles (id ?i))
	=>
	(retract ?propiedad)
	(modify ?alumno (ingles (+ ?ing 1))))

;;;******************************

(defrule experienciaDiscapacitadosInfantil
	?alumno <- (alumnoInfantil (id ?i)(nde ?n))
	?propiedad <- (experienciaDiscapacitados (id ?i))
	=>
	(retract ?propiedad)
	(modify ?alumno (nde (+ ?n 1))))

(defrule proIntegracion
	?alumno <- (alumnoInfantil (id ?i)(nde ?n))
	?propiedad <- (proIntegracion (id ?i))
	=>
	(retract ?propiedad)
	(modify ?alumno (nde (+ ?n 1))))

(defrule pacienteInfantil
	?alumno <- (alumnoInfantil (id ?i)(nde ?n))
	?propiedad <- (paciente (id ?i))
	=>
	(retract ?propiedad)
	(modify ?alumno (nde (+ ?n 1))))

(defrule estructuradoInfantil
	?alumno <- (alumnoInfantil (id ?i)(nde ?n))
	?propiedad <- (estructurado (id ?i))
	=>
	(retract ?propiedad)
	(modify ?alumno (nde (+ ?n 1))))

(defrule trabajoIndividualInfantil
	?alumno <- (alumnoInfantil (id ?i)(nde ?n))
	?propiedad <- (trabajoIndividual (id ?i))
	=>
	(retract ?propiedad)
	(modify ?alumno (nde (+ ?n 1))))

;;;******************************
;;;******************************

(defrule estanciaEstranjeroIngles
	?alumno <- (alumnoPrimaria (id ?i)(ingles ?n))
	?propiedad <- (estanciaEstranjero (id ?i) (idioma ingles))
	=>
	(retract ?propiedad)
	(modify ?alumno (ingles (+ ?n 1))))

(defrule estanciaEstranjeroFrances
	?alumno <- (alumnoPrimaria (id ?i)(frances ?n))
	?propiedad <- (estanciaEstranjero (id ?i) (idioma frances))
	=>
	(retract ?propiedad)
	(modify ?alumno (frances (+ ?n 1))))

(defrule academiaIdiomasIngles
	?alumno <- (alumnoPrimaria (id ?i)(ingles ?n))
	?propiedad <- (academiaIdiomas (id ?i) (idioma ingles))
	=>
	(retract ?propiedad)
	(modify ?alumno (ingles (+ ?n 1))))

(defrule academiaIdiomasFrances
	?alumno <- (alumnoPrimaria (id ?i)(frances ?n))
	?propiedad <- (academiaIdiomas (id ?i) (idioma frances))
	=>
	(retract ?propiedad)
	(modify ?alumno (frances (+ ?n 1))))

(defrule amigosExtranjerosIngles
	?alumno <- (alumnoPrimaria (id ?i)(ingles ?n))
	?propiedad <- (amigosExtranjeros (id ?i) (idioma ingles))
	=>
	(retract ?propiedad)
	(modify ?alumno (ingles (+ ?n 1))))

(defrule amigosExtranjerosFrances
	?alumno <- (alumnoPrimaria (id ?i)(frances ?n))
	?propiedad <- (amigosExtranjeros (id ?i) (idioma frances))
	=>
	(retract ?propiedad)
	(modify ?alumno (frances (+ ?n 1))))

(defrule padreBilingueIngles
	?alumno <- (alumnoPrimaria (id ?i)(ingles ?n))
	?propiedad <- (padreBilingue (id ?i) (idioma ingles))
	=>
	(retract ?propiedad)
	(modify ?alumno (ingles (+ ?n 1))))

(defrule padreBilingueFrances
	?alumno <- (alumnoPrimaria (id ?i)(frances ?n))
	?propiedad <- (padreBilingue (id ?i) (idioma frances))
	=>
	(retract ?propiedad)
	(modify ?alumno (frances (+ ?n 1))))

(defrule eslecturaIdiomasIngles
	?alumno <- (alumnoPrimaria (id ?i)(ingles ?n))
	?propiedad <- (lecturaIdiomas (id ?i) (idioma ingles))
	=>
	(retract ?propiedad)
	(modify ?alumno (ingles (+ ?n 1))))

(defrule lecturaIdiomasFrances
	?alumno <- (alumnoPrimaria (id ?i)(frances ?n))
	?propiedad <- (lecturaIdiomas (id ?i) (idioma frances))
	=>
	(retract ?propiedad)
	(modify ?alumno (frances (+ ?n 1))))

;;;******************************

(defrule instrumentoMusical
	?alumno <- (alumnoPrimaria (id ?i)(musica ?n))
	?propiedad <- (instrumentoMusical (id ?i))
	=>
	(retract ?propiedad)
	(modify ?alumno (musica (+ ?n 1))))

(defrule conservatorio
	?alumno <- (alumnoPrimaria (id ?i)(musica ?n))
	?propiedad <- (conservatorio (id ?i))
	=>
	(retract ?propiedad)
	(modify ?alumno (musica (+ ?n 1))))

(defrule grupoMusical
	?alumno <- (alumnoPrimaria (id ?i)(musica ?n))
	?propiedad <- (grupoMusical (id ?i))
	=>
	(retract ?propiedad)
	(modify ?alumno (musica (+ ?n 1))))

(defrule cantante
	?alumno <- (alumnoPrimaria (id ?i)(musica ?n))
	?propiedad <- (cantante (id ?i))
	=>
	(retract ?propiedad)
	(modify ?alumno (musica (+ ?n 1))))

(defrule musicaClasica
	?alumno <- (alumnoPrimaria (id ?i)(musica ?n))
	?propiedad <- (musicaClasica (id ?i))
	=>
	(retract ?propiedad)
	(modify ?alumno (musica (+ ?n 1))))

;;;******************************

(defrule estructuradoPrimaria
	?alumno <- (alumnoPrimaria (id ?i)(apt ?e)(al ?l))
	?propiedad <- (estructurado (id ?i))
	=>
	(retract ?propiedad)
	(modify ?alumno (al (+ ?l 1)) (apt (+ ?e 1)) ))

(defrule trabajoIndividualPrimaria
	?alumno <- (alumnoPrimaria (id ?i)(apt ?e)(al ?l))
	?propiedad <- (trabajoIndividual (id ?i))
	=>
	(retract ?propiedad)
	(modify ?alumno (al (+ ?l 1)) (apt (+ ?e 1)) ))

;;;*******COM

(defrule experienciaDiscapacitadosPrimaria
	?alumno <- (alumnoPrimaria (id ?i)(apt ?n))
	?propiedad <- (experienciaDiscapacitados (id ?i))
	=>
	(retract ?propiedad)
	(modify ?alumno (apt (+ ?n 1))))

(defrule pacientePrimaria
	?alumno <- (alumnoPrimaria (id ?i)(apt ?n))
	?propiedad <- (paciente (id ?i))
	=>
	(retract ?propiedad)
	(modify ?alumno (apt (+ ?n 1))))

(defrule bibliografiaDiscapacidad
	?alumno <- (alumnoPrimaria (id ?i)(apt ?n))
	?propiedad <- (bibliografiaDiscapacidad (id ?i))
	=>
	(retract ?propiedad)
	(modify ?alumno (apt (+ ?n 1))))

;;;******************************

(defrule lenguaSignos
	?alumno <- (alumnoPrimaria (id ?i)(al ?n))
	?propiedad <- (lenguaSignos (id ?i))
	=>
	(retract ?propiedad)
	(modify ?alumno (al (+ ?n 1))))

(defrule lenguajeBase
	?alumno <- (alumnoPrimaria (id ?i)(al ?n))
	?propiedad <- (lenguajeBase (id ?i))
	=>
	(retract ?propiedad)
	(modify ?alumno (al (+ ?n 1))))

(defrule lenguajePrioridad
	?alumno <- (alumnoPrimaria (id ?i)(al ?n))
	?propiedad <- (lenguajePrioridad (id ?i))
	=>
	(retract ?propiedad)
	(modify ?alumno (al (+ ?n 1))))