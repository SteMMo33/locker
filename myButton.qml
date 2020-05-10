import QtQuick 2.0

Item {

    MyButton {

        mouseArea.pressed: {
            console.log("mouseArea")
            this.pressed()
        }

        /* MouseArea {
            onClicked: {
                console.log("MouseArea")
                this.pressed()
            }
        } */

    }
}
