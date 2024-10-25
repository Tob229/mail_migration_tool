# Utiliser une image Python de base
FROM python:3.9-slim

# Installer les dépendances nécessaires pour Python et Perl
RUN apt-get update && apt-get install -y \
    wget \
    make \
    time \
    cpanminus \
    libauthen-ntlm-perl \
    libclass-load-perl \
    libcrypt-openssl-rsa-perl \
    libcrypt-ssleay-perl \
    libdata-uniqid-perl \
    libdigest-hmac-perl \
    libdist-checkconflicts-perl \
    libencode-imaputf7-perl \
    libfile-copy-recursive-perl \
    libfile-tail-perl \
    libio-compress-perl \
    libio-socket-inet6-perl \
    libio-socket-ssl-perl \
    libio-tee-perl \
    libjson-webtoken-perl \
    libmail-imapclient-perl \
    libmodule-scandeps-perl \
    libnet-dbus-perl \
    libnet-ssleay-perl \
    libpar-packer-perl \
    libproc-processtable-perl \
    libreadonly-perl \
    libregexp-common-perl \
    libsys-meminfo-perl \
    libterm-readkey-perl \
    libtest-fatal-perl \
    libtest-mock-guard-perl \
    libtest-mockobject-perl \
    libtest-pod-perl \
    libtest-requires-perl \
    libtest-simple-perl \
    libunicode-string-perl \
    liburi-perl \
    libtest-nowarnings-perl \
    libtest-deep-perl \
    libtest-warn-perl && \
    rm -rf /var/lib/apt/lists/*

# Définir le répertoire de travail
WORKDIR /app

# Télécharger et configurer imapsync
RUN wget -N https://raw.githubusercontent.com/imapsync/imapsync/master/imapsync && \
    chmod u+x imapsync

# Copier le fichier requirements.txt et installer les dépendances Python
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copier les fichiers de l’application
COPY . .

# Exposer le port 5000
EXPOSE 5000

# Lancer l’application Flask
CMD ["python", "app.py"]
