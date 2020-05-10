import QtQuick 2.5

Item {
    id: btn

    FontLoader { id: proximaNovaBold; source: "fonts/ProximaNova-Bold.otf" }
    FontLoader { id: proximaNovaRegular; source: "fonts/ProximaNova-Regular.otf" }

    width: 300
    height: 200
    property alias mouseArea: mouseArea

    property alias body: body.text
    property alias title: title.text

    signal pressed()


    Rectangle {
        id: rectangle
        radius: 25
        z: 0
        scale: 1
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#ffffff"
            }

            GradientStop {
                position: 1
                color: "#fa7d2e"
            }
        }
        anchors.fill: parent

        Text {
            id: title
            text: qsTr("Text")
            font.capitalization: Font.AllUppercase
            verticalAlignment: Text.AlignVCenter
            style: Text.Raised
            anchors.top: parent.top
            anchors.topMargin: 31
            horizontalAlignment: Text.AlignHCenter
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            font.pixelSize: 38
            font.family: proximaNovaBold.name
        }

        Text {
            id: body
            y: 125
            color: "#ffffff"
            text: qsTr("Text")
            style: Text.Sunken
            verticalAlignment: Text.AlignVCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 37
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.right: parent.right
            anchors.rightMargin: 20
            font.family: proximaNovaBold.name
            font.pixelSize: 24
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
    }
}
