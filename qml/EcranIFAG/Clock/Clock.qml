import QtQuick 2.0

Item {
    id: clock
    width: 150
    height: 151

    property int hours
    property int minutes
    property int seconds
    property real shift: 2

    function timeChanged() {
        var date = new Date;
        hours = shift ? date.getUTCHours() + Math.floor(clock.shift) : date.getHours()
        minutes = shift ? date.getUTCMinutes() + ((clock.shift % 1) * 60) : date.getMinutes()
        seconds = date.getUTCSeconds();
    }

    Timer {
        interval: 100; running: true; repeat: true;
        onTriggered: clock.timeChanged()
    }

    Image {
        id: background
        source: "clock.png"
        width: parent.width
        height: parent.height
        smooth: true
        transformOrigin: background.Center
        transform: Rotation {
            id: secondRotation
            origin.x: background.width/2
            origin.y: background.height/2
            axis.x: 0; axis.y: 0; axis.z:1;
            angle: clock.seconds * 6
            Behavior on angle {
                SpringAnimation { spring: 8; damping: 0.2; modulus: 360 }
            }
        }
    }

    Image {
        source: "minute.png"
        x: 71; y: -6
        width: 8
        height: 82
        smooth: true
        transform: Rotation {
            id: minuteRotation
            origin.x: 6.5; origin.y: 83;
            angle: clock.minutes * 6
            Behavior on angle {
                SpringAnimation { spring: 2; damping: 0.2; modulus: 360 }
            }
        }
    }

    Image {
        source: "hour.png"
        smooth: true
        x: 71; y: -6
//        width: 11
//        height: 52
        transform: Rotation {
            id: hourRotation
            origin.x: 7.5; origin.y: 73;
            angle: (clock.hours * 30) + (clock.minutes * 0.5)
            Behavior on angle {
                SpringAnimation { spring: 2; damping: 0.2; modulus: 360 }
            }
        }
    }
}
