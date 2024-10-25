from flask import Flask, render_template, request, redirect, url_for, Response, session
import subprocess
import time
import uuid

app = Flask(__name__)
app.secret_key = "votre_cle_secrete_pour_sessions"  # Utilisé pour gérer les sessions

# Page d'accueil
@app.route('/')
def index():
    return render_template('index.html')

# Page de confirmation de la migration
@app.route('/results')
def results():
    return render_template('results.html')

# Route pour initier la migration
@app.route('/migrate', methods=['POST'])
def migrate():
    source_server = request.form['source_server']
    source_user = request.form['source_user']
    source_pass = request.form['source_pass']
    dest_server = request.form['dest_server']
    dest_user = request.form['dest_user']
    dest_pass = request.form['dest_pass']

    # Création d'un identifiant unique pour la tâche de migration
    task_id = str(uuid.uuid4())
    session['task_id'] = task_id  # Stocker l'identifiant dans la session

    # Commande imapsync personnalisée pour chaque session utilisateur
    session['command'] = [
        "./imapsync",
        "--host1", source_server,
        "--user1", source_user,
        "--password1", source_pass,
        "--host2", dest_server,
        "--user2", dest_user,
        "--password2", dest_pass
    ]

    # Redirige vers la page de confirmation
    return redirect(url_for('results'))

# Route pour diffuser la sortie de la migration en continu
@app.route('/stream')
def stream():
    task_id = session.get('task_id')
    command = session.get('command')

    def generate():
        process = subprocess.Popen(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
        for line in process.stdout:
            yield f"data: {line}\n\n"
            time.sleep(0.1)
        yield "data: Migration terminée.\n\n"

    return Response(generate(), mimetype="text/event-stream")

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
