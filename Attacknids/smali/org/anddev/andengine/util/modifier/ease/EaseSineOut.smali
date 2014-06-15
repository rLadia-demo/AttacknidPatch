.class public Lorg/anddev/andengine/util/modifier/ease/EaseSineOut;
.super Ljava/lang/Object;
.source "EaseSineOut.java"

# interfaces
.implements Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;
.implements Lorg/anddev/andengine/util/constants/MathConstants;


# static fields
.field private static INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseSineOut;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    return-void
.end method

.method public static getInstance()Lorg/anddev/andengine/util/modifier/ease/EaseSineOut;
    .locals 1

    .prologue
    .line 30
    sget-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseSineOut;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseSineOut;

    if-nez v0, :cond_0

    .line 31
    new-instance v0, Lorg/anddev/andengine/util/modifier/ease/EaseSineOut;

    invoke-direct {v0}, Lorg/anddev/andengine/util/modifier/ease/EaseSineOut;-><init>()V

    sput-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseSineOut;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseSineOut;

    .line 33
    :cond_0
    sget-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseSineOut;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseSineOut;

    return-object v0
.end method


# virtual methods
.method public getPercentageDone(FFFF)F
    .locals 2
    .parameter "pSecondsElapsed"
    .parameter "pDuration"
    .parameter "pMinValue"
    .parameter "pMaxValue"

    .prologue
    .line 46
    div-float v0, p1, p2

    const v1, 0x3fc90fdb

    mul-float/2addr v0, v1

    invoke-static {v0}, Landroid/util/FloatMath;->sin(F)F

    move-result v0

    mul-float/2addr v0, p4

    add-float/2addr v0, p3

    return v0
.end method
