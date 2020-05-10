import QtQuick 2.5
import QtQuick.Layouts 1.3

Rectangle {
    id: mainPage

    width: 700
    height: 480
    color: "#000000"
    property alias btnPagaConPos: btnPagaConPos

    Item {
        id: header
        height: 110
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0

        Rectangle {
            id: rectangle
            radius: 15
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#8592fa"
                }

                GradientStop {
                    position: 1
                    color: "#0013ad"
                }
            }
            border.color: "#00000000"
            anchors.rightMargin: 8
            anchors.leftMargin: 8
            anchors.bottomMargin: 8
            anchors.topMargin: 8
            anchors.fill: parent

            Text {
                id: text1
                color: "#f9f8f8"
                text: qsTr("Header")
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.fill: parent
                font.pixelSize: 30
            }
        }
    }

    Item {
        id: pnlSceltaIniziale
        anchors.right: parent.right
        anchors.rightMargin: 8
        anchors.left: parent.left
        anchors.leftMargin: 8
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 8
        anchors.top: header.bottom
        anchors.topMargin: 6


        Text {
            id: text2
            y: 21
            height: 36
            color: "#f9f8f8"
            text: qsTr("Scelta operazione")
            horizontalAlignment: Text.AlignHCenter
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            font.pixelSize: 30
        }


        RowLayout {
            id: rowLayout
            anchors.rightMargin: 50
            anchors.leftMargin: 50
            anchors.bottomMargin: 50
            anchors.top: text2.bottom
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.topMargin: 10

            MyButton {
                id: btnConsegna
                Layout.preferredWidth: parent.width/2
                Layout.fillHeight: true
                body: "Premi qui per ritirare un oggetto"
                title: "RITIRA"
                onPressed: mainPage.state = "StatePos"
            }

            MyButton {
                id: btnRitira
                Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                Layout.fillHeight: true
                Layout.fillWidth: true
                body: "Premere qui per inserire l'oggetto nel locker"
                title: "CONSEGNA"
                onPressed: mainPage.state = "StateCodice"
            }
        }

    }

    Item {
        id: pnlPos
        anchors.fill: parent
        visible: false

        Text {
            id: text4
            x: 43
            y: 60
            width: 86
            height: 36
            color: "#f9f8f8"
            text: qsTr("POS")
            font.pixelSize: 30
        }

        MouseArea {
            id: mouseArea3
            anchors.fill: parent
            onClicked: mainPage.state = "StatoCodice"
        }

        MyButton {
            id: btnPagaConPos
            x: 17
            y: 91
            opacity: 0
        }

        MyButton {
            id: btnAnnulla
            x: 323
            y: 97
            opacity: 0
            onPressed: mainPage.state = "State"
        }
    }

    Item {
        id: pnlCodice
        anchors.top: header.bottom
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.topMargin: 20
        visible: false

        Text {
            id: pnlCodiceMessaggio
            y: 32
            width: 86
            height: 36
            color: "#f9f8f8"
            text: qsTr("Codice")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            visible: false
            font.pixelSize: 30
        }

        MouseArea {
            id: mouseArea2
            anchors.fill: parent
            onClicked: mainPage.state = ""
        }
    }


    states: [
        State {
            name: "StateCodice"

            PropertyChanges {
                target: pnlSceltaIniziale
                visible: false
            }

            PropertyChanges {
                target: pnlCodice
                visible: true
            }

            PropertyChanges {
                target: mouseArea2
                width: 231
                height: 192
            }

            PropertyChanges {
                target: pnlCodiceMessaggio
                x: 112
                y: 19
                width: 477
                height: 149
                text: qsTr("Inserire il codice ricevuto oppure passare il QRCode davanti al lettore")
                font.pixelSize: 26
                wrapMode: Text.WordWrap
                visible: true
                anchors.rightMargin: 292
                anchors.leftMargin: 322
            }
        },
        State {
            name: "StatePos"

            PropertyChanges {
                target: pnlSceltaIniziale
                visible: false
            }

            PropertyChanges {
                target: pnlPos
                x: 8
                y: 116
                width: 624
                height: 356
                visible: true
            }

            PropertyChanges {
                target: mouseArea2
                width: 50
                height: 50
                anchors.topMargin: 60
                anchors.bottomMargin: 140
                anchors.rightMargin: 191
                anchors.leftMargin: 9
            }

            PropertyChanges {
                target: mouseArea3
                width: 50
                height: 50
                anchors.topMargin: 0
                anchors.bottomMargin: 0
                anchors.rightMargin: 0
                anchors.leftMargin: 0
            }

            PropertyChanges {
                target: text4
                x: 149
                y: 40
            }

            PropertyChanges {
                target: btnPagaConPos
                body: "Premi qui, avvicina la carta al lettore e segui le istruzioni a video"
                title: "ACQUISTA"
                opacity: 1
            }

            PropertyChanges {
                target: btnAnnulla
                x: 324
                y: 91
                body: "Annulla l'operazione del POS"
                title: "ANNULLA"
                opacity: 1
            }
        }
    ]
}
