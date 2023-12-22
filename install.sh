#!/bin/bash

FLUTTER_VERSION="3.16.5"

if [ -d "flutter" ]; then
    echo "Flutter already installed"
else
    git clone -b $FLUTTER_VERSION https://github.com/flutter/flutter.git
fi

ls
flutter/bin/flutter --version
flutter/bin/flutter config --enable-web
flutter/bin/flutter pub get
flutter/bin/flutter build web --release