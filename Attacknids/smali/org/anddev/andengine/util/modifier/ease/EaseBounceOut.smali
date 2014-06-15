.class public Lorg/anddev/andengine/util/modifier/ease/EaseBounceOut;
.super Ljava/lang/Object;
.source "EaseBounceOut.java"

# interfaces
.implements Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;


# static fields
.field private static INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseBounceOut;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    return-void
.end method

.method public static getInstance()Lorg/anddev/andengine/util/modifier/ease/EaseBounceOut;
    .locals 1

    .prologue
    .line 27
    sget-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseBounceOut;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseBounceOut;

    if-nez v0, :cond_0

    .line 28
    new-instance v0, Lorg/anddev/andengine/util/modifier/ease/EaseBounceOut;

    invoke-direct {v0}, Lorg/anddev/andengine/util/modifier/ease/EaseBounceOut;-><init>()V

    sput-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseBounceOut;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseBounceOut;

    .line 30
    :cond_0
    sget-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseBounceOut;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseBounceOut;

    return-object v0
.end method


# virtual methods
.method public getPercentageDone(FFFF)F
    .locals 5
    .parameter "pSecondsElapsed"
    .parameter "pDuration"
    .parameter "pMinValue"
    .parameter "pMaxValue"

    .prologue
    const/high16 v4, 0x40f2

    .line 43
    div-float/2addr p1, p2

    float-to-double v0, p1

    const-wide v2, 0x3fd745d1745d1746L

    cmpg-double v0, v0, v2

    if-gez v0, :cond_0

    .line 44
    mul-float v0, v4, p1

    mul-float/2addr v0, p1

    mul-float/2addr v0, p4

    add-float/2addr v0, p3

    .line 50
    :goto_0
    return v0

    .line 45
    :cond_0
    float-to-double v0, p1

    const-wide v2, 0x3fe745d1745d1746L

    cmpg-double v0, v0, v2

    if-gez v0, :cond_1

    .line 46
    const v0, 0x3f0ba2e9

    sub-float/2addr p1, v0

    mul-float v0, v4, p1

    mul-float/2addr v0, p1

    const/high16 v1, 0x3f40

    add-float/2addr v0, v1

    mul-float/2addr v0, p4

    add-float/2addr v0, p3

    goto :goto_0

    .line 47
    :cond_1
    float-to-double v0, p1

    const-wide v2, 0x3fed1745d1745d17L

    cmpg-double v0, v0, v2

    if-gez v0, :cond_2

    .line 48
    const v0, 0x3f51745d

    sub-float/2addr p1, v0

    mul-float v0, v4, p1

    mul-float/2addr v0, p1

    const/high16 v1, 0x3f70

    add-float/2addr v0, v1

    mul-float/2addr v0, p4

    add-float/2addr v0, p3

    goto :goto_0

    .line 50
    :cond_2
    const v0, 0x3f745d17

    sub-float/2addr p1, v0

    mul-float v0, v4, p1

    mul-float/2addr v0, p1

    const/high16 v1, 0x3f7c

    add-float/2addr v0, v1

    mul-float/2addr v0, p4

    add-float/2addr v0, p3

    goto :goto_0
.end method
