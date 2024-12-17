# Titre du Projet : Mail Migration Tool

## Description
Mail Migration Tool est une application web conteneurisée conçue pour faciliter la migration d'emails entre deux serveurs IMAP, en s’appuyant sur l’outil `imapsync`. L'application permet aux utilisateurs de saisir les informations de connexion pour les serveurs source et destination et de déclencher la migration des emails en un seul clic. Une interface conviviale permet de suivre la progression de la migration en temps réel. 

Ce projet vise à simplifier les migrations d'emails, notamment lors de changements d'hébergement ou de serveur, en rendant le processus accessible depuis une interface web sans configuration de fichiers en ligne de commande. 

## Fonctionnalités
- Saisie des informations de connexion aux serveurs source et destination via une interface web.
- Lancement de la migration IMAP des emails avec un suivi en direct des logs de migration.
- Architecture conteneurisée, permettant de déployer l'application facilement.
- Gestion multi-utilisateur pour permettre à plusieurs personnes d'accéder à l'outil depuis différents hôtes simultanément.
  
## Prérequis
- **Docker** : L'application est conçue pour être déployée dans un conteneur Docker.
- **Python 3.9+** : Utilisé pour le backend de l'application.
- **Perl et imapsync** : `imapsync` est utilisé pour effectuer la migration des emails, avec plusieurs modules Perl requis pour son bon fonctionnement.

## Installation
1. **Cloner le dépôt** sur votre machine locale :
   ```bash
   git clone https://github.com/Tob229/mail_migration_tool.git
   cd mail_migration_tool
   ```

2. **Construire l’image Docker** :
   ```bash
   docker build -t mail_migration_tool .
   ```

3. **Exécuter l’image Docker** en exposant le port 5000 :
   ```bash
   docker run -p 5000:5000 mail_migration_tool
   ```
4. **Ou vous téléchargez l'image depuis le docker hub** :
   ```bash
   docker push levide229/mail_migration_tool:latest
   ```

## Utilisation
1. **Accéder à l’interface** : Rendez-vous sur `http://<IP_du_serveur>:5000` dans un navigateur.
2. **Saisir les informations de connexion** : Entrez les identifiants du serveur IMAP source et de destination.
3. **Lancer la migration** : Cliquez sur “Migrer les emails” pour démarrer la migration. Vous pouvez suivre le journal en direct pour voir la progression.
4. **Confirmation** : Un message de confirmation s'affiche une fois la migration terminée.

## Contribuer
Les contributions sont les bienvenues. Veuillez ouvrir une *issue* ou soumettre une *pull request* avec vos améliorations ou suggestions.

## Licence
Ce projet est sous licence MIT. Vous êtes libre de l’utiliser, de le modifier et de le distribuer sous les conditions de la licence.

