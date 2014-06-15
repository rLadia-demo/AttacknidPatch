.class public Lorg/anddev/andengine/util/modifier/ease/EaseCircularIn;
.super Ljava/lang/Object;
.source "EaseCircularIn.java"

# interfaces
.implements Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;


# static fields
.field private static INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseCircularIn;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    return-void
.end method

.method public static getInstance()Lorg/anddev/andengine/util/modifier/ease/EaseCircularIn;
    .locals 1

    .prologue
    .line 28
    sget-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseCircularIn;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseCircularIn;

    if-nez v0, :cond_0

    .line 29
    new-instance v0, Lorg/anddev/andengine/util/modifier/ease/EaseCircularIn;

    invoke-direct {v0}, Lorg/anddev/andengine/util/modifier/ease/EaseCircularIn;-><init>()V

    sput-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseCircularIn;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseCircularIn;

    .line 31
    :cond_0
    sget-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseCircularIn;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseCircularIn;

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
    const/high16 v2, 0x3f80

    .line 44
    neg-float v0, p4

    div-float/2addr p1, p2

    mul-float v1, p1, p1

    sub-float v1, v2, v1

    invoke-static {v1}, Landroid/util/FloatMath;->sqrt(F)F

    move-result v1

    sub-float/2addr v1, v2

    mul-float/2addr v0, v1

    add-float/2addr v0, p3

    return v0
.end method
