# Webcamoid, webcam capture application.
# Copyright (C) 2017  Gonzalo Exequiel Pedone
#
# Webcamoid is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Webcamoid is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Webcamoid. If not, see <http://www.gnu.org/licenses/>.
#
# Web-Site: http://webcamoid.github.io/

exists(akcommons.pri) {
    include(akcommons.pri)
} else {
    exists(../../../../../akcommons.pri) {
        include(../../../../../akcommons.pri)
    } else {
        error("akcommons.pri file not found.")
    }
}

include(../cmio.pri)

CONFIG += plugin

!isEmpty(NOAPPBUNDLE): DEFINES += AKVCAM_NOAPPBUNDLE

HEADERS = \
    plugin.h \
    cameraoutcmio.h \
    ../../cameraout.h

INCLUDEPATH += \
    ../../../../../Lib/src \
    ../../

LIBS += -L$${OUT_PWD}/../../../../../Lib/$${BIN_DIR} -l$${COMMONS_TARGET}

OTHER_FILES += ../pspec.json

LIBS += \
    -L$${OUT_PWD}/../VCamIPC/$${BIN_DIR} -lVCamIPC \
    -L$${OUT_PWD}/../../VCamUtils/$${BIN_DIR} -lVCamUtils \
    -framework CoreFoundation \
    -framework CoreMedia \
    -framework CoreMediaIO \
    -framework CoreVideo \
    -framework Foundation \
    -framework IOKit \
    -framework IOSurface

QT += qml xml

SOURCES = \
    plugin.cpp \
    cameraoutcmio.cpp \
    ../../cameraout.cpp

DESTDIR = $${OUT_PWD}/../../../$${BIN_DIR}/submodules/VirtualCamera

TARGET = cmio

TEMPLATE = lib

INSTALLS += target
target.path = $${INSTALLPLUGINSDIR}/submodules/VirtualCamera
