.class public abstract Lorg/anddev/andengine/entity/shape/RectangularShape;
.super Lorg/anddev/andengine/entity/shape/GLShape;
.source "RectangularShape.java"


# instance fields
.field protected mBaseHeight:F

.field protected mBaseWidth:F

.field protected mHeight:F

.field private final mVertexBuffer:Lorg/anddev/andengine/opengl/vertex/VertexBuffer;

.field protected mWidth:F


# direct methods
.method public constructor <init>(FFFFLorg/anddev/andengine/opengl/vertex/VertexBuffer;)V
    .locals 3
    .parameter "pX"
    .parameter "pY"
    .parameter "pWidth"
    .parameter "pHeight"
    .parameter "pVertexBuffer"

    .prologue
    const/high16 v2, 0x3f00

    .line 40
    invoke-direct {p0, p1, p2}, Lorg/anddev/andengine/entity/shape/GLShape;-><init>(FF)V

    .line 42
    iput p3, p0, Lorg/anddev/andengine/entity/shape/RectangularShape;->mBaseWidth:F

    .line 43
    iput p4, p0, Lorg/anddev/andengine/entity/shape/RectangularShape;->mBaseHeight:F

    .line 45
    iput p3, p0, Lorg/anddev/andengine/entity/shape/RectangularShape;->mWidth:F

    .line 46
    iput p4, p0, Lorg/anddev/andengine/entity/shape/RectangularShape;->mHeight:F

    .line 48
    iput-object p5, p0, Lorg/anddev/andengine/entity/shape/RectangularShape;->mVertexBuffer:Lorg/anddev/andengine/opengl/vertex/VertexBuffer;

    .line 49
    invoke-static {}, Lorg/anddev/andengine/opengl/buffer/BufferObjectManager;->getActiveInstance()Lorg/anddev/andengine/opengl/buffer/BufferObjectManager;

    move-result-object v0

    iget-object v1, p0, Lorg/anddev/andengine/entity/shape/RectangularShape;->mVertexBuffer:Lorg/anddev/andengine/opengl/vertex/VertexBuffer;

    invoke-virtual {v0, v1}, Lorg/anddev/andengine/opengl/buffer/BufferObjectManager;->loadBufferObject(Lorg/anddev/andengine/opengl/buffer/BufferObject;)V

    .line 51
    mul-float v0, p3, v2

    iput v0, p0, Lorg/anddev/andengine/entity/shape/RectangularShape;->mRotationCenterX:F

    .line 52
    mul-float v0, p4, v2

    iput v0, p0, Lorg/anddev/andengine/entity/shape/RectangularShape;->mRotationCenterY:F

    .line 54
    iget v0, p0, Lorg/anddev/andengine/entity/shape/RectangularShape;->mRotationCenterX:F

    iput v0, p0, Lorg/anddev/andengine/entity/shape/RectangularShape;->mScaleCenterX:F

    .line 55
    iget v0, p0, Lorg/anddev/andengine/entity/shape/RectangularShape;->mRotationCenterY:F

    iput v0, p0, Lorg/anddev/andengine/entity/shape/RectangularShape;->mScaleCenterY:F

    .line 56
    return-void
.end method


# virtual methods
.method public collidesWith(Lorg/anddev/andengine/entity/shape/IShape;)Z
    .locals 2
    .parameter "pOtherShape"

    .prologue
    .line 174
    instance-of v1, p1, Lorg/anddev/andengine/entity/shape/RectangularShape;

    if-eqz v1, :cond_0

    move-object v0, p1

    .line 175
    check-cast v0, Lorg/anddev/andengine/entity/shape/RectangularShape;

    .line 177
    .local v0, pOtherRectangularShape:Lorg/anddev/andengine/entity/shape/RectangularShape;
    invoke-static {p0, v0}, Lorg/anddev/andengine/collision/RectangularShapeCollisionChecker;->checkCollision(Lorg/anddev/andengine/entity/shape/RectangularShape;Lorg/anddev/andengine/entity/shape/RectangularShape;)Z

    move-result v1

    .line 179
    .end local v0           #pOtherRectangularShape:Lorg/anddev/andengine/entity/shape/RectangularShape;
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public contains(FF)Z
    .locals 1
    .parameter "pX"
    .parameter "pY"

    .prologue
    .line 148
    invoke-static {p0, p1, p2}, Lorg/anddev/andengine/collision/RectangularShapeCollisionChecker;->checkContains(Lorg/anddev/andengine/entity/shape/RectangularShape;FF)Z

    move-result v0

    return v0
.end method

