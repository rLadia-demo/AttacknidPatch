.class public Lorg/anddev/andengine/collision/ShapeCollisionChecker;
.super Lorg/anddev/andengine/collision/BaseCollisionChecker;
.source "ShapeCollisionChecker.java"


# static fields
.field private static final VERTICES_LOCAL_TO_SCENE_TMP:[F

.field private static final VERTICES_SCENE_TO_LOCAL_TMP:[F


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x2

    .line 19
    new-array v0, v1, [F

    sput-object v0, Lorg/anddev/andengine/collision/ShapeCollisionChecker;->VERTICES_SCENE_TO_LOCAL_TMP:[F

    .line 20
    new-array v0, v1, [F

    sput-object v0, Lorg/anddev/andengine/collision/ShapeCollisionChecker;->VERTICES_LOCAL_TO_SCENE_TMP:[F

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Lorg/anddev/andengine/collision/BaseCollisionChecker;-><init>()V

    return-void
.end method

.method public static checkCollision(II[F[F)Z
    .locals 5
    .parameter "pVerticesALength"
    .parameter "pVerticesBLength"
    .parameter "pVerticesA"
    .parameter "pVerticesB"

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 70
    add-int/lit8 v0, p0, -0x4

    .local v0, a:I
    :goto_0
    if-gez v0, :cond_1

    .line 77
    add-int/lit8 v3, p0, -0x2

    invoke-static {v3, v2, p2, p3, p1}, Lorg/anddev/andengine/collision/ShapeCollisionChecker;->checkCollisionSub(II[F[FI)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 87
    :cond_0
    :goto_1
    return v1

    .line 72
    :cond_1
    add-int/lit8 v3, v0, 0x2

    invoke-static {v0, v3, p2, p3, p1}, Lorg/anddev/andengine/collision/ShapeCollisionChecker;->checkCollisionSub(II[F[FI)Z

    move-result v3

    if-nez v3, :cond_0

    .line 70
    add-int/lit8 v0, v0, -0x2

    goto :goto_0

    .line 82
    :cond_2
    aget v3, p3, v2

    aget v4, p3, v1

    invoke-static {p2, p0, v3, v4}, Lorg/anddev/andengine/collision/ShapeCollisionChecker;->checkContains([FIFF)Z

    move-result v3

    if-nez v3, :cond_0

    .line 84
    aget v3, p2, v2

    aget v4, p2, v1

    invoke-static {p3, p1, v3, v4}, Lorg/anddev/andengine/collision/ShapeCollisionChecker;->checkContains([FIFF)Z

    move-result v3

    if-nez v3, :cond_0

    move v1, v2

    .line 87
    goto :goto_1
.end method

.method private static checkCollisionSub(II[F[FI)Z
    .locals 11
    .parameter "pVertexIndexA1"
    .parameter "pVertexIndexA2"
    .parameter "pVerticesA"
    .parameter "pVerticesB"
    .parameter "pVerticesBLength"

    .prologue
    const/4 v10, 0x0

    const/4 v9, 0x1

    .line 97
    add-int/lit8 v4, p0, 0x0

    aget v0, p2, v4

    .line 98
    .local v0, vertexA1X:F
    add-int/lit8 v4, p0, 0x1

    aget v1, p2, v4

    .line 99
    .local v1, vertexA1Y:F
    add-int/lit8 v4, p1, 0x0

    aget v2, p2, v4

    .line 100
    .local v2, vertexA2X:F
    add-int/lit8 v4, p1, 0x1

    aget v3, p2, v4

    .line 102
    .local v3, vertexA2Y:F
    add-int/lit8 v8, p4, -0x4

    .local v8, b:I
    :goto_0
    if-gez v8, :cond_0

    .line 108
    add-int/lit8 v4, p4, -0x2

    aget v4, p3, v4

    add-int/lit8 v5, p4, -0x1

    aget v5, p3, v5

    aget v6, p3, v10

    aget v7, p3, v9

    invoke-static/range {v0 .. v7}, Lorg/anddev/andengine/collision/LineCollisionChecker;->checkLineCollision(FFFFFFFF)Z

    move-result v4

    if-eqz v4, :cond_2

    move v4, v9

    .line 111
    :goto_1
    return v4

    .line 103
    :cond_0
    add-int/lit8 v4, v8, 0x0

    aget v4, p3, v4

    add-int/lit8 v5, v8, 0x1

    aget v5, p3, v5

    add-int/lit8 v6, v8, 0x2

    add-int/lit8 v6, v6, 0x0

    aget v6, p3, v6

    add-int/lit8 v7, v8, 0x2

    add-int/lit8 v7, v7, 0x1

    aget v7, p3, v7

    invoke-static/range {v0 .. v7}, Lorg/anddev/andengine/collision/LineCollisionChecker;->checkLineCollision(FFFFFFFF)Z

    move-result v4

    if-eqz v4, :cond_1

    move v4, v9

    .line 104
    goto :goto_1

    .line 102
    :cond_1
    add-int/lit8 v8, v8, -0x2

    goto :goto_0

    :cond_2
    move v4, v10

    .line 111
    goto :goto_1
.end method

.method public static checkContains([FIFF)Z
    .locals 12
    .parameter "pVertices"
    .parameter "pVerticesLength"
    .parameter "pX"
    .parameter "pY"

    .prologue
    const/4 v11, 0x0

    const/4 v10, 0x1

    .line 117
    const/4 v7, 0x0

    .line 119
    .local v7, edgeResultSum:I
    add-int/lit8 v8, p1, -0x4

    .local v8, i:I
    :goto_0
    if-gez v8, :cond_0

    .line 128
    add-int/lit8 v0, p1, -0x2

    aget v0, p0, v0

    add-int/lit8 v1, p1, -0x1

    aget v1, p0, v1

    aget v2, p0, v11

    aget v3, p0, v10

    move v4, p2

    move v5, p3

    invoke-static/range {v0 .. v5}, Lorg/anddev/andengine/collision/ShapeCollisionChecker;->relativeCCW(FFFFFF)I

    move-result v6

    .line 129
    .local v6, edgeResult:I
    if-nez v6, :cond_2

    move v0, v10

    .line 137
    :goto_1
    return v0

    .line 120
    .end local v6           #edgeResult:I
    :cond_0
    aget v0, p0, v8

    add-int/lit8 v1, v8, 0x1

    aget v1, p0, v1

    add-int/lit8 v2, v8, 0x2

    aget v2, p0, v2

    add-int/lit8 v3, v8, 0x3

    aget v3, p0, v3

    move v4, p2

    move v5, p3

    invoke-static/range {v0 .. v5}, Lorg/anddev/andengine/collision/ShapeCollisionChecker;->relativeCCW(FFFFFF)I

    move-result v6

    .line 121
    .restart local v6       #edgeResult:I
    if-nez v6, :cond_1

    move v0, v10

    .line 122
    goto :goto_1

    .line 124
    :cond_1
    add-int/2addr v7, v6

    .line 119
    add-int/lit8 v8, v8, -0x2

    goto :goto_0

    .line 132
    :cond_2
    add-int/2addr v7, v6

    .line 135
    div-int/lit8 v9, p1, 0x2

    .line 137
    .local v9, vertexCount:I
    if-eq v7, v9, :cond_3

    neg-int v0, v9

    if-eq v7, v0, :cond_3

    move v0, v11

    goto :goto_1

    :cond_3
    move v0, v10

    goto :goto_1
.end method

.method public static convertLocalToSceneCoordinates(Lorg/anddev/andengine/entity/shape/Shape;FF)[F
    .locals 8
    .parameter "pShape"
    .parameter "pX"
    .parameter "pY"

    .prologue
    .line 58
    sget-object v0, Lorg/anddev/andengine/collision/ShapeCollisionChecker;->VERTICES_LOCAL_TO_SCENE_TMP:[F

    const/4 v1, 0x0

    aput p1, v0, v1

    .line 59
    sget-object v0, Lorg/anddev/andengine/collision/ShapeCollisionChecker;->VERTICES_LOCAL_TO_SCENE_TMP:[F

    const/4 v1, 0x1

    aput p2, v0, v1

    .line 61
    sget-object v0, Lorg/anddev/andengine/collision/ShapeCollisionChecker;->VERTICES_LOCAL_TO_SCENE_TMP:[F

    .line 62
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/Shape;->getRotation()F

    move-result v1

    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/Shape;->getRotationCenterX()F

    move-result v2

    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/Shape;->getRotationCenterY()F

    move-result v3

    .line 63
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/Shape;->getScaleX()F

    move-result v4

    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/Shape;->getScaleY()F

    move-result v5

    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/Shape;->getScaleCenterX()F

    move-result v6

    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/Shape;->getScaleCenterY()F

    move-result v7

    .line 61
    invoke-static/range {v0 .. v7}, Lorg/anddev/andengine/util/MathUtils;->rotateAndScaleAroundCenter([FFFFFFFF)[F

    .line 65
    sget-object v0, Lorg/anddev/andengine/collision/ShapeCollisionChecker;->VERTICES_LOCAL_TO_SCENE_TMP:[F

    return-object v0
.end method

.method public static convertSceneToLocalCoordinates(Lorg/anddev/andengine/entity/shape/Shape;FF)[F
    .locals 10
    .parameter "pShape"
    .parameter "pX"
    .parameter "pY"

    .prologue
    .line 43
    sget-object v0, Lorg/anddev/andengine/collision/ShapeCollisionChecker;->VERTICES_SCENE_TO_LOCAL_TMP:[F

    const/4 v1, 0x0

    aput p1, v0, v1

    .line 44
    sget-object v0, Lorg/anddev/andengine/collision/ShapeCollisionChecker;->VERTICES_SCENE_TO_LOCAL_TMP:[F

    const/4 v1, 0x1

    aput p2, v0, v1

    .line 46
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/Shape;->getX()F

    move-result v8

    .line 47
    .local v8, left:F
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/Shape;->getY()F

    move-result v9

    .line 49
    .local v9, top:F
    sget-object v0, Lorg/anddev/andengine/collision/ShapeCollisionChecker;->VERTICES_SCENE_TO_LOCAL_TMP:[F

    .line 50
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/Shape;->getRotation()F

    move-result v1

    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/Shape;->getRotationCenterX()F

    move-result v2

    add-float/2addr v2, v8

    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/Shape;->getRotationCenterY()F

    move-result v3

    add-float/2addr v3, v9

    .line 51
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/Shape;->getScaleX()F

    move-result v4

    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/Shape;->getScaleY()F

    move-result v5

    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/Shape;->getScaleCenterX()F

    move-result v6

    add-float/2addr v6, v8

    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/Shape;->getScaleCenterY()F

    move-result v7

    add-float/2addr v7, v9

    .line 49
    invoke-static/range {v0 .. v7}, Lorg/anddev/andengine/util/MathUtils;->revertRotateAndScaleAroundCenter([FFFFFFFF)[F

    .line 53
    sget-object v0, Lorg/anddev/andengine/collision/ShapeCollisionChecker;->VERTICES_SCENE_TO_LOCAL_TMP:[F

    return-object v0
.end method
