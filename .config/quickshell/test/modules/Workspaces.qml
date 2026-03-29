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
            
            gradient: isActive ? activeGradient : undefined
            color: isActive ? "transperant" : isOccupied ? "#7a83b8" : "#2e3355"
            
            Gradient {
              id: activeGradient
              orientation: Gradient.Horizontal
              GradientStop { position: 0.0; color: "#7aa2f7"}
              GradientStop { position: 1.0; color: "#bb9af7"}
            }
            Behavior on Layout.preferredWidth { NumberAnimation { duration: 300; easing.type: Easing.OutExpo } }
            Behavior on color { ColorAnimation { duration: 1 } }

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: Hyprland.dispatch("workspace " + wsId)
            }
        }
    }
}
