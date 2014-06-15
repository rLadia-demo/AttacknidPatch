.class public Lorg/anddev/andengine/util/modifier/ease/EaseCubicOut;
.super Ljava/lang/Object;
.source "EaseCubicOut.java"

# interfaces
.implements Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;


# static fields
.field private static INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseCubicOut;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    return-void
.end method

.method public static getInstance()Lorg/anddev/andengine/util/modifier/ease/EaseCubicOut;
    .locals 1

    .prologue
    .line 26
    sget-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseCubicOut;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseCubicOut;

    if-nez v0, :cond_0

    .line 27
    new-instance v0, Lorg/anddev/andengine/util/modifier/ease/EaseCubicOut;

    invoke-direct {v0}, Lorg/anddev/andengine/util/modifier/ease/EaseCubicOut;-><init>()V

    sput-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseCubicOut;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseCubicOut;

    .line 29
    :cond_0
    sget-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseCubicOut;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseCubicOut;

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

    .line 42
    div-float v0, p1, p2

    sub-float p1, v0, v1

    mul-float v0, p1, p1

    mul-float/2addr v0, p1

    add-float/2addr v0, v1

    mul-float/2addr v0, p4

    add-float/2addr v0, p3

    return v0
.end method