.method public convertLocalToSceneCoordinates(FF)[F
    .locals 4
    .parameter "pX"
    .parameter "pY"

    .prologue
    .line 158
    invoke-static {p0, p1, p2}, Lorg/anddev/andengine/collision/ShapeCollisionChecker;->convertLocalToSceneCoordinates(Lorg/anddev/andengine/entity/shape/Shape;FF)[F

    move-result-object v0

    .line 159
    .local v0, sceneCoordinates:[F
    const/4 v1, 0x0

    aget v2, v0, v1

    iget v3, p0, Lorg/anddev/andengine/entity/shape/RectangularShape;->mX:F

    add-float/2addr v2, v3

    aput v2, v0, v1

    .line 160
    const/4 v1, 0x1

    aget v2, v0, v1

    iget v3, p0, Lorg/anddev/andengine/entity/shape/RectangularShape;->mY:F

    add-float/2addr v2, v3

    aput v2, v0, v1

    .line 161
    return-object v0
.end method

.method public convertSceneToLocalCoordinates(FF)[F
    .locals 4
    .parameter "pX"
    .parameter "pY"

    .prologue
    .line 166
    invoke-static {p0, p1, p2}, Lorg/anddev/andengine/collision/ShapeCollisionChecker;->convertSceneToLocalCoordinates(Lorg/anddev/andengine/entity/shape/Shape;FF)[F

    move-result-object v0

    .line 167
    .local v0, localCoordinates:[F
    const/4 v1, 0x0

    aget v2, v0, v1

    iget v3, p0, Lorg/anddev/andengine/entity/shape/RectangularShape;->mX:F

    sub-float/2addr v2, v3

    aput v2, v0, v1

    .line 168
    const/4 v1, 0x1

    aget v2, v0, v1

    iget v3, p0, Lorg/anddev/andengine/entity/shape/RectangularShape;->mY:F

    sub-float/2addr v2, v3

    aput v2, v0, v1

    .line 169
    return-object v0
.end method

.method protected drawVertices(Ljavax/microedition/khronos/opengles/GL10;Lorg/anddev/andengine/engine/camera/Camera;)V
    .locals 3
    .parameter "pGL"
    .parameter "pCamera"

    .prologue
    .line 128
    const/4 v0, 0x5

    const/4 v1, 0x0

    const/4 v2, 0x4

    invoke-interface {p1, v0, v1, v2}, Ljavax/microedition/khronos/opengles/GL10;->glDrawArrays(III)V

    .line 129
    return-void
.end method

.method public getBaseHeight()F
    .locals 1

    .prologue
    .line 84
    iget v0, p0, Lorg/anddev/andengine/entity/shape/RectangularShape;->mBaseHeight:F

    return v0
.end method

.method public getBaseWidth()F
    .locals 1

    .prologue
    .line 79
    iget v0, p0, Lorg/anddev/andengine/entity/shape/RectangularShape;->mBaseWidth:F

    return v0
.end method

.method public getHeight()F
    .locals 1

    .prologue
    .line 74
    iget v0, p0, Lorg/anddev/andengine/entity/shape/RectangularShape;->mHeight:F

    return v0
.end method

.method public getSceneCenterCoordinates()[F
    .locals 3

    .prologue
    const/high16 v2, 0x3f00

    .line 153
    iget v0, p0, Lorg/anddev/andengine/entity/shape/RectangularShape;->mWidth:F

    mul-float/2addr v0, v2

    iget v1, p0, Lorg/anddev/andengine/entity/shape/RectangularShape;->mHeight:F

    mul-float/2addr v1, v2

    invoke-virtual {p0, v0, v1}, Lorg/anddev/andengine/entity/shape/RectangularShape;->convertLocalToSceneCoordinates(FF)[F

    move-result-object v0

    return-object v0
.end method

.method public getVertexBuffer()Lorg/anddev/andengine/opengl/vertex/VertexBuffer;
    .locals 1

    .prologue
    .line 64
    iget-object v0, p0, Lorg/anddev/andengine/entity/shape/RectangularShape;->mVertexBuffer:Lorg/anddev/andengine/opengl/vertex/VertexBuffer;

    return-object v0
.end method

.method public getWidth()F
    .locals 1

    .prologue
    .line 69
    iget v0, p0, Lorg/anddev/andengine/entity/shape/RectangularShape;->mWidth:F

    return v0
.end method

.method protected isCulled(Lorg/anddev/andengine/engine/camera/Camera;)Z
    .locals 4
    .parameter "pCamera"

    .prologue
    .line 118
    iget v0, p0, Lorg/anddev/andengine/entity/shape/RectangularShape;->mX:F

    .line 119
    .local v0, x:F
    iget v1, p0, Lorg/anddev/andengine/entity/shape/RectangularShape;->mY:F

    .line 120
    .local v1, y:F
    invoke-virtual {p1}, Lorg/anddev/andengine/engine/camera/Camera;->getMaxX()F

    move-result v2

    cmpl-float v2, v0, v2

    if-gtz v2, :cond_0

    .line 121
    invoke-virtual {p1}, Lorg/anddev/andengine/engine/camera/Camera;->getMaxY()F

    move-result v2

    cmpl-float v2, v1, v2

    if-gtz v2, :cond_0

    .line 122
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/RectangularShape;->getWidth()F

    move-result v2

    add-float/2addr v2, v0

    invoke-virtual {p1}, Lorg/anddev/andengine/engine/camera/Camera;->getMinX()F

    move-result v3

    cmpg-float v2, v2, v3

    if-ltz v2, :cond_0

    .line 123
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/RectangularShape;->getHeight()F

    move-result v2

    add-float/2addr v2, v1

    invoke-virtual {p1}, Lorg/anddev/andengine/engine/camera/Camera;->getMinY()F

    move-result v3

    .line 120
    cmpg-float v2, v2, v3

    if-ltz v2, :cond_0

    const/4 v2, 0x0

    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public reset()V
    .locals 4

    .prologue
    const/high16 v3, 0x3f00

    .line 133
    invoke-super {p0}, Lorg/anddev/andengine/entity/shape/GLShape;->reset()V

    .line 134
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/RectangularShape;->setBaseSize()V

    .line 136
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/RectangularShape;->getBaseWidth()F

    move-result v1

    .line 137
    .local v1, baseWidth:F
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/RectangularShape;->getBaseHeight()F

    move-result v0

    .line 139
    .local v0, baseHeight:F
    mul-float v2, v1, v3

    iput v2, p0, Lorg/anddev/andengine/entity/shape/RectangularShape;->mRotationCenterX:F

    .line 140
    mul-float v2, v0, v3

    iput v2, p0, Lorg/anddev/andengine/entity/shape/RectangularShape;->mRotationCenterY:F

    .line 142
    iget v2, p0, Lorg/anddev/andengine/entity/shape/RectangularShape;->mRotationCenterX:F

    iput v2, p0, Lorg/anddev/andengine/entity/shape/RectangularShape;->mScaleCenterX:F

    .line 143
    iget v2, p0, Lorg/anddev/andengine/entity/shape/RectangularShape;->mRotationCenterY:F

    iput v2, p0, Lorg/anddev/andengine/entity/shape/RectangularShape;->mScaleCenterY:F

    .line 144
    return-void
.end method

.method public setBaseSize()V
    .locals 2

    .prologue
    .line 108
    iget v0, p0, Lorg/anddev/andengine/entity/shape/RectangularShape;->mWidth:F

    iget v1, p0, Lorg/anddev/andengine/entity/shape/RectangularShape;->mBaseWidth:F

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_0

    iget v0, p0, Lorg/anddev/andengine/entity/shape/RectangularShape;->mHeight:F

    iget v1, p0, Lorg/anddev/andengine/entity/shape/RectangularShape;->mBaseHeight:F

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_0

    .line 109
    iget v0, p0, Lorg/anddev/andengine/entity/shape/RectangularShape;->mBaseWidth:F

    iput v0, p0, Lorg/anddev/andengine/entity/shape/RectangularShape;->mWidth:F

    .line 110
    iget v0, p0, Lorg/anddev/andengine/entity/shape/RectangularShape;->mBaseHeight:F

    iput v0, p0, Lorg/anddev/andengine/entity/shape/RectangularShape;->mHeight:F

    .line 111
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/RectangularShape;->onPositionChanged()V

    .line 112
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/RectangularShape;->updateVertexBuffer()V

    .line 114
    :cond_0
    return-void
.end method

.method public setHeight(F)V
    .locals 0
    .parameter "pHeight"

    .prologue
    .line 93
    iput p1, p0, Lorg/anddev/andengine/entity/shape/RectangularShape;->mHeight:F

    .line 94
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/RectangularShape;->updateVertexBuffer()V

    .line 95
    return-void
.end method

.method public setSize(FF)V
    .locals 0
    .parameter "pWidth"
    .parameter "pHeight"

    .prologue
    .line 98
    iput p1, p0, Lorg/anddev/andengine/entity/shape/RectangularShape;->mWidth:F

    .line 99
    iput p2, p0, Lorg/anddev/andengine/entity/shape/RectangularShape;->mHeight:F

    .line 100
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/RectangularShape;->updateVertexBuffer()V

    .line 101
    return-void
.end method

.method public setWidth(F)V
    .locals 0
    .parameter "pWidth"

    .prologue
    .line 88
    iput p1, p0, Lorg/anddev/andengine/entity/shape/RectangularShape;->mWidth:F

    .line 89
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/RectangularShape;->updateVertexBuffer()V

    .line 90
    return-void
.end method
