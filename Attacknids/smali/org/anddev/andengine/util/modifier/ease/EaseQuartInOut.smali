.class public Lorg/anddev/andengine/util/modifier/ease/EaseQuartInOut;
.super Ljava/lang/Object;
.source "EaseQuartInOut.java"

# interfaces
.implements Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;


# static fields
.field private static INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseQuartInOut;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    return-void
.end method

.method public static getInstance()Lorg/anddev/andengine/util/modifier/ease/EaseQuartInOut;
    .locals 1

    .prologue
    .line 26
    sget-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseQuartInOut;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseQuartInOut;

    if-nez v0, :cond_0

    .line 27
    new-instance v0, Lorg/anddev/andengine/util/modifier/ease/EaseQuartInOut;

    invoke-direct {v0}, Lorg/anddev/andengine/util/modifier/ease/EaseQuartInOut;-><init>()V

    sput-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseQuartInOut;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseQuartInOut;

    .line 29
    :cond_0
    sget-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseQuartInOut;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseQuartInOut;

    return-object v0
.end method


# virtual methods
.method public getPercentageDone(FFFF)F
    .locals 3
    .parameter "pSecondsElapsed"
    .parameter "pDuration"
    .parameter "pMinValue"
    .parameter "pMaxValue"

    .prologue
    const/high16 v2, 0x4000

    const/high16 v1, 0x3f00

    .line 42
    mul-float v0, p2, v1

    div-float/2addr p1, v0

    const/high16 v0, 0x3f80

    cmpg-float v0, p1, v0

    if-gez v0, :cond_0

    .line 43
    mul-float v0, p4, v1

    mul-float/2addr v0, p1

    mul-float/2addr v0, p1

    mul-float/2addr v0, p1

    mul-float/2addr v0, p1

    add-float/2addr v0, p3

    .line 45
    :goto_0
    return v0

    :cond_0
    neg-float v0, p4

    mul-float/2addr v0, v1

    sub-float/2addr p1, v2

    mul-float v1, p1, p1

    mul-float/2addr v1, p1

    mul-float/2addr v1, p1

    sub-float/2addr v1, v2

    mul-float/2addr v0, v1

    add-float/2addr v0, p3

    goto :goto_0
.end method