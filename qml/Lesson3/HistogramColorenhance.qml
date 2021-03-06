import QtQuick 2.0

import "../Presentation"
import "../Utils"


Slide2Im {
    id:slide
    
    property int increment: 5
    property int item: listView.currentIndex
    
    image1Source: {
        var currentStyle = histogramsModel.get(item).style;
        switch (currentStyle) {
        case 0:
            return "image://himage2/"
        case 2:
            return "image://himage2/colorenhance"
        }
        return "image://himage2"
    }
    image2Source: {
        var currentStyle = histogramsModel.get(item).style;
        switch (currentStyle) {
        case 0:
            return "image://himage2/hist/6/black/#EEE"
        case 2:
            return "image://himage2/colorenhance/hist//#EEE"
        }
        return "image://himage2"
    }
    
    ListModel {
        id: histogramsModel
        property int num: 0
        ListElement {
            name: "grey"
            nameRu: "origin"
            style: 0
        }      
        ListElement {
            name: "grey"
            nameRu: "color enhance"
            style: 2
        } 
    }
    
    ListView {
        id: listView
        anchors.bottom: slide.bottom
        width: slide.width
        height: 90
        orientation: ListView.Horizontal
        
        model: histogramsModel
        
        delegate: ItemDelegate {
            text: nameRu
            width: slide.width / histogramsModel.count ;
            
            defalTextColor: name
            selectedColor: name
            hoverColor: Qt.lighter(name, 1.7)
            defalColor: "white"    
            
            onMouseClicked: {
                listView.currentIndex = index
            }
        }
    }
}
