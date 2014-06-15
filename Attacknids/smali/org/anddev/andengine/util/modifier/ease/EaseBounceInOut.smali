.class public Lorg/anddev/andengine/util/modifier/ease/EaseBounceInOut;
.super Ljava/lang/Object;
.source "EaseBounceInOut.java"

# interfaces
.implements Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;


# static fields
.field private static INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseBounceInOut;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    return-void
.end method

.method public static getInstance()Lorg/anddev/andengine/util/modifier/ease/EaseBounceInOut;
    .locals 1

    .prologue
    .line 27
    sget-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseBounceInOut;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseBounceInOut;

    if-nez v0, :cond_0

    .line 28
    new-instance v0, Lorg/anddev/andengine/util/modifier/ease/EaseBounceInOut;

    invoke-direct {v0}, Lorg/anddev/andengine/util/modifier/ease/EaseBounceInOut;-><init>()V

    sput-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseBounceInOut;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseBounceInOut;

    .line 30
    :cond_0
    sget-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseBounceInOut;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseBounceInOut;

    return-object v0
.end method


# virtual methods
.method public getPercentageDone(FFFF)F
    .locals 9
    .parameter "pSecondsElapsed"
    .parameter "pDuration"
    .parameter "pMinValue"
    .parameter "pMaxValue"

    .prologue
    const/high16 v8, 0x4000

    const/4 v7, 0x0

    const/high16 v6, 0x3f00

    .line 43
    float-to-double v0, p1

    float-to-double v2, p2

    const-wide/high16 v4, 0x3fe0

    mul-double/2addr v2, v4

    cmpg-double v0, v0, v2

    if-gez v0, :cond_0

    .line 44
    invoke-static {}, Lorg/anddev/andengine/util/modifier/ease/EaseBounceIn;->getInstance()Lorg/anddev/andengine/util/modifier/ease/EaseBounceIn;

    move-result-object v0

    mul-float v1, p1, v8

    invoke-virtual {v0, v1, p2, v7, p4}, Lorg/anddev/andengine/util/modifier/ease/EaseBounceIn;->getPercentageDone(FFFF)F

    move-result v0

    mul-float/2addr v0, v6

    add-float/2addr v0, p3

    .line 46
    :goto_0
    return v0

    :cond_0
    invoke-static {}, Lorg/anddev/andengine/util/modifier/ease/EaseBounceOut;->getInstance()Lorg/anddev/andengine/util/modifier/ease/EaseBounceOut;

    move-result-object v0

    mul-float v1, p1, v8

    sub-float/2addr v1, p2

    invoke-virtual {v0, v1, p2, v7, p4}, Lorg/anddev/andengine/util/modifier/ease/EaseBounceOut;->getPercentageDone(FFFF)F

    move-result v0

    mul-float/2addr v0, v6

    mul-float v1, p4, v6

    add-float/2addr v0, v1

    add-float/2addr v0, p3

    goto :goto_0
.end method
