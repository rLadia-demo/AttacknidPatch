.class public Lorg/anddev/andengine/collision/RectangularShapeCollisionChecker;
.super Lorg/anddev/andengine/collision/ShapeCollisionChecker;
.source "RectangularShapeCollisionChecker.java"


# static fields
.field private static final RECTANGULARSHAPE_VERTEX_COUNT:I = 0x4

.field private static final VERTICES_COLLISION_TMP_A:[F

.field private static final VERTICES_COLLISION_TMP_B:[F

.field private static final VERTICES_CONTAINS_TMP:[F


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/16 v1, 0x8

    .line 20
    new-array v0, v1, [F

    sput-object v0, Lorg/anddev/andengine/collision/RectangularShapeCollisionChecker;->VERTICES_CONTAINS_TMP:[F

    .line 21
    new-array v0, v1, [F

    sput-object v0, Lorg/anddev/andengine/collision/RectangularShapeCollisionChecker;->VERTICES_COLLISION_TMP_A:[F

    .line 22
    new-array v0, v1, [F

    sput-object v0, Lorg/anddev/andengine/collision/RectangularShapeCollisionChecker;->VERTICES_COLLISION_TMP_B:[F

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Lorg/anddev/andengine/collision/ShapeCollisionChecker;-><init>()V

    return-void
.end method

.method public static checkCollision(Lorg/anddev/andengine/entity/shape/RectangularShape;Lorg/anddev/andengine/entity/shape/RectangularShape;)Z
    .locals 8
    .parameter "pRectangularShapeA"
    .parameter "pRectangularShapeB"

    .prologue
    const/16 v6, 0x8

    const/4 v3, 0x0

    .line 50
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/RectangularShape;->getRotation()F

    move-result v2

    cmpl-float v2, v2, v3

    if-nez v2, :cond_0

    invoke-virtual {p1}, Lorg/anddev/andengine/entity/shape/RectangularShape;->getRotation()F

    move-result v2

    cmpl-float v2, v2, v3

    if-nez v2, :cond_0

    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/RectangularShape;->isScaled()Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {p1}, Lorg/anddev/andengine/entity/shape/RectangularShape;->isScaled()Z

    move-result v2

    if-nez v2, :cond_0

    .line 51
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/RectangularShape;->getX()F

    move-result v0

    .line 52
    .local v0, aLeft:F
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/RectangularShape;->getY()F

    move-result v1

    .line 53
    .local v1, aTop:F
    invoke-virtual {p1}, Lorg/anddev/andengine/entity/shape/RectangularShape;->getX()F

    move-result v4

    .line 54
    .local v4, bLeft:F
    invoke-virtual {p1}, Lorg/anddev/andengine/entity/shape/RectangularShape;->getY()F

    move-result v5

    .line 55
    .local v5, bTop:F
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/RectangularShape;->getWidth()F

    move-result v2

    add-float/2addr v2, v0

    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/RectangularShape;->getHeight()F

    move-result v3

    add-float/2addr v3, v1

    .line 56
    invoke-virtual {p1}, Lorg/anddev/andengine/entity/shape/RectangularShape;->getWidth()F

    move-result v6

    add-float/2addr v6, v4

    invoke-virtual {p1}, Lorg/anddev/andengine/entity/shape/RectangularShape;->getHeight()F

    move-result v7

    add-float/2addr v7, v5

    .line 55
    invoke-static/range {v0 .. v7}, Lorg/anddev/andengine/collision/BaseCollisionChecker;->checkAxisAlignedRectangleCollision(FFFFFFFF)Z

    move-result v2

    .line 61
    .end local v0           #aLeft:F
    .end local v1           #aTop:F
    .end local v4           #bLeft:F
    .end local v5           #bTop:F
    :goto_0
    return v2

    .line 58
    :cond_0
    sget-object v2, Lorg/anddev/andengine/collision/RectangularShapeCollisionChecker;->VERTICES_COLLISION_TMP_A:[F

    invoke-static {p0, v2}, Lorg/anddev/andengine/collision/RectangularShapeCollisionChecker;->fillVertices(Lorg/anddev/andengine/entity/shape/RectangularShape;[F)V

    .line 59
    sget-object v2, Lorg/anddev/andengine/collision/RectangularShapeCollisionChecker;->VERTICES_COLLISION_TMP_B:[F

    invoke-static {p1, v2}, Lorg/anddev/andengine/collision/RectangularShapeCollisionChecker;->fillVertices(Lorg/anddev/andengine/entity/shape/RectangularShape;[F)V

    .line 61
    sget-object v2, Lorg/anddev/andengine/collision/RectangularShapeCollisionChecker;->VERTICES_COLLISION_TMP_A:[F

    sget-object v3, Lorg/anddev/andengine/collision/RectangularShapeCollisionChecker;->VERTICES_COLLISION_TMP_B:[F

    invoke-static {v6, v6, v2, v3}, Lorg/anddev/andengine/collision/ShapeCollisionChecker;->checkCollision(II[F[F)Z

    move-result v2

    goto :goto_0
.end method

.method public static checkContains(Lorg/anddev/andengine/entity/shape/RectangularShape;FF)Z
    .locals 2
    .parameter "pRectangularShape"
    .parameter "pX"
    .parameter "pY"

    .prologue
    .line 45
    sget-object v0, Lorg/anddev/andengine/collision/RectangularShapeCollisionChecker;->VERTICES_CONTAINS_TMP:[F

    invoke-static {p0, v0}, Lorg/anddev/andengine/collision/RectangularShapeCollisionChecker;->fillVertices(Lorg/anddev/andengine/entity/shape/RectangularShape;[F)V

    .line 46
    sget-object v0, Lorg/anddev/andengine/collision/RectangularShapeCollisionChecker;->VERTICES_CONTAINS_TMP:[F

    const/16 v1, 0x8

    invoke-static {v0, v1, p1, p2}, Lorg/anddev/andengine/collision/ShapeCollisionChecker;->checkContains([FIFF)Z

    move-result v0

    return v0
.end method

.method public static fillVertices(Lorg/anddev/andengine/entity/shape/RectangularShape;[F)V
    .locals 12
    .parameter "pRectangularShape"
    .parameter "pVertices"

    .prologue
    .line 66
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/RectangularShape;->getX()F

    move-result v9

    .line 67
    .local v9, left:F
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/RectangularShape;->getY()F

    move-result v11

    .line 68
    .local v11, top:F
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/RectangularShape;->getWidth()F

    move-result v0

    add-float v10, v0, v9

    .line 69
    .local v10, right:F
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/RectangularShape;->getHeight()F

    move-result v0

    add-float v8, v0, v11

    .line 71
    .local v8, bottom:F
    const/4 v0, 0x0

    aput v9, p1, v0

    .line 72
    const/4 v0, 0x1

    aput v11, p1, v0

    .line 74
    const/4 v0, 0x2

    aput v10, p1, v0

    .line 75
    const/4 v0, 0x3

    aput v11, p1, v0

    .line 77
    const/4 v0, 0x4

    aput v10, p1, v0

    .line 78
    const/4 v0, 0x5

    aput v8, p1, v0

    .line 80
    const/4 v0, 0x6

    aput v9, p1, v0

    .line 81
    const/4 v0, 0x7

    aput v8, p1, v0

    .line 84
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/RectangularShape;->getRotation()F

    move-result v1

    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/RectangularShape;->getRotationCenterX()F

    move-result v0

    add-float v2, v9, v0

    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/RectangularShape;->getRotationCenterY()F

    move-result v0

    add-float v3, v11, v0

    .line 85
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/RectangularShape;->getScaleX()F

    move-result v4

    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/RectangularShape;->getScaleY()F

    move-result v5

    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/RectangularShape;->getScaleCenterX()F

    move-result v0

    add-float v6, v9, v0

    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/RectangularShape;->getScaleCenterY()F

    move-result v0

    add-float v7, v11, v0

    move-object v0, p1

    .line 83
    invoke-static/range {v0 .. v7}, Lorg/anddev/andengine/util/MathUtils;->rotateAndScaleAroundCenter([FFFFFFFF)[F

    .line 86
    return-void
.end method
