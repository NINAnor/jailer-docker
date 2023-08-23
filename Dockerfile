FROM debian:trixie

ARG VERSION=15.1.5

RUN apt-get update && \
    apt-get install -yq --no-install-recommends --fix-broken default-jre wget

# https://gitlab.freedesktop.org/xdg/xdg-utils/-/issues/30
RUN wget -q https://github.com/Wisser/Jailer/releases/download/v${VERSION}/jailer-database-tools_${VERSION}-x64.deb -O jailer.deb && \
    dpkg -i jailer.deb || true && \
    mkdir -p /usr/share/desktop-directories && \
    apt-get install -yq --no-install-recommends --fix-broken && \
    rm jailer.deb

VOLUME /root/.jailer
CMD ["/opt/jailer-database-tools/bin/Jailer Database Tools"]
