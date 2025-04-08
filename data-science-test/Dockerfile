FROM jupyter/scipy-notebook:latest

# Définir le répertoire de travail
WORKDIR $HOME

# Installer Poetry
RUN curl -sSL https://install.python-poetry.org | python3 - && \
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc

# Ajouter Poetry au PATH
ENV PATH="/$HOME/.local/bin:$PATH"
ENV HOME /work

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    bash-completion

# Copier les fichiers du projet dans le conteneur
COPY pyproject.toml poetry.lock ./

# Install poetry 
RUN curl -sSL https://install.python-poetry.org | python3 -


# Installer les dépendances avec Poetry
RUN poetry install --no-root
# Poetry env
ENV POETRY_VERSION=2.1.1
ENV POETRY_CACHE $HOME/.cache/poetry
ENV POETRY_HOME /opt/.poetry
ENV PIP_CACHE_DIR $HOME/.cache/pip
ENV PATH $POETRY_HOME/bin:$PATH
# Exposer le port 8888 pour Jupyter Notebook
EXPOSE 8888

# Lancer Jupyter Notebook sans token
CMD ["start-notebook.sh", "--NotebookApp.token=''"]
