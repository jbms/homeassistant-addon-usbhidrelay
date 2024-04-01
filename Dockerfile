ARG BUILD_FROM
FROM $BUILD_FROM

# Install dependencies.
RUN \
  apk add --no-cache \
    build-base \
    hidapi-dev \
    python3 \
    python3-dev \
    git \
    argp-standalone \
    py3-build \
    py3-wheel

WORKDIR /src

COPY . /src

RUN make gitversion.h && cd usbrelay_py && python -m build --wheel

ARG BUILD_FROM
FROM $BUILD_FROM

RUN \
  apk add --no-cache \
    hidapi \
    python3 \
    py3-pip \
    py3-paho-mqtt

COPY --from=0 /src/usbrelay_py/dist/*.whl /tmp

RUN pip install --break-system-packages /tmp/*.whl && rm /tmp/*.whl

COPY usbrelayd /
COPY addon.sh /
RUN chmod a+x /addon.sh

CMD [ "/addon.sh" ]
