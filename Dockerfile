FROM python:3.8-slim

WORKDIR /opt/ml/code

RUN apt-get -yq update && \
    apt-get -yq upgrade && \
    apt-get install -yq --no-install-recommends \
        apt-utils \
        make \
        awscli \
        g++ \
        gcc \
        curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY ./ ./

RUN make develop_for_docker

ENV PATH="$PATH":/root/.poetry/bin
    # PYTHONPATH="$PYTHONPATH":/opt/ml/code/<module>

EXPOSE 8000

RUN mv train.sh train && chmod +x train && python -m ipykernel install
