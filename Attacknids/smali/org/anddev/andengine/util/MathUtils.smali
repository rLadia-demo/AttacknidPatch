.class public Lorg/anddev/andengine/util/MathUtils;
.super Ljava/lang/Object;
.source "MathUtils.java"

# interfaces
.implements Lorg/anddev/andengine/util/constants/MathConstants;


# static fields
.field public static RANDOM:Ljava/util/Random;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 18
    new-instance v0, Ljava/util/Random;

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Ljava/util/Random;-><init>(J)V

    sput-object v0, Lorg/anddev/andengine/util/MathUtils;->RANDOM:Ljava/util/Random;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final arrayAverage([F)F
    .locals 2
    .parameter "pValues"

    .prologue
    .line 138
    invoke-static {p0}, Lorg/anddev/andengine/util/MathUtils;->arraySum([F)F

    move-result v0

    array-length v1, p0

    int-to-float v1, v1

    div-float/2addr v0, v1

    return v0
.end method

.method public static final arraySum([F)F
    .locals 4
    .parameter "pValues"

    .prologue
    .line 129
    const/4 v1, 0x0

    .line 130
    .local v1, sum:F
    array-length v2, p0

    .line 131
    .local v2, valueCount:I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    if-lt v0, v2, :cond_0

    .line 134
    return v1

    .line 132
    :cond_0
    aget v3, p0, v0

    add-float/2addr v1, v3

    .line 131
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static final arraySumInternal([I)V
    .locals 4
    .parameter "pValues"

    .prologue
    .line 99
    array-length v1, p0

    .line 100
    .local v1, valueCount:I
    const/4 v0, 0x1

    .local v0, i:I
    :goto_0
    if-lt v0, v1, :cond_0

    .line 103
    return-void

    .line 101
    :cond_0
    add-int/lit8 v2, v0, -0x1

    aget v2, p0, v2

    aget v3, p0, v0

    add-int/2addr v2, v3

    aput v2, p0, v0

    .line 100
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static final arraySumInternal([J)V
    .locals 6
    .parameter "pValues"

    .prologue
    .line 106
    array-length v1, p0

    .line 107
    .local v1, valueCount:I
    const/4 v0, 0x1

    .local v0, i:I
    :goto_0
    if-lt v0, v1, :cond_0

    .line 110
    return-void

    .line 108
    :cond_0
    add-int/lit8 v2, v0, -0x1

    aget-wide v2, p0, v2

    aget-wide v4, p0, v0

    add-long/2addr v2, v4

    aput-wide v2, p0, v0

    .line 107
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static final arraySumInternal([JJ)V
    .locals 6
    .parameter "pValues"
    .parameter "pFactor"

    .prologue
    const/4 v4, 0x0

    .line 113
    aget-wide v2, p0, v4

    mul-long/2addr v2, p1

    aput-wide v2, p0, v4

    .line 114
    array-length v1, p0

    .line 115
    .local v1, valueCount:I
    const/4 v0, 0x1

    .local v0, i:I
    :goto_0
    if-lt v0, v1, :cond_0

    .line 118
    return-void

    .line 116
    :cond_0
    add-int/lit8 v2, v0, -0x1

    aget-wide v2, p0, v2

    aget-wide v4, p0, v0

    mul-long/2addr v4, p1

    add-long/2addr v2, v4

    aput-wide v2, p0, v0

    .line 115
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static final arraySumInto([J[JJ)V
    .locals 6
    .parameter "pValues"
    .parameter "pTargetValues"
    .parameter "pFactor"

    .prologue
    const/4 v4, 0x0

    .line 121
    aget-wide v2, p0, v4

    mul-long/2addr v2, p2

    aput-wide v2, p1, v4

    .line 122
    array-length v1, p0

    .line 123
    .local v1, valueCount:I
    const/4 v0, 0x1

    .local v0, i:I
    :goto_0
    if-lt v0, v1, :cond_0

    .line 126
    return-void

    .line 124
    :cond_0
    add-int/lit8 v2, v0, -0x1

    aget-wide v2, p1, v2

    aget-wide v4, p0, v0

    mul-long/2addr v4, p2

    add-long/2addr v2, v4

    aput-wide v2, p1, v0

    .line 123
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static bringToBounds(FFF)F
    .locals 1
    .parameter "pMinValue"
    .parameter "pMaxValue"
    .parameter "pValue"

    .prologue
    .line 191
    invoke-static {p1, p2}, Ljava/lang/Math;->min(FF)F

    move-result v0

    invoke-static {p0, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    return v0
.end method

.method public static bringToBounds(III)I
    .locals 1
    .parameter "pMinValue"
    .parameter "pMaxValue"
    .parameter "pValue"

    .prologue
    .line 187
    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    move-result v0

    invoke-static {p0, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    return v0
.end method

.method public static final degToRad(F)F
    .locals 1
    .parameter "pDegree"

    .prologue
    .line 45
    const v0, 0x3c8efa35

    mul-float/2addr v0, p0

    return v0
.end method

.method public static final isPowerOfTwo(I)Z
    .locals 1
    .parameter "n"

    .prologue
    .line 70
    if-eqz p0, :cond_0

    add-int/lit8 v0, p0, -0x1

    and-int/2addr v0, p0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static final nextPowerOfTwo(I)I
    .locals 3
    .parameter "n"

    .prologue
    .line 74
    move v1, p0

    .line 76
    .local v1, k:I
    if-nez v1, :cond_0

    .line 77
    const/4 v2, 0x1

    .line 86
    :goto_0
    return v2

    .line 80
    :cond_0
    add-int/lit8 v1, v1, -0x1

    .line 82
    const/4 v0, 0x1

    .local v0, i:I
    :goto_1
    const/16 v2, 0x20

    if-lt v0, v2, :cond_1

    .line 86
    add-int/lit8 v2, v1, 0x1

    goto :goto_0

    .line 83
    :cond_1
    shr-int v2, v1, v0

    or-int/2addr v1, v2

    .line 82
    shl-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static final radToDeg(F)F
    .locals 1
    .parameter "pRad"

    .prologue
    .line 41
    const v0, 0x42652ee0

    mul-float/2addr v0, p0

    return v0
.end method

.method public static final random(FF)F
    .locals 2
    .parameter "pMin"
    .parameter "pMax"

    .prologue
    .line 57
    sget-object v0, Lorg/anddev/andengine/util/MathUtils;->RANDOM:Ljava/util/Random;

    invoke-virtual {v0}, Ljava/util/Random;->nextFloat()F

    move-result v0

    sub-float v1, p1, p0

    mul-float/2addr v0, v1

    add-float/2addr v0, p0

    return v0
.end method

.method public static final random(II)I
    .locals 2
    .parameter "pMin"
    .parameter "pMax"

    .prologue
    .line 66
    sget-object v0, Lorg/anddev/andengine/util/MathUtils;->RANDOM:Ljava/util/Random;

    sub-int v1, p1, p0

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/Random;->nextInt(I)I

    move-result v0

    add-int/2addr v0, p0

    return v0
.end method

.method public static final randomSign()I
    .locals 1

    .prologue
    .line 49
    sget-object v0, Lorg/anddev/andengine/util/MathUtils;->RANDOM:Ljava/util/Random;

    invoke-virtual {v0}, Ljava/util/Random;->nextBoolean()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 50
    const/4 v0, 0x1

    .line 52
    :goto_0
    return v0

    :cond_0
    const/4 v0, -0x1

    goto :goto_0
.end method

.method public static revertRotateAndScaleAroundCenter([FFFFFFFF)[F
    .locals 1
    .parameter "pVertices"
    .parameter "pRotation"
    .parameter "pRotationCenterX"
    .parameter "pRotationCenterY"
    .parameter "pScaleX"
    .parameter "pScaleY"
    .parameter "pScaleCenterX"
    .parameter "pScaleCenterY"

    .prologue
    .line 182
    invoke-static {p0, p4, p5, p6, p7}, Lorg/anddev/andengine/util/MathUtils;->revertScaleAroundCenter([FFFFF)[F

    .line 183
    invoke-static {p0, p1, p2, p3}, Lorg/anddev/andengine/util/MathUtils;->revertRotateAroundCenter([FFFF)[F

    move-result-object v0

    return-object v0
.end method

.method public static revertRotateAroundCenter([FFFF)[F
    .locals 1
    .parameter "pVertices"
    .parameter "pRotation"
    .parameter "pRotationCenterX"
    .parameter "pRotationCenterY"

    .prologue
    .line 178
    neg-float v0, p1

    invoke-static {p0, v0, p2, p3}, Lorg/anddev/andengine/util/MathUtils;->rotateAroundCenter([FFFF)[F

    move-result-object v0

    return-object v0
.end method

.method public static revertScaleAroundCenter([FFFFF)[F
    .locals 2
    .parameter "pVertices"
    .parameter "pScaleX"
    .parameter "pScaleY"
    .parameter "pScaleCenterX"
    .parameter "pScaleCenterY"

    .prologue
    const/high16 v1, 0x3f80

    .line 174
    div-float v0, v1, p1

    div-float/2addr v1, p2

    invoke-static {p0, v0, v1, p3, p4}, Lorg/anddev/andengine/util/MathUtils;->scaleAroundCenter([FFFFF)[F

    move-result-object v0

    return-object v0
.end method

.method public static rotateAndScaleAroundCenter([FFFFFFFF)[F
    .locals 1
    .parameter "pVertices"
    .parameter "pRotation"
    .parameter "pRotationCenterX"
    .parameter "pRotationCenterY"
    .parameter "pScaleX"
    .parameter "pScaleY"
    .parameter "pScaleCenterX"
    .parameter "pScaleCenterY"

    .prologue
    .line 169
    invoke-static {p0, p1, p2, p3}, Lorg/anddev/andengine/util/MathUtils;->rotateAroundCenter([FFFF)[F

    .line 170
    invoke-static {p0, p4, p5, p6, p7}, Lorg/anddev/andengine/util/MathUtils;->scaleAroundCenter([FFFFF)[F

    move-result-object v0

    return-object v0
.end method

.method public static rotateAroundCenter([FFFF)[F
    .locals 9
    .parameter "pVertices"
    .parameter "pRotation"
    .parameter "pRotationCenterX"
    .parameter "pRotationCenterY"

    .prologue
    .line 142
    const/4 v6, 0x0

    cmpl-float v6, p1, v6

    if-eqz v6, :cond_0

    .line 143
    invoke-static {p1}, Lorg/anddev/andengine/util/MathUtils;->degToRad(F)F

    move-result v4

    .line 144
    .local v4, rotationRad:F
    invoke-static {v4}, Landroid/util/FloatMath;->sin(F)F

    move-result v5

    .line 145
    .local v5, sinRotationRad:F
    invoke-static {v4}, Landroid/util/FloatMath;->cos(F)F

    move-result v0

    .line 147
    .local v0, cosRotationInRad:F
    array-length v6, p0

    add-int/lit8 v1, v6, -0x2

    .local v1, i:I
    :goto_0
    if-gez v1, :cond_1

    .line 154
    .end local v0           #cosRotationInRad:F
    .end local v1           #i:I
    .end local v4           #rotationRad:F
    .end local v5           #sinRotationRad:F
    :cond_0
    return-object p0

    .line 148
    .restart local v0       #cosRotationInRad:F
    .restart local v1       #i:I
    .restart local v4       #rotationRad:F
    .restart local v5       #sinRotationRad:F
    :cond_1
    aget v2, p0, v1

    .line 149
    .local v2, pX:F
    add-int/lit8 v6, v1, 0x1

    aget v3, p0, v6

    .line 150
    .local v3, pY:F
    sub-float v6, v2, p2

    mul-float/2addr v6, v0

    sub-float v7, v3, p3

    mul-float/2addr v7, v5

    sub-float/2addr v6, v7

    add-float/2addr v6, p2

    aput v6, p0, v1

    .line 151
    add-int/lit8 v6, v1, 0x1

    sub-float v7, v2, p2

    mul-float/2addr v7, v5

    sub-float v8, v3, p3

    mul-float/2addr v8, v0

    add-float/2addr v7, v8

    add-float/2addr v7, p3

    aput v7, p0, v6

    .line 147
    add-int/lit8 v1, v1, -0x2

    goto :goto_0
.end method

.method public static scaleAroundCenter([FFFFF)[F
    .locals 3
    .parameter "pVertices"
    .parameter "pScaleX"
    .parameter "pScaleY"
    .parameter "pScaleCenterX"
    .parameter "pScaleCenterY"

    .prologue
    const/high16 v2, 0x3f80

    .line 158
    cmpl-float v1, p1, v2

    if-nez v1, :cond_0

    cmpl-float v1, p2, v2

    if-eqz v1, :cond_1

    .line 159
    :cond_0
    array-length v1, p0

    add-int/lit8 v0, v1, -0x2

    .local v0, i:I
    :goto_0
    if-gez v0, :cond_2

    .line 165
    .end local v0           #i:I
    :cond_1
    return-object p0

    .line 160
    .restart local v0       #i:I
    :cond_2
    aget v1, p0, v0

    sub-float/2addr v1, p3

    mul-float/2addr v1, p1

    add-float/2addr v1, p3

    aput v1, p0, v0

    .line 161
    add-int/lit8 v1, v0, 0x1

    add-int/lit8 v2, v0, 0x1

    aget v2, p0, v2

    sub-float/2addr v2, p4

    mul-float/2addr v2, p2

    add-float/2addr v2, p4

    aput v2, p0, v1

    .line 159
    add-int/lit8 v0, v0, -0x2

    goto :goto_0
.end method

.method public static final sum([I)I
    .locals 3
    .parameter "pValues"

    .prologue
    .line 90
    const/4 v1, 0x0

    .line 91
    .local v1, sum:I
    array-length v2, p0

    add-int/lit8 v0, v2, -0x1

    .local v0, i:I
    :goto_0
    if-gez v0, :cond_0

    .line 95
    return v1

    .line 92
    :cond_0
    aget v2, p0, v0

    add-int/2addr v1, v2

    .line 91
    add-int/lit8 v0, v0, -0x1

    goto :goto_0
.end method


# virtual methods
.method public distance(FFFF)F
    .locals 4
    .parameter "pX1"
    .parameter "pY1"
    .parameter "pX2"
    .parameter "pY2"

    .prologue
    .line 195
    sub-float v0, p3, p1

    .line 196
    .local v0, dX:F
    sub-float v1, p4, p2

    .line 197
    .local v1, dY:F
    mul-float v2, v0, v0

    mul-float v3, v1, v1

    add-float/2addr v2, v3

    invoke-static {v2}, Landroid/util/FloatMath;->sqrt(F)F

    move-result v2

    return v2
.end method
