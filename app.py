# -*- coding: utf-8 -*-
import clips
from flask import Flask, render_template, request
from flask_bootstrap import Bootstrap


app = Flask(__name__)
app.jinja_env.autoescape = False
Bootstrap(app)


@app.route("/about")
def about():
    return render_template("about.html")


@app.route("/")
def start():
    return render_template("index.html", idx=0)


@app.route("/cuestiones", methods=['POST'])
def cuestiones():
    user = request.form['id']
    tipo = request.form['tipo']
    if tipo == "primaria":
        clips.Assert(("(alumnoPrimaria (id %s))" % user))
        ret = render_template("primaria.html", user=user, idx=1)
    elif tipo == "infantil":
        clips.Assert(("(alumnoInfantil (id %s))" % user))
        ret = render_template("infantil.html", user=user, idx=1)
    return ret


@app.route("/resultados/<user>", methods=['POST'])
def resultados(user):
    cuestiones = [(k[6:], v) for k, v in request.form.items() if k.startswith('hecho_')]
    for hecho, respuesta in cuestiones:
        if respuesta == "Si":
            clips.Assert("(%s (id %s))" % (hecho, user))
        elif respuesta == "ingles":
            clips.Assert("(%s (id %s) (idioma %s))" % (hecho, user, respuesta))
        elif respuesta == "frances":
            clips.Assert("(%s (id %s) (idioma %s))" % (hecho, user, respuesta))
    clips.Run()
    context = {}
    hechos = clips.FactList()[1:]
    for h in hechos:
        if h.Slots['id'] == user:
            if h.Relation == "alumnoInfantil":
                context[u'Lengua y cultura inglesas'] = h.Slots['ingles']
                context[u'Educación Física'] = h.Slots['efisica']
                context[u'Necesidades educativas especiales'] = h.Slots['nde']
                context[u'Religión'] = h.Slots['religion']
            elif h.Relation == "alumnoPrimaria":
                context[u'Lengua extranjera: Inglés'] = h.Slots['ingles']
                context[u'Lengua extranjera: Francés'] = h.Slots['frances']
                context[u'Música'] = h.Slots['musica']
                context[u'Educación Física'] = h.Slots['efisica']
                context[u'Pedagogía Terapéutica'] = h.Slots['apt']
                context[u'Audición y Lenguaje'] = h.Slots['al']
                context[u'Religión'] = h.Slots['religion']
            h.Retract()
            break
    print context
    lista = u""
    for idx, (mencion, puntos) in enumerate(sorted(context.items(), key=lambda x: x[1], reverse=True)):
        lista += u'<li class="list-group-item"><span class="badge">{3}/5</span><h{0}>{1}.- {2}</h{0}></li>'.format(6 - puntos, idx + 1, mencion, puntos)
    return render_template("resultados.html", lista=lista, idx=2)


if __name__ == '__main__':
    clips.Load("magisterio.clp")
    clips.Reset()
    app.run(debug=True)
