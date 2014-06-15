.class public abstract Lorg/anddev/andengine/extension/physics/box2d/util/hull/BaseHullAlgorithm;
.super Ljava/lang/Object;
.source "BaseHullAlgorithm.java"

# interfaces
.implements Lorg/anddev/andengine/extension/physics/box2d/util/hull/IHullAlgorithm;


# instance fields
.field protected mHullVertexCount:I

.field protected mVertexCount:I

.field protected mVertices:[Lcom/badlogic/gdx/math/Vector2;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method protected indexOfLowestVertex()I
    .locals 9

    .prologue
    const/4 v8, 0x0

    .line 39
    iget-object v5, p0, Lorg/anddev/andengine/extension/physics/box2d/util/hull/BaseHullAlgorithm;->mVertices:[Lcom/badlogic/gdx/math/Vector2;

    .line 40
    .local v5, vertices:[Lcom/badlogic/gdx/math/Vector2;
    iget v4, p0, Lorg/anddev/andengine/extension/physics/box2d/util/hull/BaseHullAlgorithm;->mVertexCount:I

    .line 42
    .local v4, vertexCount:I
    const/4 v3, 0x0

    .line 43
    .local v3, min:I
    const/4 v2, 0x1

    .local v2, i:I
    :goto_0
    if-lt v2, v4, :cond_0

    .line 50
    return v3

    .line 44
    :cond_0
    aget-object v6, v5, v2

    iget v6, v6, Lcom/badlogic/gdx/math/Vector2;->y:F

    aget-object v7, v5, v3

    iget v7, v7, Lcom/badlogic/gdx/math/Vector2;->y:F

    sub-float v1, v6, v7

    .line 45
    .local v1, dY:F
    aget-object v6, v5, v2

    iget v6, v6, Lcom/badlogic/gdx/math/Vector2;->x:F

    aget-object v7, v5, v3

    iget v7, v7, Lcom/badlogic/gdx/math/Vector2;->x:F

    sub-float v0, v6, v7

    .line 46
    .local v0, dX:F
    cmpg-float v6, v1, v8

    if-ltz v6, :cond_1

    cmpl-float v6, v1, v8

    if-nez v6, :cond_2

    cmpg-float v6, v0, v8

    if-gez v6, :cond_2

    .line 47
    :cond_1
    move v3, v2

    .line 43
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method protected swap(II)V
    .locals 3
    .parameter "pIndexA"
    .parameter "pIndexB"

    .prologue
    .line 54
    iget-object v1, p0, Lorg/anddev/andengine/extension/physics/box2d/util/hull/BaseHullAlgorithm;->mVertices:[Lcom/badlogic/gdx/math/Vector2;

    .line 56
    .local v1, vertices:[Lcom/badlogic/gdx/math/Vector2;
    aget-object v0, v1, p1

    .line 57
    .local v0, tmp:Lcom/badlogic/gdx/math/Vector2;
    aget-object v2, v1, p2

    aput-object v2, v1, p1

    .line 58
    aput-object v0, v1, p2

    .line 59
    return-void
.end method
