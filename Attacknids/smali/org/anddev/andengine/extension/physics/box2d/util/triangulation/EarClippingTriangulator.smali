.class public final Lorg/anddev/andengine/extension/physics/box2d/util/triangulation/EarClippingTriangulator;
.super Ljava/lang/Object;
.source "EarClippingTriangulator.java"

# interfaces
.implements Lorg/anddev/andengine/extension/physics/box2d/util/triangulation/ITriangulationAlgoritm;


# static fields
.field private static final CONCAVE:I = 0x1

.field private static final CONVEX:I = -0x1


# instance fields
.field private mConcaveVertexCount:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static areVerticesClockwise(Ljava/util/ArrayList;)Z
    .locals 8
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/badlogic/gdx/math/Vector2;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 92
    .local p0, pVertices:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/badlogic/gdx/math/Vector2;>;"
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v4

    .line 94
    .local v4, vertexCount:I
    const/4 v0, 0x0

    .line 95
    .local v0, area:F
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-lt v1, v4, :cond_0

    .line 101
    const/4 v5, 0x0

    cmpg-float v5, v0, v5

    if-gez v5, :cond_1

    .line 102
    const/4 v5, 0x1

    .line 104
    :goto_1
    return v5

    .line 96
    :cond_0
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/math/Vector2;

    .line 97
    .local v2, p1:Lcom/badlogic/gdx/math/Vector2;
    invoke-static {p0, v1}, Lorg/anddev/andengine/extension/physics/box2d/util/triangulation/EarClippingTriangulator;->computeNextIndex(Ljava/util/List;I)I

    move-result v5

    invoke-virtual {p0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/badlogic/gdx/math/Vector2;

    .line 98
    .local v3, p2:Lcom/badlogic/gdx/math/Vector2;
    iget v5, v2, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget v6, v3, Lcom/badlogic/gdx/math/Vector2;->y:F

    mul-float/2addr v5, v6

    iget v6, v3, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget v7, v2, Lcom/badlogic/gdx/math/Vector2;->y:F

    mul-float/2addr v6, v7

    sub-float/2addr v5, v6

    add-float/2addr v0, v5

    .line 95
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 104
    .end local v2           #p1:Lcom/badlogic/gdx/math/Vector2;
    .end local v3           #p2:Lcom/badlogic/gdx/math/Vector2;
    :cond_1
    const/4 v5, 0x0

    goto :goto_1
.end method

.method private classifyVertices(Ljava/util/ArrayList;)[I
    .locals 14
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/badlogic/gdx/math/Vector2;",
            ">;)[I"
        }
    .end annotation

    .prologue
    .line 114
    .local p1, pVertices:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/badlogic/gdx/math/Vector2;>;"
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v12

    .line 116
    .local v12, vertexCount:I
    new-array v13, v12, [I

    .line 117
    .local v13, vertexTypes:[I
    const/4 v0, 0x0

    iput v0, p0, Lorg/anddev/andengine/extension/physics/box2d/util/triangulation/EarClippingTriangulator;->mConcaveVertexCount:I

    .line 120
    invoke-static {p1}, Lorg/anddev/andengine/extension/physics/box2d/util/triangulation/EarClippingTriangulator;->areVerticesClockwise(Ljava/util/ArrayList;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 121
    invoke-static {p1}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    .line 124
    :cond_0
    const/4 v7, 0x0

    .local v7, index:I
    :goto_0
    if-lt v7, v12, :cond_1

    .line 140
    return-object v13

    .line 125
    :cond_1
    invoke-static {p1, v7}, Lorg/anddev/andengine/extension/physics/box2d/util/triangulation/EarClippingTriangulator;->computePreviousIndex(Ljava/util/List;I)I

    move-result v10

    .line 126
    .local v10, previousIndex:I
    invoke-static {p1, v7}, Lorg/anddev/andengine/extension/physics/box2d/util/triangulation/EarClippingTriangulator;->computeNextIndex(Ljava/util/List;I)I

    move-result v8

    .line 128
    .local v8, nextIndex:I
    invoke-virtual {p1, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/badlogic/gdx/math/Vector2;

    .line 129
    .local v11, previousVertex:Lcom/badlogic/gdx/math/Vector2;
    invoke-virtual {p1, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/badlogic/gdx/math/Vector2;

    .line 130
    .local v6, currentVertex:Lcom/badlogic/gdx/math/Vector2;
    invoke-virtual {p1, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/badlogic/gdx/math/Vector2;

    .line 132
    .local v9, nextVertex:Lcom/badlogic/gdx/math/Vector2;
    iget v0, v11, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget v1, v11, Lcom/badlogic/gdx/math/Vector2;->y:F

    iget v2, v6, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget v3, v6, Lcom/badlogic/gdx/math/Vector2;->y:F

    iget v4, v9, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget v5, v9, Lcom/badlogic/gdx/math/Vector2;->y:F

    invoke-static/range {v0 .. v5}, Lorg/anddev/andengine/extension/physics/box2d/util/triangulation/EarClippingTriangulator;->isTriangleConvex(FFFFFF)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 133
    const/4 v0, -0x1

    aput v0, v13, v7

    .line 124
    :goto_1
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 135
    :cond_2
    const/4 v0, 0x1

    aput v0, v13, v7

    .line 136
    iget v0, p0, Lorg/anddev/andengine/extension/physics/box2d/util/triangulation/EarClippingTriangulator;->mConcaveVertexCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/anddev/andengine/extension/physics/box2d/util/triangulation/EarClippingTriangulator;->mConcaveVertexCount:I

    goto :goto_1
.end method

.method private static computeNextIndex(Ljava/util/List;I)I
    .locals 1
    .parameter
    .parameter "pIndex"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/badlogic/gdx/math/Vector2;",
            ">;I)I"
        }
    .end annotation

    .prologue
    .line 267
    .local p0, pVertices:Ljava/util/List;,"Ljava/util/List<Lcom/badlogic/gdx/math/Vector2;>;"
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    if-ne p1, v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    add-int/lit8 v0, p1, 0x1

    goto :goto_0
.end method

.method private static computePreviousIndex(Ljava/util/List;I)I
    .locals 1
    .parameter
    .parameter "pIndex"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/badlogic/gdx/math/Vector2;",
            ">;I)I"
        }
    .end annotation

    .prologue
    .line 263
    .local p0, pVertices:Ljava/util/List;,"Ljava/util/List<Lcom/badlogic/gdx/math/Vector2;>;"
    if-nez p1, :cond_0

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_0
    return v0

    :cond_0
    add-int/lit8 v0, p1, -0x1

    goto :goto_0
.end method

.method private static computeSpannedAreaSign(FFFFFF)I
    .locals 2
    .parameter "pX1"
    .parameter "pY1"
    .parameter "pX2"
    .parameter "pY2"
    .parameter "pX3"
    .parameter "pY3"

    .prologue
    .line 152
    const/4 v0, 0x0

    .line 154
    .local v0, area:F
    sub-float v1, p5, p3

    mul-float/2addr v1, p0

    add-float/2addr v0, v1

    .line 155
    sub-float v1, p1, p5

    mul-float/2addr v1, p2

    add-float/2addr v0, v1

    .line 156
    sub-float v1, p3, p1

    mul-float/2addr v1, p4

    add-float/2addr v0, v1

    .line 158
    invoke-static {v0}, Ljava/lang/Math;->signum(F)F

    move-result v1

    float-to-int v1, v1

    return v1
.end method

.method private cutEarTip(Ljava/util/ArrayList;ILjava/util/ArrayList;)V
    .locals 4
    .parameter
    .parameter "pEarTipIndex"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/badlogic/gdx/math/Vector2;",
            ">;I",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/badlogic/gdx/math/Vector2;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 213
    .local p1, pVertices:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/badlogic/gdx/math/Vector2;>;"
    .local p3, pTriangles:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/badlogic/gdx/math/Vector2;>;"
    invoke-static {p1, p2}, Lorg/anddev/andengine/extension/physics/box2d/util/triangulation/EarClippingTriangulator;->computePreviousIndex(Ljava/util/List;I)I

    move-result v1

    .line 214
    .local v1, previousIndex:I
    invoke-static {p1, p2}, Lorg/anddev/andengine/extension/physics/box2d/util/triangulation/EarClippingTriangulator;->computeNextIndex(Ljava/util/List;I)I

    move-result v0

    .line 216
    .local v0, nextIndex:I
    invoke-static {p1, v1, p2, v0}, Lorg/anddev/andengine/extension/physics/box2d/util/triangulation/EarClippingTriangulator;->isCollinear(Ljava/util/ArrayList;III)Z

    move-result v2

    if-nez v2, :cond_0

    .line 217
    new-instance v3, Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v3, v2}, Lcom/badlogic/gdx/math/Vector2;-><init>(Lcom/badlogic/gdx/math/Vector2;)V

    invoke-virtual {p3, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 218
    new-instance v3, Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v3, v2}, Lcom/badlogic/gdx/math/Vector2;-><init>(Lcom/badlogic/gdx/math/Vector2;)V

    invoke-virtual {p3, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 219
    new-instance v3, Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v3, v2}, Lcom/badlogic/gdx/math/Vector2;-><init>(Lcom/badlogic/gdx/math/Vector2;)V

    invoke-virtual {p3, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 222
    :cond_0
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 223
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x3

    if-lt v2, v3, :cond_1

    .line 224
    invoke-static {p1, p2}, Lorg/anddev/andengine/extension/physics/box2d/util/triangulation/EarClippingTriangulator;->removeCollinearNeighborEarsAfterRemovingEarTip(Ljava/util/ArrayList;I)V

    .line 226
    :cond_1
    return-void
.end method

.method private static isAnyVertexInTriangle(Ljava/util/ArrayList;[IFFFFFF)Z
    .locals 12
    .parameter
    .parameter "pVertexTypes"
    .parameter "pX1"
    .parameter "pY1"
    .parameter "pX2"
    .parameter "pY2"
    .parameter "pX3"
    .parameter "pY3"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/badlogic/gdx/math/Vector2;",
            ">;[IFFFFFF)Z"
        }
    .end annotation

    .prologue
    .line 165
    .local p0, pVertices:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/badlogic/gdx/math/Vector2;>;"
    const/4 v10, 0x0

    .line 167
    .local v10, i:I
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v11

    .line 168
    .local v11, vertexCount:I
    :goto_0
    add-int/lit8 v0, v11, -0x1

    if-lt v10, v0, :cond_0

    .line 193
    const/4 v0, 0x0

    :goto_1
    return v0

    .line 169
    :cond_0
    aget v0, p1, v10

    const/4 v1, 0x1

    if-ne v0, v1, :cond_2

    .line 170
    invoke-virtual {p0, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/badlogic/gdx/math/Vector2;

    .line 172
    .local v9, currentVertex:Lcom/badlogic/gdx/math/Vector2;
    iget v4, v9, Lcom/badlogic/gdx/math/Vector2;->x:F

    .line 173
    .local v4, currentVertexX:F
    iget v5, v9, Lcom/badlogic/gdx/math/Vector2;->y:F

    .local v5, currentVertexY:F
    move v0, p2

    move v1, p3

    move/from16 v2, p4

    move/from16 v3, p5

    .line 180
    invoke-static/range {v0 .. v5}, Lorg/anddev/andengine/extension/physics/box2d/util/triangulation/EarClippingTriangulator;->computeSpannedAreaSign(FFFFFF)I

    move-result v6

    .local v6, areaSign1:I
    move/from16 v0, p4

    move/from16 v1, p5

    move/from16 v2, p6

    move/from16 v3, p7

    .line 181
    invoke-static/range {v0 .. v5}, Lorg/anddev/andengine/extension/physics/box2d/util/triangulation/EarClippingTriangulator;->computeSpannedAreaSign(FFFFFF)I

    move-result v7

    .local v7, areaSign2:I
    move/from16 v0, p6

    move/from16 v1, p7

    move v2, p2

    move v3, p3

    .line 182
    invoke-static/range {v0 .. v5}, Lorg/anddev/andengine/extension/physics/box2d/util/triangulation/EarClippingTriangulator;->computeSpannedAreaSign(FFFFFF)I

    move-result v8

    .line 184
    .local v8, areaSign3:I
    if-lez v6, :cond_1

    if-lez v7, :cond_1

    if-lez v8, :cond_1

    .line 185
    const/4 v0, 0x1

    goto :goto_1

    .line 186
    :cond_1
    if-gtz v6, :cond_2

    if-gtz v7, :cond_2

    if-gtz v8, :cond_2

    .line 187
    const/4 v0, 0x1

    goto :goto_1

    .line 191
    .end local v4           #currentVertexX:F
    .end local v5           #currentVertexY:F
    .end local v6           #areaSign1:I
    .end local v7           #areaSign2:I
    .end local v8           #areaSign3:I
    .end local v9           #currentVertex:Lcom/badlogic/gdx/math/Vector2;
    :cond_2
    add-int/lit8 v10, v10, 0x1

    goto :goto_0
.end method

.method private static isCollinear(Ljava/util/ArrayList;I)Z
    .locals 3
    .parameter
    .parameter "pIndex"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/badlogic/gdx/math/Vector2;",
            ">;I)Z"
        }
    .end annotation

    .prologue
    .line 248
    .local p0, pVertices:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/badlogic/gdx/math/Vector2;>;"
    invoke-static {p0, p1}, Lorg/anddev/andengine/extension/physics/box2d/util/triangulation/EarClippingTriangulator;->computePreviousIndex(Ljava/util/List;I)I

    move-result v1

    .line 249
    .local v1, previousIndex:I
    invoke-static {p0, p1}, Lorg/anddev/andengine/extension/physics/box2d/util/triangulation/EarClippingTriangulator;->computeNextIndex(Ljava/util/List;I)I

    move-result v0

    .line 251
    .local v0, nextIndex:I
    invoke-static {p0, v1, p1, v0}, Lorg/anddev/andengine/extension/physics/box2d/util/triangulation/EarClippingTriangulator;->isCollinear(Ljava/util/ArrayList;III)Z

    move-result v2

    return v2
.end method

.method private static isCollinear(Ljava/util/ArrayList;III)Z
    .locals 9
    .parameter
    .parameter "pPreviousIndex"
    .parameter "pIndex"
    .parameter "pNextIndex"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/badlogic/gdx/math/Vector2;",
            ">;III)Z"
        }
    .end annotation

    .prologue
    .line 255
    .local p0, pVertices:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/badlogic/gdx/math/Vector2;>;"
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/badlogic/gdx/math/Vector2;

    .line 256
    .local v7, previousVertex:Lcom/badlogic/gdx/math/Vector2;
    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/badlogic/gdx/math/Vector2;

    .line 257
    .local v8, vertex:Lcom/badlogic/gdx/math/Vector2;
    invoke-virtual {p0, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/badlogic/gdx/math/Vector2;

    .line 259
    .local v6, nextVertex:Lcom/badlogic/gdx/math/Vector2;
    iget v0, v7, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget v1, v7, Lcom/badlogic/gdx/math/Vector2;->y:F

    iget v2, v8, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget v3, v8, Lcom/badlogic/gdx/math/Vector2;->y:F

    iget v4, v6, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget v5, v6, Lcom/badlogic/gdx/math/Vector2;->y:F

    invoke-static/range {v0 .. v5}, Lorg/anddev/andengine/extension/physics/box2d/util/triangulation/EarClippingTriangulator;->computeSpannedAreaSign(FFFFFF)I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isEarTip(Ljava/util/ArrayList;I[I)Z
    .locals 12
    .parameter
    .parameter "pEarTipIndex"
    .parameter "pVertexTypes"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/badlogic/gdx/math/Vector2;",
            ">;I[I)Z"
        }
    .end annotation

    .prologue
    .local p1, pVertices:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/badlogic/gdx/math/Vector2;>;"
    const/4 v11, 0x1

    .line 197
    iget v0, p0, Lorg/anddev/andengine/extension/physics/box2d/util/triangulation/EarClippingTriangulator;->mConcaveVertexCount:I

    if-eqz v0, :cond_1

    .line 198
    invoke-static {p1, p2}, Lorg/anddev/andengine/extension/physics/box2d/util/triangulation/EarClippingTriangulator;->computePreviousIndex(Ljava/util/List;I)I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/badlogic/gdx/math/Vector2;

    .line 199
    .local v10, previousVertex:Lcom/badlogic/gdx/math/Vector2;
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/badlogic/gdx/math/Vector2;

    .line 200
    .local v8, currentVertex:Lcom/badlogic/gdx/math/Vector2;
    invoke-static {p1, p2}, Lorg/anddev/andengine/extension/physics/box2d/util/triangulation/EarClippingTriangulator;->computeNextIndex(Ljava/util/List;I)I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/badlogic/gdx/math/Vector2;

    .line 202
    .local v9, nextVertex:Lcom/badlogic/gdx/math/Vector2;
    iget v2, v10, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget v3, v10, Lcom/badlogic/gdx/math/Vector2;->y:F

    iget v4, v8, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget v5, v8, Lcom/badlogic/gdx/math/Vector2;->y:F

    iget v6, v9, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget v7, v9, Lcom/badlogic/gdx/math/Vector2;->y:F

    move-object v0, p1

    move-object v1, p3

    invoke-static/range {v0 .. v7}, Lorg/anddev/andengine/extension/physics/box2d/util/triangulation/EarClippingTriangulator;->isAnyVertexInTriangle(Ljava/util/ArrayList;[IFFFFFF)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 203
    const/4 v0, 0x0

    .line 208
    .end local v8           #currentVertex:Lcom/badlogic/gdx/math/Vector2;
    .end local v9           #nextVertex:Lcom/badlogic/gdx/math/Vector2;
    .end local v10           #previousVertex:Lcom/badlogic/gdx/math/Vector2;
    :goto_0
    return v0

    .restart local v8       #currentVertex:Lcom/badlogic/gdx/math/Vector2;
    .restart local v9       #nextVertex:Lcom/badlogic/gdx/math/Vector2;
    .restart local v10       #previousVertex:Lcom/badlogic/gdx/math/Vector2;
    :cond_0
    move v0, v11

    .line 205
    goto :goto_0

    .end local v8           #currentVertex:Lcom/badlogic/gdx/math/Vector2;
    .end local v9           #nextVertex:Lcom/badlogic/gdx/math/Vector2;
    .end local v10           #previousVertex:Lcom/badlogic/gdx/math/Vector2;
    :cond_1
    move v0, v11

    .line 208
    goto :goto_0
.end method

.method private static isTriangleConvex(FFFFFF)Z
    .locals 1
    .parameter "pX1"
    .parameter "pY1"
    .parameter "pX2"
    .parameter "pY2"
    .parameter "pX3"
    .parameter "pY3"

    .prologue
    .line 144
    invoke-static/range {p0 .. p5}, Lorg/anddev/andengine/extension/physics/box2d/util/triangulation/EarClippingTriangulator;->computeSpannedAreaSign(FFFFFF)I

    move-result v0

    if-gez v0, :cond_0

    .line 145
    const/4 v0, 0x0

    .line 147
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private static removeCollinearNeighborEarsAfterRemovingEarTip(Ljava/util/ArrayList;I)V
    .locals 4
    .parameter
    .parameter "pEarTipCutIndex"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/badlogic/gdx/math/Vector2;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .line 229
    .local p0, pVertices:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/badlogic/gdx/math/Vector2;>;"
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v2

    rem-int v1, p1, v2

    .line 230
    .local v1, collinearityCheckNextIndex:I
    invoke-static {p0, v1}, Lorg/anddev/andengine/extension/physics/box2d/util/triangulation/EarClippingTriangulator;->computePreviousIndex(Ljava/util/List;I)I

    move-result v0

    .line 232
    .local v0, collinearCheckPreviousIndex:I
    invoke-static {p0, v1}, Lorg/anddev/andengine/extension/physics/box2d/util/triangulation/EarClippingTriangulator;->isCollinear(Ljava/util/ArrayList;I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 233
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 235
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x3

    if-le v2, v3, :cond_0

    .line 237
    invoke-static {p0, v1}, Lorg/anddev/andengine/extension/physics/box2d/util/triangulation/EarClippingTriangulator;->computePreviousIndex(Ljava/util/List;I)I

    move-result v0

    .line 238
    invoke-static {p0, v0}, Lorg/anddev/andengine/extension/physics/box2d/util/triangulation/EarClippingTriangulator;->isCollinear(Ljava/util/ArrayList;I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 239
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 245
    :cond_0
    :goto_0
    return-void

    .line 242
    :cond_1
    invoke-static {p0, v0}, Lorg/anddev/andengine/extension/physics/box2d/util/triangulation/EarClippingTriangulator;->isCollinear(Ljava/util/ArrayList;I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 243
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_0
.end method


# virtual methods
.method public computeTriangles(Ljava/util/List;)Ljava/util/List;
    .locals 7
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/badlogic/gdx/math/Vector2;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Lcom/badlogic/gdx/math/Vector2;",
            ">;"
        }
    .end annotation

    .prologue
    .local p1, pVertices:Ljava/util/List;,"Ljava/util/List<Lcom/badlogic/gdx/math/Vector2;>;"
    const/4 v6, 0x3

    .line 62
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 63
    .local v1, triangles:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/badlogic/gdx/math/Vector2;>;"
    new-instance v4, Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v5

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 64
    .local v4, vertices:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/badlogic/gdx/math/Vector2;>;"
    invoke-virtual {v4, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 66
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ne v5, v6, :cond_1

    .line 67
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 84
    :goto_0
    return-object v1

    .line 73
    :cond_0
    invoke-direct {p0, v4}, Lorg/anddev/andengine/extension/physics/box2d/util/triangulation/EarClippingTriangulator;->classifyVertices(Ljava/util/ArrayList;)[I

    move-result-object v3

    .line 75
    .local v3, vertexTypes:[I
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v2

    .line 76
    .local v2, vertexCount:I
    const/4 v0, 0x0

    .local v0, index:I
    :goto_1
    if-lt v0, v2, :cond_2

    .line 71
    .end local v0           #index:I
    .end local v2           #vertexCount:I
    .end local v3           #vertexTypes:[I
    :cond_1
    :goto_2
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v5, v6, :cond_0

    goto :goto_0

    .line 77
    .restart local v0       #index:I
    .restart local v2       #vertexCount:I
    .restart local v3       #vertexTypes:[I
    :cond_2
    invoke-direct {p0, v4, v0, v3}, Lorg/anddev/andengine/extension/physics/box2d/util/triangulation/EarClippingTriangulator;->isEarTip(Ljava/util/ArrayList;I[I)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 78
    invoke-direct {p0, v4, v0, v1}, Lorg/anddev/andengine/extension/physics/box2d/util/triangulation/EarClippingTriangulator;->cutEarTip(Ljava/util/ArrayList;ILjava/util/ArrayList;)V

    goto :goto_2

    .line 76
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method
