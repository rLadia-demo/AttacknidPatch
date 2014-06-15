.class public Lorg/anddev/andengine/extension/physics/box2d/util/hull/JarvisMarch;
.super Lorg/anddev/andengine/extension/physics/box2d/util/hull/BaseHullAlgorithm;
.source "JarvisMarch.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Lorg/anddev/andengine/extension/physics/box2d/util/hull/BaseHullAlgorithm;-><init>()V

    return-void
.end method

.method private indexOfRightmostVertexOf(Lcom/badlogic/gdx/math/Vector2;)I
    .locals 8
    .parameter "pVector"

    .prologue
    .line 58
    iget-object v5, p0, Lorg/anddev/andengine/extension/physics/box2d/util/hull/JarvisMarch;->mVertices:[Lcom/badlogic/gdx/math/Vector2;

    .line 59
    .local v5, vertices:[Lcom/badlogic/gdx/math/Vector2;
    iget v4, p0, Lorg/anddev/andengine/extension/physics/box2d/util/hull/JarvisMarch;->mVertexCount:I

    .line 61
    .local v4, vertexCount:I
    const/4 v0, 0x0

    .line 62
    .local v0, i:I
    const/4 v1, 0x1

    .local v1, j:I
    :goto_0
    if-lt v1, v4, :cond_0

    .line 72
    return v0

    .line 64
    :cond_0
    invoke-static {}, Lorg/anddev/andengine/extension/physics/box2d/util/Vector2Pool;->obtain()Lcom/badlogic/gdx/math/Vector2;

    move-result-object v6

    aget-object v7, v5, v1

    invoke-virtual {v6, v7}, Lcom/badlogic/gdx/math/Vector2;->set(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    move-result-object v2

    .line 65
    .local v2, vector2A:Lcom/badlogic/gdx/math/Vector2;
    invoke-static {}, Lorg/anddev/andengine/extension/physics/box2d/util/Vector2Pool;->obtain()Lcom/badlogic/gdx/math/Vector2;

    move-result-object v6

    aget-object v7, v5, v0

    invoke-virtual {v6, v7}, Lcom/badlogic/gdx/math/Vector2;->set(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    move-result-object v3

    .line 66
    .local v3, vector2B:Lcom/badlogic/gdx/math/Vector2;
    invoke-virtual {v2, p1}, Lcom/badlogic/gdx/math/Vector2;->sub(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    move-result-object v6

    invoke-virtual {v3, p1}, Lcom/badlogic/gdx/math/Vector2;->sub(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    move-result-object v7

    invoke-static {v6, v7}, Lorg/anddev/andengine/extension/physics/box2d/util/hull/Vector2Util;->isLess(Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/math/Vector2;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 67
    move v0, v1

    .line 69
    :cond_1
    invoke-static {v2}, Lorg/anddev/andengine/extension/physics/box2d/util/Vector2Pool;->recycle(Lcom/badlogic/gdx/math/Vector2;)V

    .line 70
    invoke-static {v3}, Lorg/anddev/andengine/extension/physics/box2d/util/Vector2Pool;->recycle(Lcom/badlogic/gdx/math/Vector2;)V

    .line 62
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private jarvisMarch()V
    .locals 3

    .prologue
    .line 47
    iget-object v1, p0, Lorg/anddev/andengine/extension/physics/box2d/util/hull/JarvisMarch;->mVertices:[Lcom/badlogic/gdx/math/Vector2;

    .line 49
    .local v1, vertices:[Lcom/badlogic/gdx/math/Vector2;
    invoke-virtual {p0}, Lorg/anddev/andengine/extension/physics/box2d/util/hull/JarvisMarch;->indexOfLowestVertex()I

    move-result v0

    .line 51
    .local v0, index:I
    :cond_0
    iget v2, p0, Lorg/anddev/andengine/extension/physics/box2d/util/hull/JarvisMarch;->mHullVertexCount:I

    invoke-virtual {p0, v2, v0}, Lorg/anddev/andengine/extension/physics/box2d/util/hull/JarvisMarch;->swap(II)V

    .line 52
    iget v2, p0, Lorg/anddev/andengine/extension/physics/box2d/util/hull/JarvisMarch;->mHullVertexCount:I

    aget-object v2, v1, v2

    invoke-direct {p0, v2}, Lorg/anddev/andengine/extension/physics/box2d/util/hull/JarvisMarch;->indexOfRightmostVertexOf(Lcom/badlogic/gdx/math/Vector2;)I

    move-result v0

    .line 53
    iget v2, p0, Lorg/anddev/andengine/extension/physics/box2d/util/hull/JarvisMarch;->mHullVertexCount:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lorg/anddev/andengine/extension/physics/box2d/util/hull/JarvisMarch;->mHullVertexCount:I

    .line 54
    if-gtz v0, :cond_0

    .line 55
    return-void
.end method


# virtual methods
.method public computeHull([Lcom/badlogic/gdx/math/Vector2;)I
    .locals 1
    .parameter "pVectors"

    .prologue
    .line 35
    iput-object p1, p0, Lorg/anddev/andengine/extension/physics/box2d/util/hull/JarvisMarch;->mVertices:[Lcom/badlogic/gdx/math/Vector2;

    .line 36
    array-length v0, p1

    iput v0, p0, Lorg/anddev/andengine/extension/physics/box2d/util/hull/JarvisMarch;->mVertexCount:I

    .line 37
    const/4 v0, 0x0

    iput v0, p0, Lorg/anddev/andengine/extension/physics/box2d/util/hull/JarvisMarch;->mHullVertexCount:I

    .line 38
    invoke-direct {p0}, Lorg/anddev/andengine/extension/physics/box2d/util/hull/JarvisMarch;->jarvisMarch()V

    .line 39
    iget v0, p0, Lorg/anddev/andengine/extension/physics/box2d/util/hull/JarvisMarch;->mHullVertexCount:I

    return v0
.end method
