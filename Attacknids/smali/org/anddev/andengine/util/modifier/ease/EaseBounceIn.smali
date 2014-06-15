.class public Lorg/anddev/andengine/util/modifier/ease/EaseBounceIn;
.super Ljava/lang/Object;
.source "EaseBounceIn.java"

# interfaces
.implements Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;


# static fields
.field private static INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseBounceIn;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    return-void
.end method

.method public static getInstance()Lorg/anddev/andengine/util/modifier/ease/EaseBounceIn;
    .locals 1

    .prologue
    .line 27
    sget-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseBounceIn;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseBounceIn;

    if-nez v0, :cond_0

    .line 28
    new-instance v0, Lorg/anddev/andengine/util/modifier/ease/EaseBounceIn;

    invoke-direct {v0}, Lorg/anddev/andengine/util/modifier/ease/EaseBounceIn;-><init>()V

    sput-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseBounceIn;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseBounceIn;

    .line 30
    :cond_0
    sget-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseBounceIn;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseBounceIn;

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
    .line 43
    invoke-static {}, Lorg/anddev/andengine/util/modifier/ease/EaseBounceOut;->getInstance()Lorg/anddev/andengine/util/modifier/ease/EaseBounceOut;

    move-result-object v0

    sub-float v1, p2, p1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p2, v2, p4}, Lorg/anddev/andengine/util/modifier/ease/EaseBounceOut;->getPercentageDone(FFFF)F

    move-result v0

    sub-float v0, p4, v0

    add-float/2addr v0, p3

    return v0
.end method
