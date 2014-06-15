.class public Lorg/anddev/andengine/util/modifier/ease/EaseBackOut;
.super Ljava/lang/Object;
.source "EaseBackOut.java"

# interfaces
.implements Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;


# static fields
.field private static INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseBackOut;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    return-void
.end method

.method public static getInstance()Lorg/anddev/andengine/util/modifier/ease/EaseBackOut;
    .locals 1

    .prologue
    .line 27
    sget-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseBackOut;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseBackOut;

    if-nez v0, :cond_0

    .line 28
    new-instance v0, Lorg/anddev/andengine/util/modifier/ease/EaseBackOut;

    invoke-direct {v0}, Lorg/anddev/andengine/util/modifier/ease/EaseBackOut;-><init>()V

    sput-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseBackOut;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseBackOut;

    .line 30
    :cond_0
    sget-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseBackOut;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseBackOut;

    return-object v0
.end method


# virtual methods
.method public getPercentageDone(FFFF)F
    .locals 4
    .parameter "pSecondsElapsed"
    .parameter "pDuration"
    .parameter "pMinValue"
    .parameter "pMaxValue"

    .prologue
    const/high16 v3, 0x3f80

    .line 43
    div-float v0, p1, p2

    sub-float p1, v0, v3

    mul-float v0, p1, p1

    const v1, 0x402ce6b0

    mul-float/2addr v1, p1

    const v2, 0x3fd9cd60

    add-float/2addr v1, v2

    mul-float/2addr v0, v1

    add-float/2addr v0, v3

    mul-float/2addr v0, p4

    add-float/2addr v0, p3

    return v0
.end method
