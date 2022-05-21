FROM stefanistrate/deeplearning:py3.9-base

ARG VERSION

# Install Torch.
RUN python -m pip install --no-cache-dir --upgrade \
    pytorch-lightning \
    torch==$VERSION.*
