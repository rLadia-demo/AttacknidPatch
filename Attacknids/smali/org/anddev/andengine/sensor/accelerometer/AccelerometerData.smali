.class public Lorg/anddev/andengine/sensor/accelerometer/AccelerometerData;
.super Lorg/anddev/andengine/sensor/BaseSensorData;
.source "AccelerometerData.java"


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
.method public getX()F
    .locals 2

    .prologue
    .line 35
    iget-object v0, p0, Lorg/anddev/andengine/sensor/accelerometer/AccelerometerData;->mValues:[F

    const/4 v1, 0x0

    aget v0, v0, v1

    return v0
.end method

.method public getY()F
    .locals 2

    .prologue
    .line 39
    iget-object v0, p0, Lorg/anddev/andengine/sensor/accelerometer/AccelerometerData;->mValues:[F

    const/4 v1, 0x1

    aget v0, v0, v1

    return v0
.end method

.method public getZ()F
    .locals 2

    .prologue
    .line 43
    iget-object v0, p0, Lorg/anddev/andengine/sensor/accelerometer/AccelerometerData;->mValues:[F

    const/4 v1, 0x2

    aget v0, v0, v1

    return v0
.end method

.method public setX(F)V
    .locals 2
    .parameter "pX"

    .prologue
    .line 47
    iget-object v0, p0, Lorg/anddev/andengine/sensor/accelerometer/AccelerometerData;->mValues:[F

    const/4 v1, 0x0

    aput p1, v0, v1

    .line 48
    return-void
.end method

.method public setY(F)V
    .locals 2
    .parameter "pY"

    .prologue
    .line 51
    iget-object v0, p0, Lorg/anddev/andengine/sensor/accelerometer/AccelerometerData;->mValues:[F

    const/4 v1, 0x1

    aput p1, v0, v1

    .line 52
    return-void
.end method

.method public setZ(F)V
    .locals 2
    .parameter "pZ"

    .prologue
    .line 55
    iget-object v0, p0, Lorg/anddev/andengine/sensor/accelerometer/AccelerometerData;->mValues:[F

    const/4 v1, 0x2

    aput p1, v0, v1

    .line 56
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 64
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Accelerometer: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lorg/anddev/andengine/sensor/accelerometer/AccelerometerData;->mValues:[F

    invoke-static {v1}, Ljava/util/Arrays;->toString([F)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
