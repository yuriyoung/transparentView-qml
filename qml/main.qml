import QtQuick 2.4
import QtQuick.Window 2.2

Window
{
    id:window
    visible: true
    width: 900
    height: 680
    flags: Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint | Qt.WindowTransparentForInput
    color: "transparent"
    visibility: "Maximized"

    MouseArea
    {
        id: dragRegion
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton | Qt.RightButton // 如果要接受鼠标多个按键事件，需要加这个，或直接Qt.AllButtons

        property point pressPos: "0,0";
        property bool rightClicked: false
        property bool fullscreen:true

        onPressed:
        {
            if( mouse.button === Qt.LeftButton)
            {
                console.log("left button pressed");
                pressPos = Qt.point(mouse.x,mouse.y);
                rightClicked = false;
            }
            if( mouse.button === Qt.RightButton)
                rightClicked = true;
        }
        onPositionChanged:
        {
            if( rightClicked == true )
                return;
            if( fullscreen )
                return;

            var delta = Qt.point(mouse.x - pressPos.x, mouse.y - pressPos.y);
            window.setX( window.x + delta.x);
            window.setY( window.y + delta.y);
        }
        onDoubleClicked:
        {
            if( mouse.button === Qt.LeftButton)
            {
                if( !fullscreen )
                {
//                    window.showFullScreen();
                    window.showMaximized();
                }
                else
                {
                    window.showNormal();
                }
                fullscreen = !fullscreen;
            }
        }

        onReleased:
        {
            if( mouse.button === Qt.RightButton || rightClicked == true )
            {
                console.log("right button pressed");
                Qt.quit();
            }
        }
    }

    ColorStar
    {
        id: starParticle
        anchors.fill: parent
    }
}
