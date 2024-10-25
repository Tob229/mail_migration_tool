document.getElementById('migrationForm').addEventListener('submit', function(e) {
    e.preventDefault();

    const formData = new FormData(this);
    fetch('/migrate', {
        method: 'POST',
        body: formData
    })
    .then(response => response.json())
    .then(data => {
        let output = document.getElementById('output');
        if (data.error) {
            output.innerText = `Erreur : ${data.error}`;
        } else {
            output.innerText = `Résultat :\n${data.output}`;
        }
    })
    .catch(error => {
        document.getElementById('output').innerText = `Erreur : ${error.message}`;
    });
});
