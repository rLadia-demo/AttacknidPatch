.class public Lorg/anddev/andengine/entity/primitive/Line;
.super Lorg/anddev/andengine/entity/shape/GLShape;
.source "Line.java"


# static fields
.field private static final LINEWIDTH_DEFAULT:F = 1.0f


# instance fields
.field private final mLineVertexBuffer:Lorg/anddev/andengine/opengl/vertex/LineVertexBuffer;

.field private mLineWidth:F

.field protected mX2:F

.field protected mY2:F


# direct methods
.method public constructor <init>(FFFF)V
    .locals 6
    .parameter "pX1"
    .parameter "pY1"
    .parameter "pX2"
    .parameter "pY2"

    .prologue
    .line 42
    const/high16 v5, 0x3f80

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    invoke-direct/range {v0 .. v5}, Lorg/anddev/andengine/entity/primitive/Line;-><init>(FFFFF)V

    .line 43
    return-void
.end method

.method public constructor <init>(FFFFF)V
    .locals 5
    .parameter "pX1"
    .parameter "pY1"
    .parameter "pX2"
    .parameter "pY2"
    .parameter "pLineWidth"

    .prologue
    const/high16 v4, 0x3f00

    .line 46
    invoke-direct {p0, p1, p2}, Lorg/anddev/andengine/entity/shape/GLShape;-><init>(FF)V

    .line 48
    iput p3, p0, Lorg/anddev/andengine/entity/primitive/Line;->mX2:F

    .line 49
    iput p4, p0, Lorg/anddev/andengine/entity/primitive/Line;->mY2:F

    .line 51
    iput p5, p0, Lorg/anddev/andengine/entity/primitive/Line;->mLineWidth:F

    .line 53
    new-instance v2, Lorg/anddev/andengine/opengl/vertex/LineVertexBuffer;

    const v3, 0x88e4

    invoke-direct {v2, v3}, Lorg/anddev/andengine/opengl/vertex/LineVertexBuffer;-><init>(I)V

    iput-object v2, p0, Lorg/anddev/andengine/entity/primitive/Line;->mLineVertexBuffer:Lorg/anddev/andengine/opengl/vertex/LineVertexBuffer;

    .line 54
    invoke-static {}, Lorg/anddev/andengine/opengl/buffer/BufferObjectManager;->getActiveInstance()Lorg/anddev/andengine/opengl/buffer/BufferObjectManager;

    move-result-object v2

    iget-object v3, p0, Lorg/anddev/andengine/entity/primitive/Line;->mLineVertexBuffer:Lorg/anddev/andengine/opengl/vertex/LineVertexBuffer;

    invoke-virtual {v2, v3}, Lorg/anddev/andengine/opengl/buffer/BufferObjectManager;->loadBufferObject(Lorg/anddev/andengine/opengl/buffer/BufferObject;)V

    .line 55
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/primitive/Line;->updateVertexBuffer()V

    .line 57
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/primitive/Line;->getWidth()F

    move-result v1

    .line 58
    .local v1, width:F
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/primitive/Line;->getHeight()F

    move-result v0

    .line 60
    .local v0, height:F
    mul-float v2, v1, v4

    iput v2, p0, Lorg/anddev/andengine/entity/primitive/Line;->mRotationCenterX:F

    .line 61
    mul-float v2, v0, v4

    iput v2, p0, Lorg/anddev/andengine/entity/primitive/Line;->mRotationCenterY:F

    .line 63
    iget v2, p0, Lorg/anddev/andengine/entity/primitive/Line;->mRotationCenterX:F

    iput v2, p0, Lorg/anddev/andengine/entity/primitive/Line;->mScaleCenterX:F

    .line 64
    iget v2, p0, Lorg/anddev/andengine/entity/primitive/Line;->mRotationCenterY:F

    iput v2, p0, Lorg/anddev/andengine/entity/primitive/Line;->mScaleCenterY:F

    .line 65
    return-void
.end method


# virtual methods
.method public collidesWith(Lorg/anddev/andengine/entity/shape/IShape;)Z
    .locals 9
    .parameter "pOtherShape"

    .prologue
    .line 214
    instance-of v0, p1, Lorg/anddev/andengine/entity/primitive/Line;

    if-eqz v0, :cond_0

    move-object v8, p1

    .line 215
    check-cast v8, Lorg/anddev/andengine/entity/primitive/Line;

    .line 216
    .local v8, otherLine:Lorg/anddev/andengine/entity/primitive/Line;
    iget v0, p0, Lorg/anddev/andengine/entity/primitive/Line;->mX:F

    iget v1, p0, Lorg/anddev/andengine/entity/primitive/Line;->mY:F

    iget v2, p0, Lorg/anddev/andengine/entity/primitive/Line;->mX2:F

    iget v3, p0, Lorg/anddev/andengine/entity/primitive/Line;->mY2:F

    iget v4, v8, Lorg/anddev/andengine/entity/primitive/Line;->mX:F

    iget v5, v8, Lorg/anddev/andengine/entity/primitive/Line;->mY:F

    iget v6, v8, Lorg/anddev/andengine/entity/primitive/Line;->mX2:F

    iget v7, v8, Lorg/anddev/andengine/entity/primitive/Line;->mY2:F

    invoke-static/range {v0 .. v7}, Lorg/anddev/andengine/collision/LineCollisionChecker;->checkLineCollision(FFFFFFFF)Z

    move-result v0

    .line 218
    .end local v8           #otherLine:Lorg/anddev/andengine/entity/primitive/Line;
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public contains(FF)Z
    .locals 1
    .parameter "pX"
    .parameter "pY"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 197
    const/4 v0, 0x0

    return v0
