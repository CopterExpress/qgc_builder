FROM sfalexrog/raspbian:buster-2019-09-30

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    libudev-dev \
    libinput-dev \
    libts-dev \
    libxcb-xinerama0-dev \
    speech-dispatcher \
    libsdl2-dev \
    libgstreamer-plugins-base1.0-dev \
    qt5-default \
    qtbase5-private-dev \
    qtbase5-dev \
    qtbase5-dev-tools \
    libqt5texttospeech5-dev \
    libqt5svg5-dev \
    libqt5opengl5-dev \
    qtmultimedia5-dev \
    libqt5serialbus5-dev \
    libqt5charts5-dev \
    libqt5serialport5-dev \
    qtdeclarative5-private-dev \
    qttools5-private-dev \
    libssl-dev \
    libgstreamer-plugins-base1.0-dev \
    git \
    build-essential \
  && rm -rf /var/lib/apt/lists

RUN mkdir -p /build_dep \
  && cd /build_dep \
  && git clone https://github.com/qt/qtlocation.git -b v5.11.3 --depth 1 \
  && cd qtlocation \
  && mkdir build \
  && cd build \
  && qmake ../qtlocation.pro \
  && make -j2 \
  && make install \
  && cd / \
  && rm -rf /build_dep
