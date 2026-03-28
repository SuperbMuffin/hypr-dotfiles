import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

RowLayout {
    spacing: 4

    Repeater {
        model: 4

        Rectangle {
            property int wsId: index + 1
            property bool isActive: Hyprland.focusedWorkspace?.id === wsId
            property bool isOccupied: Hyprland.workspaces.values.find(w => w.id === wsId) !== undefined

            Layout.preferredWidth: isActive ? 48:16
            Layout.preferredHeight: 16
            radius: height / 2

            color: isActive ? "#7aa2f7" : isOccupied ? "#7a83b8" : "#2e3355"

            Behavior on Layout.preferredWidth { NumberAnimation { duration: 150; easing.type: Easing.OutCubic } }
            Behavior on color { ColorAnimation { duration: 150 } }

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: Hyprland.dispatch("workspace " + wsId)
            }
        }
    }
}
