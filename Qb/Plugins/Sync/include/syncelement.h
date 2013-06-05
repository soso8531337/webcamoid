/* Webcamod, webcam capture plasmoid.
 * Copyright (C) 2011-2013  Gonzalo Exequiel Pedone
 *
 * Webcamod is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Webcamod is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Webcamod. If not, see <http://www.gnu.org/licenses/>.
 *
 * Email     : hipersayan DOT x AT gmail DOT com
 * Web-Site 1: http://github.com/hipersayanX/Webcamoid
 * Web-Site 2: http://kde-apps.org/content/show.php/Webcamoid?content=144796
 */

#ifndef SYNCELEMENT_H
#define SYNCELEMENT_H

#include <qb.h>

class SyncElement: public QbElement
{
    Q_OBJECT
    Q_PROPERTY(bool noQueue READ noQueue WRITE setNoQueue RESET resetNoQueue)

    public:
        explicit SyncElement();
        ~SyncElement();

        Q_INVOKABLE bool noQueue() const;

    private:
        bool m_ready;
        bool m_noQueue;
        bool m_unlocked;
        bool m_sync;
        bool m_fst;
        double m_iPts;
        double m_duration;
        QQueue<QbPacket> m_queue;
        QbPacket m_lastPacket;
        QElapsedTimer m_elapsedTimer;
        QTimer m_timer;
        QMutex m_mutex;

    signals:
        void ready(int id);
        void oDiscardFrames(int nFrames);

    public slots:
        void setNoQueue(bool noQueue);
        void resetNoQueue();

        void iStream(const QbPacket &packet);
        void setState(ElementState state);

    private slots:
        void sendFrame();
        void sendFrame(const QbPacket &packet);
};

#endif // SYNCELEMENT_H
