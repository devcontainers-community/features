#!/bin/bash
set -e
source _common.sh

check_packages wget

# https://dart.dev/get-dart
apt-get update
apt-get install apt-transport-https
wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor -o /usr/share/keyrings/dart.gpg
echo 'deb [signed-by=/usr/share/keyrings/dart.gpg arch=amd64] https://storage.googleapis.com/download.dartlang.org/linux/debian stable main' | sudo tee /etc/apt/sources.list.d/dart_stable.list

sudo apt-get update
if [[ -z $VERSION || $VERSION == latest ]]; then
  apt-get install dart
else
  apt-get install "dart=$VERSION"
fi

# Now that we have Dart installed to /usr/lib/dart/bin, we need to expose that
# to future shell sessions via $PATH.
updaterc 'export PATH="$PATH:/usr/lib/dart/bin"'
