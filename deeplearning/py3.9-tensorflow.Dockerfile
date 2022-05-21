FROM stefanistrate/deeplearning:py3.9-base

ARG VERSION

# Install Tensorflow.
RUN python -m pip install --no-cache-dir --upgrade \
    tensorflow==$VERSION.* \
    tensorflow-addons \
    tensorflow-hub
