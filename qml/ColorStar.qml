import QtQuick 2.0
import QtQuick.Particles 2.0

Rectangle
{
    color: "transparent"

    ParticleSystem
    {
        anchors.fill: parent
        ImageParticle
        {
            anchors.fill: parent
            source: "qrc:/images/star.png"
            sizeTable: "qrc:/images/sparkleSize.png"//使用一维图像的透明度来决定粒子生命周期内的尺寸变化
            alpha: 0
            alphaVariation: 0.4
            colorVariation: 0.6
            rotation: 15    // 旋转15度
            rotationVariation: 5    // 在+/-5度之间变化
            rotationVelocity: 45    // 每秒 45度旋转
            rotationVelocityVariation: 15   // 旋转速度在+/-15度之间变化
            entryEffect: ImageParticle.Scale    // 缩放的入场效果
        }

        Emitter
        {
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            emitRate: 8        //每秒发射粒子个数
            lifeSpan: 26000;    //粒子生命周期(毫秒)
            size: 48
            sizeVariation: 80
            velocity: AngleDirection {angleVariation: 90; magnitude: 100; magnitudeVariation:50}// 粒子发射角度方向
        }

        Turbulence
        {
            anchors.fill: parent
            strength: 2
        }

        Wander
        {
            // 生命结束前闪烁
            anchors.horizontalCenter: parent.horizontalCenter
            width: 19200; height: 1080
            affectedParameter: Wander.Position
            pace: 400
            //yVariance: 40
        }
    }
}
