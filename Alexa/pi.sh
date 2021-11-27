#
# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License").
# You may not use this file except in compliance with the License.
# A copy of the License is located at
#
#  http://aws.amazon.com/apache2.0
#
# or in the "license" file accompanying this file. This file is distributed
# on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
# express or implied. See the License for the specific language governing
# permissions and limitations under the License.
#

if [ -z "$PLATFORM" ]; then
	echo "You should run the setup.sh script."
	exit 1
fi


START_SCRIPT="$INSTALL_BASE/startsample.sh"
START_PREVIEW_SCRIPT="$INSTALL_BASE/startpreview.sh"
CMAKE_PLATFORM_SPECIFIC=(-DGSTREAMER_MEDIA_PLAYER=ON \
    -DPORTAUDIO=ON \
    -DPORTAUDIO_LIB_PATH="$THIRD_PARTY_PATH/portaudio/lib/.libs/libportaudio.$LIB_SUFFIX" \
    -DPORTAUDIO_INCLUDE_DIR="$THIRD_PARTY_PATH/portaudio/include" \
    -DCURL_INCLUDE_DIR=${THIRD_PARTY_PATH}/curl-${CURL_VER}/include \
    -DCURL_LIBRARY=${THIRD_PARTY_PATH}/curl-${CURL_VER}/lib/.libs/libcurl.so)

GSTREAMER_AUDIO_SINK="alsasink"

install_dependencies() {
  sudo apt-get update
  sudo apt-get -y install git gcc cmake build-essential libsqlite3-dev libssl-dev libnghttp2-dev libfaad-dev libsoup2.4-dev libgcrypt20-dev libgstreamer-plugins-bad1.0-dev gstreamer1.0-plugins-good libasound2-dev sox gedit vim python3-pip screen
  pip3 install pvrecorder==1.0.2
	sudo pip3 install pvporcupine==2.0.0
	pip3 install pvporcupine==2.0.0
  sudo pip3 install pvrecorder==1.0.2
	sudo pip3 install pyyaml
	pip3 install pyyaml
	sudo pip3 install spidev
	pip3 install spidev
	sudo pip3 install gpiozero
	pip3 install gpiozero
	sudo pip3 install numpy
	pip3 install numpy
}

run_os_specifics() {
  build_port_audio
  build_curl
  echo
  echo "==============> TAP-TO-TALK IS ENABLED =============="
  echo
}


build_curl() {
  #get curl and build
  echo
  echo "==============> CLONING AND BUILDING CURL =============="
  echo

  cd $THIRD_PARTY_PATH
  wget ${CURL_DOWNLOAD_URL}
  tar xzf curl-${CURL_VER}.tar.gz
  cd curl-${CURL_VER}
  ./configure --with-nghttp2 --prefix=${THIRD_PARTY_PATH}/curl-${CURL_VER} --with-ssl
  make
}

generate_start_script() {
  cat << EOF > "$START_SCRIPT"
  cd "$BUILD_PATH/SampleApp/src"

  PA_ALSA_PLUGHW=1 ./SampleApp "$OUTPUT_CONFIG_FILE" DEBUG9
EOF

  cat << EOF > "$START_PREVIEW_SCRIPT"
  cd "$BUILD_PATH/applications/acsdkPreviewAlexaClient/src"

  PA_ALSA_PLUGHW=1 ./PreviewAlexaClient "$OUTPUT_CONFIG_FILE" DEBUG9
EOF
}

generate_test_script() {
  cat << EOF > "${TEST_SCRIPT}"
  echo
  echo "==============> BUILDING Tests =============="
  echo
  cd $BUILD_PATH
  make all test -j2
EOF
}
