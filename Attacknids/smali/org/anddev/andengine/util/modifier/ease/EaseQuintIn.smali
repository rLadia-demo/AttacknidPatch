.class public Lorg/anddev/andengine/util/modifier/ease/EaseQuintIn;
.super Ljava/lang/Object;
.source "EaseQuintIn.java"

# interfaces
.implements Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;


# static fields
.field private static INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseQuintIn;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    return-void
.end method

.method public static getInstance()Lorg/anddev/andengine/util/modifier/ease/EaseQuintIn;
    .locals 1

    .prologue
    .line 26
    sget-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseQuintIn;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseQuintIn;

    if-nez v0, :cond_0

    .line 27
    new-instance v0, Lorg/anddev/andengine/util/modifier/ease/EaseQuintIn;

    invoke-direct {v0}, Lorg/anddev/andengine/util/modifier/ease/EaseQuintIn;-><init>()V

    sput-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseQuintIn;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseQuintIn;

    .line 29
    :cond_0
    sget-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseQuintIn;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseQuintIn;

    return-object v0
.end method


# virtual methods
.method public getPercentageDone(FFFF)F
    .locals 1
    .parameter "pSecondsElapsed"
    .parameter "pDuration"
    .parameter "pMinValue"
    .parameter "pMaxValue"

    .prologue
    .line 42
    div-float/2addr p1, p2

    mul-float v0, p4, p1

    mul-float/2addr v0, p1

    mul-float/2addr v0, p1

    mul-float/2addr v0, p1

    mul-float/2addr v0, p1

    add-float/2addr v0, p3

    return v0
.end method
