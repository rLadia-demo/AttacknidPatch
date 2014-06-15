.class public Lorg/anddev/andengine/util/modifier/ease/EaseSineInOut;
.super Ljava/lang/Object;
.source "EaseSineInOut.java"

# interfaces
.implements Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;


# static fields
.field private static INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseSineInOut;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    return-void
.end method

.method public static getInstance()Lorg/anddev/andengine/util/modifier/ease/EaseSineInOut;
    .locals 1

    .prologue
    .line 30
    sget-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseSineInOut;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseSineInOut;

    if-nez v0, :cond_0

    .line 31
    new-instance v0, Lorg/anddev/andengine/util/modifier/ease/EaseSineInOut;

    invoke-direct {v0}, Lorg/anddev/andengine/util/modifier/ease/EaseSineInOut;-><init>()V

    sput-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseSineInOut;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseSineInOut;

    .line 33
    :cond_0
    sget-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseSineInOut;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseSineInOut;

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
    .line 46
    neg-float v0, p4

    const/high16 v1, 0x3f00

    mul-float/2addr v0, v1

    const v1, 0x40490fdb

    mul-float/2addr v1, p1

    div-float/2addr v1, p2

    invoke-static {v1}, Landroid/util/FloatMath;->cos(F)F

    move-result v1

    const/high16 v2, 0x3f80

    sub-float/2addr v1, v2

    mul-float/2addr v0, v1

    add-float/2addr v0, p3

    return v0
.end method
