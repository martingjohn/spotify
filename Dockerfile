FROM martinjohn/x-template

USER root

RUN apt-get update \
 && apt-get install -y \
            --no-install-recommends \
            gnupg \
            software-properties-common \
 && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0DF731E45CE24F27EEEB1450EFDC8610341D9410 \
 && add-apt-repository "deb [arch=amd64] http://repository.spotify.com stable non-free" \
 && apt-get update \
 && apt-get install -y \
            --no-install-recommends \
            spotify-client \
            libcanberra-gtk-module \
 && rm -rf /var/lib/apt/lists/*

USER $user

ENTRYPOINT "spotify"
