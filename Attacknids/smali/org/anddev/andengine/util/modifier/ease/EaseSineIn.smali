.class public Lorg/anddev/andengine/util/modifier/ease/EaseSineIn;
.super Ljava/lang/Object;
.source "EaseSineIn.java"

# interfaces
.implements Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;
.implements Lorg/anddev/andengine/util/constants/MathConstants;


# static fields
.field private static INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseSineIn;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    return-void
.end method

.method public static getInstance()Lorg/anddev/andengine/util/modifier/ease/EaseSineIn;
    .locals 1

    .prologue
    .line 30
    sget-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseSineIn;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseSineIn;

    if-nez v0, :cond_0

    .line 31
    new-instance v0, Lorg/anddev/andengine/util/modifier/ease/EaseSineIn;

    invoke-direct {v0}, Lorg/anddev/andengine/util/modifier/ease/EaseSineIn;-><init>()V

    sput-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseSineIn;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseSineIn;

    .line 33
    :cond_0
    sget-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseSineIn;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseSineIn;

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

    div-float v1, p1, p2

    const v2, 0x3fc90fdb

    mul-float/2addr v1, v2

    invoke-static {v1}, Landroid/util/FloatMath;->cos(F)F

    move-result v1

    mul-float/2addr v0, v1

    add-float/2addr v0, p4

    add-float/2addr v0, p3

    return v0
.end method
