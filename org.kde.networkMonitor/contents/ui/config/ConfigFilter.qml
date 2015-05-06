import QtQuick 2.2
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0

Item {
    width: childrenRect.width
    height: childrenRect.height
    
    property int textfieldWidth: 200
    
    property int cfg_deviceFilterType
    property alias cfg_deviceWhiteListRegexp: deviceWhiteListRegexp.text
    property alias cfg_deviceBlackListRegexp: deviceBlackListRegexp.text

    onCfg_deviceFilterTypeChanged: {
        switch (cfg_deviceFilterType) {
        case 1:
            deviceFilterTypeGroup.current = deviceFilterTypeRadioWhiteList;
            break;
        case 2:
            deviceFilterTypeGroup.current = deviceFilterTypeRadioBlackList;
            break;
        case 0:
        default:
            deviceFilterTypeGroup.current = deviceFilterTypeRadioOff;
        }
    }

    ExclusiveGroup {
        id: deviceFilterTypeGroup
    }
    
    GridLayout {
        Layout.fillWidth: true
        columns: 3

        RadioButton {
            id: deviceFilterTypeRadioOff
            exclusiveGroup: deviceFilterTypeGroup
            text: i18n("Off")
            onCheckedChanged: if (checked) cfg_deviceFilterType = 0;
        }
        Item {
            width: 2
            height: 2
            Layout.columnSpan: 2
        }
        
        RadioButton {
            id: deviceFilterTypeRadioWhiteList
            exclusiveGroup: deviceFilterTypeGroup
            text: i18n("White-list")
            onCheckedChanged: if (checked) cfg_deviceFilterType = 1;
        }
        Label {
            text: i18n('Allowed devices (pipe separated):')
            Layout.alignment: Qt.AlignRight
        }
        TextField {
            id: deviceWhiteListRegexp
            placeholderText: 'Pipe separated device names'
            enabled: deviceFilterTypeRadioWhiteList.checked
            Layout.preferredWidth: textfieldWidth
        }
        
        RadioButton {
            id: deviceFilterTypeRadioBlackList
            exclusiveGroup: deviceFilterTypeGroup
            text: i18n("Black-list")
            onCheckedChanged: if (checked) cfg_deviceFilterType = 2;
        }
        Label {
            text: i18n('Restricted devices (pipe separated):')
            Layout.alignment: Qt.AlignRight
        }
        TextField {
            id: deviceBlackListRegexp
            placeholderText: 'Pipe separated device names'
            enabled: deviceFilterTypeRadioBlackList.checked
            Layout.preferredWidth: textfieldWidth
        }
        
    }
    
}
