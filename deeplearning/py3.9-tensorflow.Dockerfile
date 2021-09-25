
FROM stefanistrate/deeplearning:py3.9-base
ARG TENSORFLOW_MINOR_VERSION

# Install Tensorflow.
RUN python -m pip install --no-cache-dir --upgrade \
    tensorflow==$TENSORFLOW_MINOR_VERSION.* \
    tensorflow-addons \
    tensorflow-hub
