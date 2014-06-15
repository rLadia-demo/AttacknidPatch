.class public Lorg/anddev/andengine/util/modifier/ease/EaseBackInOut;
.super Ljava/lang/Object;
.source "EaseBackInOut.java"

# interfaces
.implements Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;


# static fields
.field private static INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseBackInOut;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    return-void
.end method

.method public static getInstance()Lorg/anddev/andengine/util/modifier/ease/EaseBackInOut;
    .locals 1

    .prologue
    .line 27
    sget-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseBackInOut;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseBackInOut;

    if-nez v0, :cond_0

    .line 28
    new-instance v0, Lorg/anddev/andengine/util/modifier/ease/EaseBackInOut;

    invoke-direct {v0}, Lorg/anddev/andengine/util/modifier/ease/EaseBackInOut;-><init>()V

    sput-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseBackInOut;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseBackInOut;

    .line 30
    :cond_0
    sget-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseBackInOut;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseBackInOut;

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
    const v5, 0x3fc33333

    const/high16 v2, 0x3f00

    const/high16 v4, 0x4000

    const/high16 v3, 0x3f80

    .line 43
    const v0, 0x3fd9cd60

    .line 44
    .local v0, s:F
    mul-float v1, p2, v2

    div-float/2addr p1, v1

    cmpg-float v1, p1, v3

    if-gez v1, :cond_0

    .line 45
    mul-float v1, p4, v2

    mul-float v2, p1, p1

    mul-float/2addr v0, v5

    add-float/2addr v3, v0

    mul-float/2addr v3, p1

    sub-float/2addr v3, v0

    mul-float/2addr v2, v3

    mul-float/2addr v1, v2

    add-float/2addr v1, p3

    .line 48
    :goto_0
    return v1

    :cond_0
    div-float v1, p4, v4

    sub-float/2addr p1, v4

    mul-float v2, p1, p1

    mul-float/2addr v0, v5

    add-float/2addr v3, v0

    mul-float/2addr v3, p1

    add-float/2addr v3, v0

    mul-float/2addr v2, v3

    add-float/2addr v2, v4

    mul-float/2addr v1, v2

    add-float/2addr v1, p3

    goto :goto_0
.end method
