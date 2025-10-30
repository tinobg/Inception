# Inception

**Inception** est un projet DevOps consistant à déployer une infrastructure web complète en utilisant **Docker** et **Docker Compose**, au sein d’une machine virtuelle dédiée.  
L’objectif est de découvrir l’administration système moderne à travers la containerisation.

---

## 🧠 Objectifs pédagogiques

- Comprendre le fonctionnement de Docker et des images isolées
- Mettre en place une **infrastructure multi-services**
- Configurer des volumes persistants
- Gérer la communication réseau interne via un docker-network
- Utiliser TLS (HTTPS) pour sécuriser l’accès
- Automatiser le déploiement via un **Makefile**

---

## 🧱 Infrastructure mise en place

Architecture en **3 containers**, chacun avec son Dockerfile :

| Service | Description | Détails |
|--------|-------------|--------|
| **NGINX** | Reverse proxy sécurisé | TLS v1.2 / v1.3, port 443 uniquement |
| **WordPress + PHP-FPM** | Site web dynamique | Pas de serveur web intégré |
| **MariaDB** | Base de données persistante | Utilisateurs dont un admin sécurisé |

Volumes persistants dans `/home/login/data` :

- `db` → Base MariaDB
- `wp` → Fichiers WordPress

Réseau interne :
- 1 docker-network privé pour communiquer entre services

Entrée unique dans l’infrastructure :  
🔐 `https://<login>.42.fr` → redirection locale via `/etc/hosts`

---

## 📦 Technologies utilisées

- Docker & Docker Compose
- Debian ou Alpine Linux
- PHP-FPM
- MariaDB
- NGINX avec certificat TLS généré
- `.env` pour les variables d’environnement
- Docker Secrets pour les données sensibles

> ✅ Aucun mot de passe dans les Dockerfiles

---

## ⚙️ Utilisation

Build + lancement en un seul clic :

```sh
make
make up
make down
make clean
make fclean
make re

https://<login>.42.fr
