.class public Lorg/anddev/andengine/util/modifier/ease/EaseQuadOut;
.super Ljava/lang/Object;
.source "EaseQuadOut.java"

# interfaces
.implements Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;


# static fields
.field private static INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseQuadOut;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    return-void
.end method

.method public static getInstance()Lorg/anddev/andengine/util/modifier/ease/EaseQuadOut;
    .locals 1

    .prologue
    .line 26
    sget-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseQuadOut;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseQuadOut;

    if-nez v0, :cond_0

    .line 27
    new-instance v0, Lorg/anddev/andengine/util/modifier/ease/EaseQuadOut;

    invoke-direct {v0}, Lorg/anddev/andengine/util/modifier/ease/EaseQuadOut;-><init>()V

    sput-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseQuadOut;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseQuadOut;

    .line 29
    :cond_0
    sget-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseQuadOut;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseQuadOut;

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
    .line 42
    neg-float v0, p4

    div-float/2addr p1, p2

    mul-float/2addr v0, p1

    const/high16 v1, 0x4000

    sub-float v1, p1, v1

    mul-float/2addr v0, v1

    add-float/2addr v0, p3

    return v0
.end method
