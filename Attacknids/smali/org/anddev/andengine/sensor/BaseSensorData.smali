.class public Lorg/anddev/andengine/sensor/BaseSensorData;
.super Ljava/lang/Object;
.source "BaseSensorData.java"


# instance fields
.field protected mAccuracy:I

.field protected final mValues:[F


# direct methods
.method public constructor <init>(I)V
    .locals 1
    .parameter "pValueCount"

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    new-array v0, p1, [F

    iput-object v0, p0, Lorg/anddev/andengine/sensor/BaseSensorData;->mValues:[F

    .line 27
    return-void
.end method


# virtual methods
.method public getAccuracy()I
    .locals 1

    .prologue
    .line 49
    iget v0, p0, Lorg/anddev/andengine/sensor/BaseSensorData;->mAccuracy:I

    return v0
.end method

.method public getValues()[F
    .locals 1

    .prologue
    .line 34
    iget-object v0, p0, Lorg/anddev/andengine/sensor/BaseSensorData;->mValues:[F

    return-object v0
.end method

.method public setAccuracy(I)V
    .locals 0
    .parameter "pAccuracy"

    .prologue
    .line 45
    iput p1, p0, Lorg/anddev/andengine/sensor/BaseSensorData;->mAccuracy:I

    .line 46
    return-void
.end method

.method public setValues([F)V
    .locals 3
    .parameter "pValues"

    .prologue
    .line 38
    iget-object v1, p0, Lorg/anddev/andengine/sensor/BaseSensorData;->mValues:[F

    .line 39
    .local v1, values:[F
    array-length v2, p1

    add-int/lit8 v0, v2, -0x1

    .local v0, i:I
    :goto_0
    if-gez v0, :cond_0

    .line 42
    return-void

    .line 40
    :cond_0
    aget v2, p1, v0

    aput v2, v1, v0

    .line 39
    add-int/lit8 v0, v0, -0x1

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 58
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Values: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lorg/anddev/andengine/sensor/BaseSensorData;->mValues:[F

    invoke-static {v1}, Ljava/util/Arrays;->toString([F)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
