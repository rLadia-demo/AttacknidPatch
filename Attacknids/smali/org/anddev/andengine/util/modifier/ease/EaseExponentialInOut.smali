.class public Lorg/anddev/andengine/util/modifier/ease/EaseExponentialInOut;
.super Ljava/lang/Object;
.source "EaseExponentialInOut.java"

# interfaces
.implements Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;


# static fields
.field private static INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseExponentialInOut;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    return-void
.end method

.method public static getInstance()Lorg/anddev/andengine/util/modifier/ease/EaseExponentialInOut;
    .locals 1

    .prologue
    .line 26
    sget-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseExponentialInOut;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseExponentialInOut;

    if-nez v0, :cond_0

    .line 27
    new-instance v0, Lorg/anddev/andengine/util/modifier/ease/EaseExponentialInOut;

    invoke-direct {v0}, Lorg/anddev/andengine/util/modifier/ease/EaseExponentialInOut;-><init>()V

    sput-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseExponentialInOut;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseExponentialInOut;

    .line 29
    :cond_0
    sget-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseExponentialInOut;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseExponentialInOut;

    return-object v0
.end method


# virtual methods
.method public getPercentageDone(FFFF)F
    .locals 6
    .parameter "pSecondsElapsed"
    .parameter "pDuration"
    .parameter "pMinValue"
    .parameter "pMaxValue"

    .prologue
    const/high16 v3, 0x3f80

    const/high16 v1, 0x3f00

    const-wide/high16 v4, 0x4000

    .line 42
    const/4 v0, 0x0

    cmpl-float v0, p1, v0

    if-nez v0, :cond_0

    .line 51
    .end local p3
    :goto_0
    return p3

    .line 45
    .restart local p3
    :cond_0
    cmpl-float v0, p1, p2

    if-nez v0, :cond_1

    .line 46
    add-float/2addr p3, p4

    goto :goto_0

    .line 48
    :cond_1
    mul-float v0, p2, v1

    div-float/2addr p1, v0

    cmpg-float v0, p1, v3

    if-gez v0, :cond_2

    .line 49
    mul-float v0, p4, v1

    float-to-double v0, v0

    const/high16 v2, 0x4120

    sub-float v3, p1, v3

    mul-float/2addr v2, v3

    float-to-double v2, v2

    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v2

    mul-double/2addr v0, v2

    float-to-double v2, p3

    add-double/2addr v0, v2

    double-to-float p3, v0

    goto :goto_0

    .line 51
    :cond_2
    mul-float v0, p4, v1

    float-to-double v0, v0

    const/high16 v2, -0x3ee0

    sub-float/2addr p1, v3

    mul-float/2addr v2, p1

    float-to-double v2, v2

    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v2

    neg-double v2, v2

    add-double/2addr v2, v4

    mul-double/2addr v0, v2

    float-to-double v2, p3

    add-double/2addr v0, v2

    double-to-float p3, v0

    goto :goto_0
.end method
