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

        // ── Left group ────────────────────────────────────────
        Item {
            Layout.fillWidth: true

            RowLayout {
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                spacing: 8

                Rectangle {
                    color: "#A11a1b26"
                    radius: 24
                    implicitHeight: 38
                    implicitWidth: workspaces.implicitWidth + 24
                    Workspaces {
                        id: workspaces
                        anchors.centerIn: parent
                    }
                }

                Rectangle {
                    color: "#A11a1b26"
                    radius: 24
                    implicitHeight: 38
                    implicitWidth: cpuTemp.implicitWidth + 24
                    CpuTemp {
                        id: cpuTemp
                        anchors.centerIn: parent
                    }
                }
            }
        }

        // ── Center: Clock ─────────────────────────────────────
        Rectangle {
            color: "#A11a1b26"
            radius: 24
            implicitHeight: 38
            implicitWidth: clock.implicitWidth + 24
            Clock {
                id: clock
                anchors.centerIn: parent
            }
        }

        // ── Right group ───────────────────────────────────────
        Item {
            Layout.fillWidth: true

            RowLayout {
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                spacing: 8

                Rectangle {
                    color: "#A11a1b26"
                    radius: 24
                    implicitHeight: 38
                    implicitWidth: tray.width + 16
                    Tray {
                        id: tray
                        anchors.centerIn: parent
                    }
                }

                Rectangle {
                    color: "#A11a1b26"
                    radius: 24
                    implicitHeight: 38
                    implicitWidth: 38
                    PowerButton {
                        anchors.centerIn: parent
                    }
                }
            }
        }
    }
}
