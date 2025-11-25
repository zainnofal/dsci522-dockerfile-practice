FROM quay.io/jupyter/minimal-notebook:afe30f0c9ad8

# Copy the explicit conda lock file into the container
COPY conda-linux-64.lock /tmp/conda-linux-64.lock

# Use mamba (included in the image) to install packages from the lock file
RUN mamba create -n env_from_lock --file /tmp/conda-linux-64.lock && \
    mamba clean --all -y

# Activate environment by default (Jupyter needs this)
ENV PATH="/opt/conda/envs/env_from_lock/bin:${PATH}"

