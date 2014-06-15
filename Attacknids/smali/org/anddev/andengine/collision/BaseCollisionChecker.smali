.class public Lorg/anddev/andengine/collision/BaseCollisionChecker;
.super Ljava/lang/Object;
.source "BaseCollisionChecker.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static checkAxisAlignedRectangleCollision(FFFFFFFF)Z
    .locals 1
    .parameter "pLeftA"
    .parameter "pTopA"
    .parameter "pRightA"
    .parameter "pBottomA"
    .parameter "pLeftB"
    .parameter "pTopB"
    .parameter "pRightB"
    .parameter "pBottomB"

    .prologue
    .line 33
    cmpg-float v0, p0, p6

    if-gez v0, :cond_0

    .line 34
    cmpg-float v0, p4, p2

    if-gez v0, :cond_0

    .line 35
    cmpg-float v0, p1, p7

    if-gez v0, :cond_0

    .line 33
    cmpg-float v0, p5, p3

    if-gez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static relativeCCW(FFFFFF)I
    .locals 4
    .parameter "pX1"
    .parameter "pY1"
    .parameter "pX2"
    .parameter "pY2"
    .parameter "pPX"
    .parameter "pPY"

    .prologue
    const/4 v3, 0x0

    .line 77
    sub-float/2addr p2, p0

    .line 78
    sub-float/2addr p3, p1

    .line 79
    sub-float/2addr p4, p0

    .line 80
    sub-float/2addr p5, p1

    .line 81
    mul-float v1, p4, p3

    mul-float v2, p5, p2

    sub-float v0, v1, v2

    .line 82
    .local v0, ccw:F
    cmpl-float v1, v0, v3

    if-nez v1, :cond_0

    .line 89
    mul-float v1, p4, p2

    mul-float v2, p5, p3

    add-float v0, v1, v2

    .line 90
    cmpl-float v1, v0, v3

    if-lez v1, :cond_0

    .line 98
    sub-float/2addr p4, p2

    .line 99
    sub-float/2addr p5, p3

    .line 100
    mul-float v1, p4, p2

    mul-float v2, p5, p3

    add-float v0, v1, v2

    .line 101
    cmpg-float v1, v0, v3

    if-gez v1, :cond_0

    .line 102
    const/4 v0, 0x0

    .line 106
    :cond_0
    cmpg-float v1, v0, v3

    if-gez v1, :cond_1

    const/4 v1, -0x1

    :goto_0
    return v1

    :cond_1
    cmpl-float v1, v0, v3

    if-lez v1, :cond_2

    const/4 v1, 0x1

    goto :goto_0

    :cond_2
    const/4 v1, 0x0

    goto :goto_0
.end method
