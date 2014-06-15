.class public Lorg/anddev/andengine/sensor/orientation/OrientationData;
.super Lorg/anddev/andengine/sensor/BaseSensorData;
.source "OrientationData.java"


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 27
    const/4 v0, 0x3

    invoke-direct {p0, v0}, Lorg/anddev/andengine/sensor/BaseSensorData;-><init>(I)V

    .line 28
    return-void
.end method


# virtual methods
.method public getPitch()F
    .locals 2

    .prologue
    .line 39
    iget-object v0, p0, Lorg/anddev/andengine/sensor/BaseSensorData;->mValues:[F

    const/4 v1, 0x1

    aget v0, v0, v1

    return v0
.end method

.method public getRoll()F
    .locals 2

    .prologue
    .line 35
    iget-object v0, p0, Lorg/anddev/andengine/sensor/BaseSensorData;->mValues:[F

    const/4 v1, 0x2

    aget v0, v0, v1

    return v0
.end method

.method public getYaw()F
    .locals 2

    .prologue
    .line 43
    iget-object v0, p0, Lorg/anddev/andengine/sensor/BaseSensorData;->mValues:[F

    const/4 v1, 0x0

    aget v0, v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 52
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Orientation: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lorg/anddev/andengine/sensor/orientation/OrientationData;->mValues:[F

    invoke-static {v1}, Ljava/util/Arrays;->toString([F)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
