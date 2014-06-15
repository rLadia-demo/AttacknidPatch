.class public Lorg/anddev/andengine/sensor/orientation/OrientationSensorOptions;
.super Ljava/lang/Object;
.source "OrientationSensorOptions.java"


# instance fields
.field final mSensorDelay:Lorg/anddev/andengine/sensor/SensorDelay;


# direct methods
.method public constructor <init>(Lorg/anddev/andengine/sensor/SensorDelay;)V
    .locals 0
    .parameter "pSensorDelay"

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    iput-object p1, p0, Lorg/anddev/andengine/sensor/orientation/OrientationSensorOptions;->mSensorDelay:Lorg/anddev/andengine/sensor/SensorDelay;

    .line 26
    return-void
.end method


# virtual methods
.method public getSensorDelay()Lorg/anddev/andengine/sensor/SensorDelay;
    .locals 1

    .prologue
    .line 33
    iget-object v0, p0, Lorg/anddev/andengine/sensor/orientation/OrientationSensorOptions;->mSensorDelay:Lorg/anddev/andengine/sensor/SensorDelay;

    return-object v0
.end method
