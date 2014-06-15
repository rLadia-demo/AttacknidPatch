.class Lorg/anddev/andengine/extension/physics/box2d/util/hull/Vector2Util;
.super Ljava/lang/Object;
.source "Vector2Util.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static area2(Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/math/Vector2;)F
    .locals 4
    .parameter "pVertexTest"
    .parameter "pVertexA"
    .parameter "pVertexB"

    .prologue
    .line 53
    iget v0, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget v1, p0, Lcom/badlogic/gdx/math/Vector2;->x:F

    sub-float/2addr v0, v1

    iget v1, p2, Lcom/badlogic/gdx/math/Vector2;->y:F

    iget v2, p0, Lcom/badlogic/gdx/math/Vector2;->y:F

    sub-float/2addr v1, v2

    mul-float/2addr v0, v1

    iget v1, p2, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget v2, p0, Lcom/badlogic/gdx/math/Vector2;->x:F

    sub-float/2addr v1, v2

    iget v2, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    iget v3, p0, Lcom/badlogic/gdx/math/Vector2;->y:F

    sub-float/2addr v2, v3

    mul-float/2addr v1, v2

    sub-float/2addr v0, v1

    return v0
.end method

.method public static area2(Lcom/badlogic/gdx/math/Vector2;Lorg/anddev/andengine/extension/physics/box2d/util/hull/Vector2Line;)F
    .locals 2
    .parameter "pVertexTest"
    .parameter "pLine"

    .prologue
    .line 57
    iget-object v0, p1, Lorg/anddev/andengine/extension/physics/box2d/util/hull/Vector2Line;->mVertexA:Lcom/badlogic/gdx/math/Vector2;

    iget-object v1, p1, Lorg/anddev/andengine/extension/physics/box2d/util/hull/Vector2Line;->mVertexB:Lcom/badlogic/gdx/math/Vector2;

    invoke-static {p0, v0, v1}, Lorg/anddev/andengine/extension/physics/box2d/util/hull/Vector2Util;->area2(Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/math/Vector2;)F

    move-result v0

    return v0
.end method

.method public static getManhattanDistance(Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/math/Vector2;)F
    .locals 3
    .parameter "pVertexA"
    .parameter "pVertexB"

    .prologue
    .line 44
    iget v0, p0, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget v1, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    sub-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    iget v1, p0, Lcom/badlogic/gdx/math/Vector2;->y:F

    iget v2, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    sub-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    add-float/2addr v0, v1

    return v0
.end method

.method public static isBetween(Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/math/Vector2;)Z
    .locals 3
    .parameter "pVertexTest"
    .parameter "pVertexA"
    .parameter "pVertexB"

    .prologue
    .line 61
    invoke-static {p1, p2}, Lorg/anddev/andengine/extension/physics/box2d/util/hull/Vector2Util;->getManhattanDistance(Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/math/Vector2;)F

    move-result v0

    invoke-static {p0, p1}, Lorg/anddev/andengine/extension/physics/box2d/util/hull/Vector2Util;->getManhattanDistance(Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/math/Vector2;)F

    move-result v1

    invoke-static {p0, p2}, Lorg/anddev/andengine/extension/physics/box2d/util/hull/Vector2Util;->getManhattanDistance(Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/math/Vector2;)F

    move-result v2

    add-float/2addr v1, v2

    cmpl-float v0, v0, v1

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isConvex(Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/math/Vector2;)Z
    .locals 3
    .parameter "pVertexTest"
    .parameter "pVertexA"
    .parameter "pVertexB"

    .prologue
    const/4 v2, 0x0

    .line 48
    invoke-static {p0, p1, p2}, Lorg/anddev/andengine/extension/physics/box2d/util/hull/Vector2Util;->area2(Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/math/Vector2;)F

    move-result v0

    .line 49
    .local v0, f:F
    cmpg-float v1, v0, v2

    if-ltz v1, :cond_1

    cmpl-float v1, v0, v2

    if-nez v1, :cond_0

    invoke-static {p0, p1, p2}, Lorg/anddev/andengine/extension/physics/box2d/util/hull/Vector2Util;->isBetween(Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/math/Vector2;)Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public static isLess(Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/math/Vector2;)Z
    .locals 3
    .parameter "pVertexA"
    .parameter "pVertexB"

    .prologue
    const/4 v2, 0x0

    .line 35
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Vector2;->cross(Lcom/badlogic/gdx/math/Vector2;)F

    move-result v0

    .line 36
    .local v0, f:F
    cmpl-float v1, v0, v2

    if-gtz v1, :cond_1

    cmpl-float v1, v0, v2

    if-nez v1, :cond_0

    invoke-static {p0, p1}, Lorg/anddev/andengine/extension/physics/box2d/util/hull/Vector2Util;->isLonger(Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/math/Vector2;)Z

    move-result v1

    if-nez v1, :cond_1

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public static isLonger(Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/math/Vector2;)Z
    .locals 2
    .parameter "pVertexA"
    .parameter "pVertexB"

    .prologue
    .line 40
    invoke-virtual {p0}, Lcom/badlogic/gdx/math/Vector2;->lenManhattan()F

    move-result v0

    invoke-virtual {p1}, Lcom/badlogic/gdx/math/Vector2;->lenManhattan()F

    move-result v1

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isRightOf(Lcom/badlogic/gdx/math/Vector2;Lorg/anddev/andengine/extension/physics/box2d/util/hull/Vector2Line;)Z
    .locals 2
    .parameter "pVertexTest"
    .parameter "pLine"

    .prologue
    .line 65
    invoke-static {p0, p1}, Lorg/anddev/andengine/extension/physics/box2d/util/hull/Vector2Util;->area2(Lcom/badlogic/gdx/math/Vector2;Lorg/anddev/andengine/extension/physics/box2d/util/hull/Vector2Line;)F

    move-result v0

    const/4 v1, 0x0

    cmpg-float v0, v0, v1

    if-gez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
