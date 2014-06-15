.class public Lorg/anddev/andengine/sensor/location/LocationSensorOptions;
.super Landroid/location/Criteria;
.source "LocationSensorOptions.java"


# static fields
.field private static final MINIMUMTRIGGERDISTANCE_DEFAULT:J = 0xaL

.field private static final MINIMUMTRIGGERTIME_DEFAULT:J = 0x3e8L


# instance fields
.field private mEnabledOnly:Z

.field private mMinimumTriggerDistance:J

.field private mMinimumTriggerTime:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 43
    invoke-direct {p0}, Landroid/location/Criteria;-><init>()V

    .line 23
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/anddev/andengine/sensor/location/LocationSensorOptions;->mEnabledOnly:Z

    .line 25
    const-wide/16 v0, 0x3e8

    iput-wide v0, p0, Lorg/anddev/andengine/sensor/location/LocationSensorOptions;->mMinimumTriggerTime:J

    .line 26
    const-wide/16 v0, 0xa

    iput-wide v0, p0, Lorg/anddev/andengine/sensor/location/LocationSensorOptions;->mMinimumTriggerDistance:J

    .line 45
    return-void
.end method

.method public constructor <init>(IZZZIZZJJ)V
    .locals 2
    .parameter "pAccuracy"
    .parameter "pAltitudeRequired"
    .parameter "pBearingRequired"
    .parameter "pCostAllowed"
    .parameter "pPowerRequirement"
    .parameter "pSpeedRequired"
    .parameter "pEnabledOnly"
    .parameter "pMinimumTriggerTime"
    .parameter "pMinimumTriggerDistance"

    .prologue
    .line 58
    invoke-direct {p0}, Landroid/location/Criteria;-><init>()V

    .line 23
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/anddev/andengine/sensor/location/LocationSensorOptions;->mEnabledOnly:Z

    .line 25
    const-wide/16 v0, 0x3e8

    iput-wide v0, p0, Lorg/anddev/andengine/sensor/location/LocationSensorOptions;->mMinimumTriggerTime:J

    .line 26
    const-wide/16 v0, 0xa

    iput-wide v0, p0, Lorg/anddev/andengine/sensor/location/LocationSensorOptions;->mMinimumTriggerDistance:J

    .line 59
    iput-boolean p7, p0, Lorg/anddev/andengine/sensor/location/LocationSensorOptions;->mEnabledOnly:Z

    .line 60
    iput-wide p8, p0, Lorg/anddev/andengine/sensor/location/LocationSensorOptions;->mMinimumTriggerTime:J

    .line 61
    iput-wide p10, p0, Lorg/anddev/andengine/sensor/location/LocationSensorOptions;->mMinimumTriggerDistance:J

    .line 63
    invoke-virtual {p0, p1}, Lorg/anddev/andengine/sensor/location/LocationSensorOptions;->setAccuracy(I)V

    .line 64
    invoke-virtual {p0, p2}, Lorg/anddev/andengine/sensor/location/LocationSensorOptions;->setAltitudeRequired(Z)V

    .line 65
    invoke-virtual {p0, p3}, Lorg/anddev/andengine/sensor/location/LocationSensorOptions;->setBearingRequired(Z)V

    .line 66
    invoke-virtual {p0, p4}, Lorg/anddev/andengine/sensor/location/LocationSensorOptions;->setCostAllowed(Z)V

    .line 67
    invoke-virtual {p0, p5}, Lorg/anddev/andengine/sensor/location/LocationSensorOptions;->setPowerRequirement(I)V

    .line 68
    invoke-virtual {p0, p6}, Lorg/anddev/andengine/sensor/location/LocationSensorOptions;->setSpeedRequired(Z)V

    .line 69
    return-void
.end method


# virtual methods
.method public getMinimumTriggerDistance()J
    .locals 2

    .prologue
    .line 92
    iget-wide v0, p0, Lorg/anddev/andengine/sensor/location/LocationSensorOptions;->mMinimumTriggerDistance:J

    return-wide v0
.end method

.method public getMinimumTriggerTime()J
    .locals 2

    .prologue
    .line 84
    iget-wide v0, p0, Lorg/anddev/andengine/sensor/location/LocationSensorOptions;->mMinimumTriggerTime:J

    return-wide v0
.end method

.method public isEnabledOnly()Z
    .locals 1

    .prologue
    .line 80
    iget-boolean v0, p0, Lorg/anddev/andengine/sensor/location/LocationSensorOptions;->mEnabledOnly:Z

    return v0
.end method

.method public setEnabledOnly(Z)V
    .locals 0
    .parameter "pEnabledOnly"

    .prologue
    .line 76
    iput-boolean p1, p0, Lorg/anddev/andengine/sensor/location/LocationSensorOptions;->mEnabledOnly:Z

    .line 77
    return-void
.end method

.method public setMinimumTriggerDistance(J)V
    .locals 0
    .parameter "pMinimumTriggerDistance"

    .prologue
    .line 96
    iput-wide p1, p0, Lorg/anddev/andengine/sensor/location/LocationSensorOptions;->mMinimumTriggerDistance:J

    .line 97
    return-void
.end method

.method public setMinimumTriggerTime(J)V
    .locals 0
    .parameter "pMinimumTriggerTime"

    .prologue
    .line 88
    iput-wide p1, p0, Lorg/anddev/andengine/sensor/location/LocationSensorOptions;->mMinimumTriggerTime:J

    .line 89
    return-void
.end method
