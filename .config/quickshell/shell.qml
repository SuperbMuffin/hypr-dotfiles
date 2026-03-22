//@ pragma UseQApplication
import Quickshell
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts
import qs.modules

PanelWindow {
    anchors { top: true; left: true; right: true }
    implicitHeight: 46
    color: "transparent"

    RowLayout {
        anchors.fill: parent
        anchors.margins: 8
        spacing: 8

        Rectangle {
            color: "#aa1a1b26"
            radius: 24
            Layout.preferredHeight: 38
            Layout.preferredWidth: workspaces.implicitWidth + 24

            Workspaces {
                id: workspaces
                anchors.centerIn: parent
            }
        }
        
        Item { Layout.fillWidth: true }
        Rectangle {
            color: "#aa1a1b26"
            radius: 24
            Layout.preferredHeight: 38
            Layout.preferredWidth: clock.implicitWidth + 24

            Clock {
                id: clock
                anchors.centerIn: parent
            }
        }

        Item { Layout.fillWidth: true }

        Rectangle {
            color: "#aa1a1b26"
            radius: 24
            Layout.preferredHeight: 38
            Layout.preferredWidth: tray.width + 16

            Tray {
                id: tray
                anchors.centerIn: parent
            }
        }
        Rectangle {
            color: "#aa1a1b26"
            radius: 24
            Layout.preferredHeight: 38
            Layout.preferredWidth: 38

            PowerButton {
                anchors.centerIn: parent
            }
        }
    }
}