.end method

.method public convertLocalToSceneCoordinates(FF)[F
    .locals 1
    .parameter "pX"
    .parameter "pY"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 209
    const/4 v0, 0x0

    return-object v0
.end method

.method public convertSceneToLocalCoordinates(FF)[F
    .locals 1
    .parameter "pX"
    .parameter "pY"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 203
    const/4 v0, 0x0

    return-object v0
.end method

.method protected drawVertices(Ljavax/microedition/khronos/opengles/GL10;Lorg/anddev/andengine/engine/camera/Camera;)V
    .locals 3
    .parameter "pGL"
    .parameter "pCamera"

    .prologue
    .line 186
    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x2

    invoke-interface {p1, v0, v1, v2}, Ljavax/microedition/khronos/opengles/GL10;->glDrawArrays(III)V

    .line 187
    return-void
.end method

.method public getBaseHeight()F
    .locals 2

    .prologue
    .line 115
    iget v0, p0, Lorg/anddev/andengine/entity/primitive/Line;->mY2:F

    iget v1, p0, Lorg/anddev/andengine/entity/primitive/Line;->mY:F

    sub-float/2addr v0, v1

    return v0
.end method

.method public getBaseWidth()F
    .locals 2

    .prologue
    .line 120
    iget v0, p0, Lorg/anddev/andengine/entity/primitive/Line;->mX2:F

    iget v1, p0, Lorg/anddev/andengine/entity/primitive/Line;->mX:F

    sub-float/2addr v0, v1

    return v0
.end method

.method public getHeight()F
    .locals 2

    .prologue
    .line 125
    iget v0, p0, Lorg/anddev/andengine/entity/primitive/Line;->mY2:F

    iget v1, p0, Lorg/anddev/andengine/entity/primitive/Line;->mY:F

    sub-float/2addr v0, v1

    return v0
.end method

.method public getLineWidth()F
    .locals 1

    .prologue
    .line 106
    iget v0, p0, Lorg/anddev/andengine/entity/primitive/Line;->mLineWidth:F

    return v0
.end method

.method public getSceneCenterCoordinates()[F
    .locals 4

    .prologue
    const/high16 v3, 0x3f00

    .line 191
    iget v0, p0, Lorg/anddev/andengine/entity/primitive/Line;->mX:F

    iget v1, p0, Lorg/anddev/andengine/entity/primitive/Line;->mX2:F

    add-float/2addr v0, v1

    mul-float/2addr v0, v3

    iget v1, p0, Lorg/anddev/andengine/entity/primitive/Line;->mY:F

    iget v2, p0, Lorg/anddev/andengine/entity/primitive/Line;->mY2:F

    add-float/2addr v1, v2

    mul-float/2addr v1, v3

    invoke-static {p0, v0, v1}, Lorg/anddev/andengine/collision/ShapeCollisionChecker;->convertLocalToSceneCoordinates(Lorg/anddev/andengine/entity/shape/Shape;FF)[F

    move-result-object v0

    return-object v0
.end method

.method public getVertexBuffer()Lorg/anddev/andengine/opengl/vertex/LineVertexBuffer;
    .locals 1

    .prologue
    .line 176
    iget-object v0, p0, Lorg/anddev/andengine/entity/primitive/Line;->mLineVertexBuffer:Lorg/anddev/andengine/opengl/vertex/LineVertexBuffer;

    return-object v0
.end method

.method public bridge synthetic getVertexBuffer()Lorg/anddev/andengine/opengl/vertex/VertexBuffer;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/primitive/Line;->getVertexBuffer()Lorg/anddev/andengine/opengl/vertex/LineVertexBuffer;

    move-result-object v0

    return-object v0
.end method

.method public getWidth()F
    .locals 2

    .prologue
    .line 130
    iget v0, p0, Lorg/anddev/andengine/entity/primitive/Line;->mX2:F

    iget v1, p0, Lorg/anddev/andengine/entity/primitive/Line;->mX:F

    sub-float/2addr v0, v1

    return v0
.end method

.method public getX()F
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 77
    invoke-super {p0}, Lorg/anddev/andengine/entity/shape/GLShape;->getX()F

    move-result v0

    return v0
.end method

.method public getX1()F
    .locals 1

    .prologue
    .line 90
    invoke-super {p0}, Lorg/anddev/andengine/entity/shape/GLShape;->getX()F

    move-result v0

    return v0
.end method

.method public getX2()F
    .locals 1

    .prologue
    .line 98
    iget v0, p0, Lorg/anddev/andengine/entity/primitive/Line;->mX2:F

    return v0
.end method

.method public getY()F
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 86
    invoke-super {p0}, Lorg/anddev/andengine/entity/shape/GLShape;->getY()F

    move-result v0

    return v0
.end method

.method public getY1()F
    .locals 1

    .prologue
    .line 94
    invoke-super {p0}, Lorg/anddev/andengine/entity/shape/GLShape;->getY()F

    move-result v0

    return v0
.end method

.method public getY2()F
    .locals 1

    .prologue
    .line 102
    iget v0, p0, Lorg/anddev/andengine/entity/primitive/Line;->mY2:F

    return v0
.end method

.method protected isCulled(Lorg/anddev/andengine/engine/camera/Camera;)Z
    .locals 1
    .parameter "pCamera"

    .prologue
    .line 163
    const/4 v0, 0x0

    return v0
.end method

.method protected onInitDraw(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 1
    .parameter "pGL"

    .prologue
    .line 168
    invoke-super {p0, p1}, Lorg/anddev/andengine/entity/shape/GLShape;->onInitDraw(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 169
    invoke-static {p1}, Lorg/anddev/andengine/opengl/util/GLHelper;->disableTextures(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 170
    invoke-static {p1}, Lorg/anddev/andengine/opengl/util/GLHelper;->disableTexCoordArray(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 171
    iget v0, p0, Lorg/anddev/andengine/entity/primitive/Line;->mLineWidth:F

    invoke-static {p1, v0}, Lorg/anddev/andengine/opengl/util/GLHelper;->lineWidth(Ljavax/microedition/khronos/opengles/GL10;F)V

    .line 172
    return-void
.end method

.method protected onUpdateVertexBuffer()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 181
    iget-object v0, p0, Lorg/anddev/andengine/entity/primitive/Line;->mLineVertexBuffer:Lorg/anddev/andengine/opengl/vertex/LineVertexBuffer;

    iget v1, p0, Lorg/anddev/andengine/entity/primitive/Line;->mX2:F

    iget v2, p0, Lorg/anddev/andengine/entity/primitive/Line;->mX:F

    sub-float/2addr v1, v2

    iget v2, p0, Lorg/anddev/andengine/entity/primitive/Line;->mY2:F

    iget v3, p0, Lorg/anddev/andengine/entity/primitive/Line;->mY:F

    sub-float/2addr v2, v3

    invoke-virtual {v0, v4, v4, v1, v2}, Lorg/anddev/andengine/opengl/vertex/LineVertexBuffer;->update(FFFF)V

    .line 182
    return-void
.end method

.method public setLineWidth(F)V
    .locals 0
    .parameter "pLineWidth"

    .prologue
    .line 110
    iput p1, p0, Lorg/anddev/andengine/entity/primitive/Line;->mLineWidth:F

    .line 111
    return-void
.end method

.method public setPosition(FF)V
    .locals 3
    .parameter "pX"
    .parameter "pY"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 139
    iget v2, p0, Lorg/anddev/andengine/entity/primitive/Line;->mX:F

    sub-float v0, v2, p1

    .line 140
    .local v0, dX:F
    iget v2, p0, Lorg/anddev/andengine/entity/primitive/Line;->mY:F

    sub-float v1, v2, p2

    .line 142
    .local v1, dY:F
    invoke-super {p0, p1, p2}, Lorg/anddev/andengine/entity/shape/GLShape;->setPosition(FF)V

    .line 144
    iget v2, p0, Lorg/anddev/andengine/entity/primitive/Line;->mX2:F

    add-float/2addr v2, v0

    iput v2, p0, Lorg/anddev/andengine/entity/primitive/Line;->mX2:F

    .line 145
    iget v2, p0, Lorg/anddev/andengine/entity/primitive/Line;->mY2:F

    add-float/2addr v2, v1

    iput v2, p0, Lorg/anddev/andengine/entity/primitive/Line;->mY2:F

    .line 146
    return-void
.end method

.method public setPosition(FFFF)V
    .locals 0
    .parameter "pX1"
    .parameter "pY1"
    .parameter "pX2"
    .parameter "pY2"

    .prologue
    .line 149
    iput p3, p0, Lorg/anddev/andengine/entity/primitive/Line;->mX2:F

    .line 150
    iput p4, p0, Lorg/anddev/andengine/entity/primitive/Line;->mY2:F

    .line 152
    invoke-super {p0, p1, p2}, Lorg/anddev/andengine/entity/shape/GLShape;->setPosition(FF)V

    .line 154
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/primitive/Line;->updateVertexBuffer()V

    .line 155
    return-void
.end method
