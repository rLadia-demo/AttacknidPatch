.class public Lorg/anddev/andengine/util/modifier/ease/EaseCircularOut;
.super Ljava/lang/Object;
.source "EaseCircularOut.java"

# interfaces
.implements Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;


# static fields
.field private static INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseCircularOut;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    return-void
.end method

.method public static getInstance()Lorg/anddev/andengine/util/modifier/ease/EaseCircularOut;
    .locals 1

    .prologue
    .line 28
    sget-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseCircularOut;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseCircularOut;

    if-nez v0, :cond_0

    .line 29
    new-instance v0, Lorg/anddev/andengine/util/modifier/ease/EaseCircularOut;

    invoke-direct {v0}, Lorg/anddev/andengine/util/modifier/ease/EaseCircularOut;-><init>()V

    sput-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseCircularOut;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseCircularOut;

    .line 31
    :cond_0
    sget-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseCircularOut;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseCircularOut;

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
    const/high16 v1, 0x3f80

    .line 44
    div-float v0, p1, p2

    sub-float p1, v0, v1

    mul-float v0, p1, p1

    sub-float v0, v1, v0

    invoke-static {v0}, Landroid/util/FloatMath;->sqrt(F)F

    move-result v0

    mul-float/2addr v0, p4

    add-float/2addr v0, p3

    return v0
.end method
