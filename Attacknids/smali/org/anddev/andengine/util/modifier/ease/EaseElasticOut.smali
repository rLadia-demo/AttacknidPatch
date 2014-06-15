.class public Lorg/anddev/andengine/util/modifier/ease/EaseElasticOut;
.super Ljava/lang/Object;
.source "EaseElasticOut.java"

# interfaces
.implements Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;
.implements Lorg/anddev/andengine/util/constants/MathConstants;


# static fields
.field private static INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseElasticOut;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    return-void
.end method

.method public static getInstance()Lorg/anddev/andengine/util/modifier/ease/EaseElasticOut;
    .locals 1

    .prologue
    .line 30
    sget-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseElasticOut;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseElasticOut;

    if-nez v0, :cond_0

    .line 31
    new-instance v0, Lorg/anddev/andengine/util/modifier/ease/EaseElasticOut;

    invoke-direct {v0}, Lorg/anddev/andengine/util/modifier/ease/EaseElasticOut;-><init>()V

    sput-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseElasticOut;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseElasticOut;

    .line 33
    :cond_0
    sget-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseElasticOut;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseElasticOut;

    return-object v0
.end method


# virtual methods
.method public getPercentageDone(FFFF)F
    .locals 10
    .parameter "pSecondsElapsed"
    .parameter "pDuration"
    .parameter "pMinValue"
    .parameter "pMaxValue"

    .prologue
    const v9, 0x40c90fdb

    const/4 v4, 0x0

    .line 47
    const/4 v1, 0x0

    .line 48
    .local v1, p:F
    const/4 v0, 0x0

    .line 49
    .local v0, a:F
    cmpl-float v3, p1, v4

    if-nez v3, :cond_0

    .line 64
    .end local p3
    :goto_0
    return p3

    .line 52
    .restart local p3
    :cond_0
    div-float/2addr p1, p2

    const/high16 v3, 0x3f80

    cmpl-float v3, p1, v3

    if-nez v3, :cond_1

    .line 53
    add-float/2addr p3, p4

    goto :goto_0

    .line 55
    :cond_1
    cmpl-float v3, v1, v4

    if-nez v3, :cond_2

    .line 56
    const v3, 0x3e99999a

    mul-float v1, p2, v3

    .line 58
    :cond_2
    cmpl-float v3, v0, v4

    if-eqz v3, :cond_4

    cmpl-float v3, p4, v4

    if-lez v3, :cond_3

    cmpg-float v3, v0, p4

    if-ltz v3, :cond_4

    :cond_3
    cmpg-float v3, p4, v4

    if-gez v3, :cond_5

    neg-float v3, p4

    cmpg-float v3, v0, v3

    if-gez v3, :cond_5

    .line 59
    :cond_4
    move v0, p4

    .line 60
    const/high16 v3, 0x4080

    div-float v2, v1, v3

    .line 64
    .local v2, s:F
    :goto_1
    float-to-double v3, v0

    const-wide/high16 v5, 0x4000

    const/high16 v7, -0x3ee0

    mul-float/2addr v7, p1

    float-to-double v7, v7

    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v5

    mul-double/2addr v3, v5

    mul-float v5, p1, p2

    sub-float/2addr v5, v2

    mul-float/2addr v5, v9

    div-float/2addr v5, v1

    invoke-static {v5}, Landroid/util/FloatMath;->sin(F)F

    move-result v5

    float-to-double v5, v5

    mul-double/2addr v3, v5

    float-to-double v5, p4

    add-double/2addr v3, v5

    float-to-double v5, p3

    add-double/2addr v3, v5

    double-to-float p3, v3

    goto :goto_0

    .line 62
    .end local v2           #s:F
    :cond_5
    div-float v3, v1, v9

    float-to-double v3, v3

    div-float v5, p4, v0

    float-to-double v5, v5

    invoke-static {v5, v6}, Ljava/lang/Math;->asin(D)D

    move-result-wide v5

    mul-double/2addr v3, v5

    double-to-float v2, v3

    .restart local v2       #s:F
    goto :goto_1
.end method
