.class public Lorg/anddev/andengine/util/modifier/ease/EaseCubicIn;
.super Ljava/lang/Object;
.source "EaseCubicIn.java"

# interfaces
.implements Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;


# static fields
.field private static INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseCubicIn;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    return-void
.end method

.method public static getInstance()Lorg/anddev/andengine/util/modifier/ease/EaseCubicIn;
    .locals 1

    .prologue
    .line 26
    sget-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseCubicIn;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseCubicIn;

    if-nez v0, :cond_0

    .line 27
    new-instance v0, Lorg/anddev/andengine/util/modifier/ease/EaseCubicIn;

    invoke-direct {v0}, Lorg/anddev/andengine/util/modifier/ease/EaseCubicIn;-><init>()V

    sput-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseCubicIn;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseCubicIn;

    .line 29
    :cond_0
    sget-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseCubicIn;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseCubicIn;

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

    add-float/2addr v0, p3

    return v0
.end method
