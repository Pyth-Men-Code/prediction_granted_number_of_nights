# Utiliser une image Python optimisée
FROM python:3.11-slim

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Copier les fichiers nécessaires
#COPY pyproject.toml poetry.lock ./
#COPY app ./api

# Installer Poetry
RUN pip install --no-cache-dir poetry 

# Installer les dépendances avec Poetry
RUN poetry config virtualenvs.create false \
    && poetry install --no-root --no-interaction --no-ansi

# RUN curl -sSL https://install.python-poetry.org | python3 -

# Exposer le port Flask (modifie-le si nécessaire)
EXPOSE 5000

# Définir la commande pour lancer l'API
CMD ["poetry", "run", "flask", "run", "--host=0.0.0.0", "--port=5000"]
