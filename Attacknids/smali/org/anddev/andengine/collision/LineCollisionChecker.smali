.class public Lorg/anddev/andengine/collision/LineCollisionChecker;
.super Lorg/anddev/andengine/collision/ShapeCollisionChecker;
.source "LineCollisionChecker.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Lorg/anddev/andengine/collision/ShapeCollisionChecker;-><init>()V

    return-void
.end method

.method public static checkLineCollision(FFFFFFFF)Z
    .locals 7
    .parameter "pX1"
    .parameter "pY1"
    .parameter "pX2"
    .parameter "pY2"
    .parameter "pX3"
    .parameter "pY3"
    .parameter "pX4"
    .parameter "pY4"

    .prologue
    .line 33
    invoke-static/range {p0 .. p5}, Lorg/anddev/andengine/collision/LineCollisionChecker;->relativeCCW(FFFFFF)I

    move-result v6

    move v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p6

    move v5, p7

    invoke-static/range {v0 .. v5}, Lorg/anddev/andengine/collision/LineCollisionChecker;->relativeCCW(FFFFFF)I

    move-result v0

    mul-int/2addr v0, v6

    if-gtz v0, :cond_0

    move v0, p4

    move v1, p5

    move v2, p6

    move v3, p7

    move v4, p0

    move v5, p1

    .line 34
    invoke-static/range {v0 .. v5}, Lorg/anddev/andengine/collision/LineCollisionChecker;->relativeCCW(FFFFFF)I

    move-result v6

    move v0, p4

    move v1, p5

    move v2, p6

    move v3, p7

    move v4, p2

    move v5, p3

    invoke-static/range {v0 .. v5}, Lorg/anddev/andengine/collision/LineCollisionChecker;->relativeCCW(FFFFFF)I

    move-result v0

    mul-int/2addr v0, v6

    .line 33
    if-gtz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
