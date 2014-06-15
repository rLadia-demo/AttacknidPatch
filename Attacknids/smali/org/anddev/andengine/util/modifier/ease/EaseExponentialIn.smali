.class public Lorg/anddev/andengine/util/modifier/ease/EaseExponentialIn;
.super Ljava/lang/Object;
.source "EaseExponentialIn.java"

# interfaces
.implements Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;


# static fields
.field private static INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseExponentialIn;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    return-void
.end method

.method public static getInstance()Lorg/anddev/andengine/util/modifier/ease/EaseExponentialIn;
    .locals 1

    .prologue
    .line 26
    sget-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseExponentialIn;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseExponentialIn;

    if-nez v0, :cond_0

    .line 27
    new-instance v0, Lorg/anddev/andengine/util/modifier/ease/EaseExponentialIn;

    invoke-direct {v0}, Lorg/anddev/andengine/util/modifier/ease/EaseExponentialIn;-><init>()V

    sput-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseExponentialIn;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseExponentialIn;

    .line 29
    :cond_0
    sget-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseExponentialIn;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseExponentialIn;

    return-object v0
.end method


# virtual methods
.method public getPercentageDone(FFFF)F
    .locals 7
    .parameter "pSecondsElapsed"
    .parameter "pDuration"
    .parameter "pMinValue"
    .parameter "pMaxValue"

    .prologue
    .line 42
    const/4 v0, 0x0

    cmpl-float v0, p1, v0

    if-nez v0, :cond_0

    float-to-double v0, p3

    :goto_0
    double-to-float v0, v0

    return v0

    :cond_0
    float-to-double v0, p4

    const-wide/high16 v2, 0x4000

    const/high16 v4, 0x4120

    div-float v5, p1, p2

    const/high16 v6, 0x3f80

    sub-float/2addr v5, v6

    mul-float/2addr v4, v5

    float-to-double v4, v4

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v2

    mul-double/2addr v0, v2

    float-to-double v2, p3

    add-double/2addr v0, v2

    const v2, 0x3a83126f

    mul-float/2addr v2, p4

    float-to-double v2, v2

    sub-double/2addr v0, v2

    goto :goto_0
.end method
