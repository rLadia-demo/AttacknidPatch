.class public Lorg/anddev/andengine/entity/shape/util/ShapeUtils;
.super Ljava/lang/Object;
.source "ShapeUtils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accelerateRespectingRotation(Lorg/anddev/andengine/entity/shape/IShape;FF)V
    .locals 8
    .parameter "pShape"
    .parameter "pAccelerationX"
    .parameter "pAccelerationY"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 55
    invoke-interface {p1}, Lorg/anddev/andengine/entity/shape/IShape;->getRotation()F

    move-result v3

    .line 56
    .local v3, rotation:F
    invoke-static {v3}, Lorg/anddev/andengine/util/MathUtils;->degToRad(F)F

    move-result v4

    .line 58
    .local v4, rotationRad:F
    invoke-static {v4}, Landroid/util/FloatMath;->sin(F)F

    move-result v5

    .line 59
    .local v5, sin:F
    invoke-static {v4}, Landroid/util/FloatMath;->cos(F)F

    move-result v2

    .line 61
    .local v2, cos:F
    neg-float v6, p3

    mul-float/2addr v6, v5

    mul-float v7, v2, p2

    add-float v0, v6, v7

    .line 62
    .local v0, accelerationX:F
    mul-float v6, v2, p3

    mul-float v7, v5, p2

    add-float v1, v6, v7

    .line 64
    .local v1, accelerationY:F
    invoke-interface {p1, v0, v1}, Lorg/anddev/andengine/entity/shape/IShape;->setAcceleration(FF)V

    .line 65
    return-void
.end method

.method public setVelocityRespectingRotation(Lorg/anddev/andengine/entity/shape/IShape;FF)V
    .locals 8
    .parameter "pShape"
    .parameter "pVelocityX"
    .parameter "pVelocityY"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 38
    invoke-interface {p1}, Lorg/anddev/andengine/entity/shape/IShape;->getRotation()F

    move-result v1

    .line 39
    .local v1, rotation:F
    invoke-static {v1}, Lorg/anddev/andengine/util/MathUtils;->degToRad(F)F

    move-result v2

    .line 41
    .local v2, rotationRad:F
    invoke-static {v2}, Landroid/util/FloatMath;->sin(F)F

    move-result v3

    .line 42
    .local v3, sin:F
    invoke-static {v2}, Landroid/util/FloatMath;->cos(F)F

    move-result v0

    .line 44
    .local v0, cos:F
    neg-float v6, p3

    mul-float/2addr v6, v3

    mul-float v7, v0, p2

    add-float v4, v6, v7

    .line 45
    .local v4, velocityX:F
    mul-float v6, v0, p3

    mul-float v7, v3, p2

    add-float v5, v6, v7

    .line 47
    .local v5, velocityY:F
    invoke-interface {p1, v4, v5}, Lorg/anddev/andengine/entity/shape/IShape;->setVelocity(FF)V

    .line 48
    return-void
.end method
