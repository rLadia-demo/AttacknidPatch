.class public Lorg/anddev/andengine/util/modifier/ease/EaseElasticInOut;
.super Ljava/lang/Object;
.source "EaseElasticInOut.java"

# interfaces
.implements Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;
.implements Lorg/anddev/andengine/util/constants/MathConstants;


# static fields
.field private static INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseElasticInOut;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    return-void
.end method

.method public static getInstance()Lorg/anddev/andengine/util/modifier/ease/EaseElasticInOut;
    .locals 1

    .prologue
    .line 30
    sget-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseElasticInOut;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseElasticInOut;

    if-nez v0, :cond_0

    .line 31
    new-instance v0, Lorg/anddev/andengine/util/modifier/ease/EaseElasticInOut;

    invoke-direct {v0}, Lorg/anddev/andengine/util/modifier/ease/EaseElasticInOut;-><init>()V

    sput-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseElasticInOut;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseElasticInOut;

    .line 33
    :cond_0
    sget-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseElasticInOut;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseElasticInOut;

    return-object v0
.end method


# virtual methods
.method public getPercentageDone(FFFF)F
    .locals 11
    .parameter "pSecondsElapsed"
    .parameter "pDuration"
    .parameter "pMinValue"
    .parameter "pMaxValue"

    .prologue
    .line 47
    const/4 v1, 0x0

    .line 48
    .local v1, p:F
    const/4 v0, 0x0

    .line 49
    .local v0, a:F
    const/4 v3, 0x0

    cmpl-float v3, p1, v3

    if-nez v3, :cond_0

    .line 67
    .end local p3
    :goto_0
    return p3

    .line 52
    .restart local p3
    :cond_0
    float-to-double v3, p1

    float-to-double v5, p2

    const-wide/high16 v7, 0x3fe0

    mul-double/2addr v5, v7

    div-double/2addr v3, v5

    double-to-float p1, v3

    const/high16 v3, 0x4000

    cmpl-float v3, p1, v3

    if-nez v3, :cond_1

    .line 53
    add-float/2addr p3, p4

    goto :goto_0

    .line 55
    :cond_1
    const/4 v3, 0x0

    cmpl-float v3, v1, v3

    if-nez v3, :cond_2

    .line 56
    const v3, 0x3ee66667

    mul-float v1, p2, v3

    .line 58
    :cond_2
    const/4 v3, 0x0

    cmpl-float v3, v0, v3

    if-eqz v3, :cond_4

    const/4 v3, 0x0

    cmpl-float v3, p4, v3

    if-lez v3, :cond_3

    cmpg-float v3, v0, p4

    if-ltz v3, :cond_4

    :cond_3
    const/4 v3, 0x0

    cmpg-float v3, p4, v3

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
    const/high16 v3, 0x3f80

    cmpg-float v3, p1, v3

    if-gez v3, :cond_6

    .line 65
    const-wide/high16 v3, -0x4020

    float-to-double v5, v0

    const-wide/high16 v7, 0x4000

    const/high16 v9, 0x4120

    const/high16 v10, 0x3f80

    sub-float/2addr p1, v10

    mul-float/2addr v9, p1

    float-to-double v9, v9

    invoke-static {v7, v8, v9, v10}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v7

    mul-double/2addr v5, v7

    mul-float v7, p1, p2

    sub-float/2addr v7, v2

    const v8, 0x40c90fdb

    mul-float/2addr v7, v8

    div-float/2addr v7, v1

    invoke-static {v7}, Landroid/util/FloatMath;->sin(F)F

    move-result v7

    float-to-double v7, v7

    mul-double/2addr v5, v7

    mul-double/2addr v3, v5

    float-to-double v5, p3

    add-double/2addr v3, v5

    double-to-float p3, v3

    goto :goto_0

    .line 62
    .end local v2           #s:F
    :cond_5
    const v3, 0x40c90fdb

    div-float v3, v1, v3

    float-to-double v3, v3

    div-float v5, p4, v0

    float-to-double v5, v5

    invoke-static {v5, v6}, Ljava/lang/Math;->asin(D)D

    move-result-wide v5

    mul-double/2addr v3, v5

    double-to-float v2, v3

    .restart local v2       #s:F
    goto :goto_1

    .line 67
    :cond_6
    float-to-double v3, v0

    const-wide/high16 v5, 0x4000

    const/high16 v7, -0x3ee0

    const/high16 v8, 0x3f80

    sub-float/2addr p1, v8

    mul-float/2addr v7, p1

    float-to-double v7, v7

    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v5

    mul-double/2addr v3, v5

    mul-float v5, p1, p2

    sub-float/2addr v5, v2

    const v6, 0x40c90fdb

    mul-float/2addr v5, v6

    div-float/2addr v5, v1

    invoke-static {v5}, Landroid/util/FloatMath;->sin(F)F

    move-result v5

    float-to-double v5, v5

    mul-double/2addr v3, v5

    const-wide/high16 v5, 0x3fe0

    mul-double/2addr v3, v5

    float-to-double v5, p4

    add-double/2addr v3, v5

    float-to-double v5, p3

    add-double/2addr v3, v5

    double-to-float p3, v3

    goto/16 :goto_0
.end method
