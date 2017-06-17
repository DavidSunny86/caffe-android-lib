FROM ubuntu:16.04

RUN apt-get update && apt-get install -y --no-install-recommends \
	automake \
	build-essential \
	ca-certificates \
	curl \
	cmake \
	file \
	git \
	libtool \
	pkg-config \
	unzip \
	wget

ADD http://dl.google.com/android/repository/android-ndk-r11c-linux-x86_64.zip /opt/android-ndk-r11c-linux-x86_64.zip
WORKDIR /opt
RUN unzip android-ndk-r11c-linux-x86_64.zip && rm -f android-ndk-r11c-linux-x86_64.zip

COPY . /caffe-android-lib

ENV NDK_ROOT=/opt/android-ndk-r11c \
	N_JOBS=4 \
	ANDROID_ABI=arm64-v8a

WORKDIR /caffe-android-lib
