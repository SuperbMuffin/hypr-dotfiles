import Quickshell
import Quickshell.Services.SystemTray
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

Item {
    width: 28
    height: 28

    property bool open: false

    PanelWindow {
        id: trayAnchor
        anchors.top: true
        anchors.right: true
        WlrLayershell.layer: WlrLayer.Overlay
        WlrLayershell.keyboardFocus: WlrKeyboardFocus.None
        WlrLayershell.exclusiveZone: -1
        margins.top: 46
        implicitWidth: 1
        implicitHeight: 1
        visible: true
        color: "transparent"
    }

    Rectangle {
        anchors.fill: parent
        color: btn.containsMouse ? "#18ffffff" : "transparent"
        radius: 20

        Text {
            anchors.centerIn: parent
            text: open ? "v" : "^"
            color: btn.containsMouse ? "#ffffff" : "#a9b1d6"
            font.pixelSize: 24
            font.bold: true
        }

        MouseArea {
            id: btn
            anchors.fill: parent
            hoverEnabled: true
            onClicked: open = !open
        }
    }

    PanelWindow {
        id: trayPopup
        anchors.top: true
        anchors.right: true
        WlrLayershell.layer: WlrLayer.Overlay
        WlrLayershell.keyboardFocus: WlrKeyboardFocus.None
        WlrLayershell.exclusiveZone: -1
        margins.top: 46
        margins.right: 80
        implicitWidth: 56
        implicitHeight: Math.max(52, (SystemTray.items.values.length * 44) + 16)
        color: "transparent"
        visible: open

        HyprlandFocusGrab {
            windows: [trayPopup]
            active: open
            onCleared: open = false
        }

        Rectangle {
            anchors.fill: parent
            color: "#d91a1b26"
            radius: 16

            Column {
                anchors.centerIn: parent
                spacing: 8

                Repeater {
                    model: SystemTray.items.values

                    Rectangle {
                        width: 36
                        height: 36
                        radius: 8
                        color: iconHover.containsMouse ? "#18ffffff" : "transparent"

                        Image {
                            anchors.centerIn: parent
                            source: modelData.icon
                            width: 20
                            height: 20
                            smooth: true
                        }

                        MouseArea {
                            id: iconHover
                            anchors.fill: parent
                            hoverEnabled: true
                            acceptedButtons: Qt.LeftButton | Qt.RightButton
                            onClicked: (mouse) => {
                                if (mouse.button === Qt.RightButton) {
                                    modelData.display(trayAnchor, 0, 0)
                                } else {
                                    modelData.activate()
                                    open = false
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
