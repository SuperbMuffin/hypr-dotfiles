import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

RowLayout {
    spacing: 4

    Repeater {
      model: ["A", "B", "C", "D"]

        Rectangle {
            property int wsId: index + 1
            property var ws: Hyprland.workspaces.values.find(w => w.id === wsId)
            property bool isActive: Hyprland.focusedWorkspace?.id === wsId
            property bool isOccupied: ws !== undefined

            implicitWidth: 32
            implicitHeight: 32
            radius: 12

            color:  isActive    ? "#7aa2f7" :
                    isOccupied  ? "#18ffffff" :
                                  "transparent"
            Text {
                anchors.centerIn: parent
                text: modelData
                color: isActive ? "#1a1b26" : (isOccupied ? "#a9b1d6" : "#444b6a")
                font.pixelSize: 12
                font.bold: true
            }

            MouseArea {
                anchors.fill: parent
                onClicked: Hyprland.dispatch("workspace " + wsId)
            }
        }
    }
}
