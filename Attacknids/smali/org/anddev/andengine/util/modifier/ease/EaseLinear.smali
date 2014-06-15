.class public Lorg/anddev/andengine/util/modifier/ease/EaseLinear;
.super Ljava/lang/Object;
.source "EaseLinear.java"

# interfaces
.implements Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;


# static fields
.field private static INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseLinear;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    return-void
.end method

.method public static getInstance()Lorg/anddev/andengine/util/modifier/ease/EaseLinear;
    .locals 1

    .prologue
    .line 26
    sget-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseLinear;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseLinear;

    if-nez v0, :cond_0

    .line 27
    new-instance v0, Lorg/anddev/andengine/util/modifier/ease/EaseLinear;

    invoke-direct {v0}, Lorg/anddev/andengine/util/modifier/ease/EaseLinear;-><init>()V

    sput-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseLinear;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseLinear;

    .line 29
    :cond_0
    sget-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseLinear;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseLinear;

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
    mul-float v0, p4, p1

    div-float/2addr v0, p2

    add-float/2addr v0, p3

    return v0
.end method
