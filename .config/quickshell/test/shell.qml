import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import Quickshell.Io
import qs.modules

ShellRoot {
    readonly property font barFont: Qt.font({
        family: "JetBrainsMono Nerd Font",
        pixelSize: 16,
        bold: true
      })
      Item {
          property bool hasBattery: false

          Process {
              command: ["sh", "-c", "test -d /sys/class/power_supply/BAT0 && echo yes || echo no"]
              running: true

              stdout: SplitParser {
                  onRead: data => hasBattery = (data.trim() === "yes")
              }
          }
      }


    Variants {
        model: Quickshell.screens
        PanelWindow {
            property var modelData
            screen: modelData
            implicitHeight: 56
            implicitWidth: screen.width
            color: "transparent"
            mask: Region { item: pill }
            anchors {
                top: true
                left: true
                right: true
            }

            Rectangle {
                id: pill
                anchors.centerIn: parent
                width: 450
                height: 42
                radius: height / 2
                color: "#cc1a1a2e"
                layer.enabled: true
                border.color: Qt.rgba(1, 1, 1, 0.1)
                border.width: 1

                RowLayout {
                    anchors.fill: parent
                    anchors.leftMargin: 16
                    anchors.rightMargin: 16
                    spacing: 12

                    Clock {}
                    Workspaces {
                        anchors.centerIn: parent
                    }
                    Item {
                        Layout.fillWidth: true
                    }
                    Battery {
                      visible: hasBattery
                    }
                    CpuTemp {}
                }
            }
        }
    }
}
