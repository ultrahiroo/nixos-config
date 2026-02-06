import Quickshell
import Quickshell.Wayland
import Quickshell.Io
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

PanelWindow {
    id: root

    property color colBg: "#1a1b26"
    // property color colFg: "#a9b1d6"
    property color colFg: "#ffffff"
    property color colMuted: "#444b6a"
    property color colCyan: "#0db9d7"
    property color colBlue: "#7aa2f7"
    property color colYellow: "#e0af68"

    // property string fontFamily: "JetBrainsMono Nerd Font"
    property string fontFamily: "Plemol JP Console"
    property int fontSize: 11

    property int cpuUsage: 0
    property int memUsage: 0
    property var lastCpuIdle: 0
    property var lastCpuTotal: 0

    anchors.top: true
    anchors.left: true
    anchors.right: true
    implicitHeight: 30
    color: root.colBg

    RowLayout {
        anchors.fill: parent
        anchors.margins: 8
        spacing: 8

        // Repeater {
        //     id: workspace
        //     Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft

        //     model: 9
        //     Text {
        //         property var ws: Hyprland.workspaces.values.find(w => w.id === index + 1)
        //         property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)
        //         text: index + 1
        //         color: isActive ? root.colCyan : (ws ? root.colBlue : root.colMuted)
        //         font {
        //             family: root.fontFamily
        //             pointSize: root.fontSize
        //         }
        //         MouseArea {
        //             anchors.fill: parent
        //             onClicked: Hyprland.dispatch("workspace " + (index + 1))
        //         }
        //     }
        // }

        Item {
            Layout.fillWidth: true
        }

        Text {
            id: clock
            Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
            anchors {
                horizontalCenter: parent.horizontalCenter
                verticalCenter: parent.verticalCenter
            }

            color: root.colFg
            font {
                family: root.fontFamily
                pointSize: root.fontSize
            }
            property string format: "yyyy-MM-dd hh:mm:ss ddd"

            Timer {
                interval: 1000
                repeat: true
                running: true
                triggeredOnStart: true
                onTriggered: {
                    const _date = new Date();
                    const locale = Qt.locale();
                    const y = _date.toLocaleString(locale, clock.format);
                    clock.text = y;
                }
            }
        }

        Item {
            Layout.fillWidth: true
        }

        Text {
            id: cpu
            Layout.alignment: Qt.AlignVCenter | Qt.AlignRight

            text: "CPU: " + cpuUsage + "%"
            color: root.colYellow
            font {
                family: root.fontFamily
                pointSize: root.fontSize
            }
        }

        Rectangle {
            Layout.alignment: Qt.AlignVCenter | Qt.AlignRight

            width: 1
            height: 16
            color: root.colMuted
        }

        Text {
            id: memory
            Layout.alignment: Qt.AlignVCenter | Qt.AlignRight

            text: "Mem: " + memUsage + "%"
            color: root.colCyan
            font {
                family: root.fontFamily
                pointSize: root.fontSize
            }
        }
    }
}
