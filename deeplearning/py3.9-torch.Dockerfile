
FROM stefanistrate/deeplearning:py3.9-base
ARG TORCH_MINOR_VERSION

# Install Torch.
RUN python -m pip install --no-cache-dir --upgrade \
    pytorch-lightning \
    torch==$TORCH_MINOR_VERSION.*
