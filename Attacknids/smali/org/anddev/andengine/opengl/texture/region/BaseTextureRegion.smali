.class public abstract Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;
.super Ljava/lang/Object;
.source "BaseTextureRegion.java"


# instance fields
.field protected mHeight:I

.field protected final mTexture:Lorg/anddev/andengine/opengl/texture/Texture;

.field protected mTexturePositionX:I

.field protected mTexturePositionY:I

.field protected final mTextureRegionBuffer:Lorg/anddev/andengine/opengl/texture/region/buffer/BaseTextureRegionBuffer;

.field protected mWidth:I


# direct methods
.method public constructor <init>(Lorg/anddev/andengine/opengl/texture/Texture;IIII)V
    .locals 2
    .parameter "pTexture"
    .parameter "pTexturePositionX"
    .parameter "pTexturePositionY"
    .parameter "pWidth"
    .parameter "pHeight"

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-object p1, p0, Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;->mTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    .line 40
    iput p2, p0, Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;->mTexturePositionX:I

    .line 41
    iput p3, p0, Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;->mTexturePositionY:I

    .line 42
    iput p4, p0, Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;->mWidth:I

    .line 43
    iput p5, p0, Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;->mHeight:I

    .line 45
    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;->onCreateTextureRegionBuffer()Lorg/anddev/andengine/opengl/texture/region/buffer/BaseTextureRegionBuffer;

    move-result-object v0

    iput-object v0, p0, Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;->mTextureRegionBuffer:Lorg/anddev/andengine/opengl/texture/region/buffer/BaseTextureRegionBuffer;

    .line 47
    invoke-static {}, Lorg/anddev/andengine/opengl/buffer/BufferObjectManager;->getActiveInstance()Lorg/anddev/andengine/opengl/buffer/BufferObjectManager;

    move-result-object v0

    iget-object v1, p0, Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;->mTextureRegionBuffer:Lorg/anddev/andengine/opengl/texture/region/buffer/BaseTextureRegionBuffer;

    invoke-virtual {v0, v1}, Lorg/anddev/andengine/opengl/buffer/BufferObjectManager;->loadBufferObject(Lorg/anddev/andengine/opengl/buffer/BufferObject;)V

    .line 49
    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;->initTextureBuffer()V

    .line 50
    return-void
.end method


# virtual methods
.method public getHeight()I
    .locals 1

    .prologue
    .line 65
    iget v0, p0, Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;->mHeight:I

    return v0
.end method

.method public getTexture()Lorg/anddev/andengine/opengl/texture/Texture;
    .locals 1

    .prologue
    .line 93
    iget-object v0, p0, Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;->mTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    return-object v0
.end method

.method public getTextureBuffer()Lorg/anddev/andengine/opengl/texture/region/buffer/BaseTextureRegionBuffer;
    .locals 1

    .prologue
    .line 97
    iget-object v0, p0, Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;->mTextureRegionBuffer:Lorg/anddev/andengine/opengl/texture/region/buffer/BaseTextureRegionBuffer;

    return-object v0
.end method

.method public getTexturePositionX()I
    .locals 1

    .prologue
    .line 85
    iget v0, p0, Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;->mTexturePositionX:I

    return v0
.end method

.method public getTexturePositionY()I
    .locals 1

    .prologue
    .line 89
    iget v0, p0, Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;->mTexturePositionY:I

    return v0
.end method

.method public getWidth()I
    .locals 1

    .prologue
    .line 61
    iget v0, p0, Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;->mWidth:I

    return v0
.end method

.method protected initTextureBuffer()V
    .locals 0

    .prologue
    .line 53
    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;->updateTextureRegionBuffer()V

    .line 54
    return-void
.end method

.method public isFlippedHorizontal()Z
    .locals 1

    .prologue
    .line 101
    iget-object v0, p0, Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;->mTextureRegionBuffer:Lorg/anddev/andengine/opengl/texture/region/buffer/BaseTextureRegionBuffer;

    invoke-virtual {v0}, Lorg/anddev/andengine/opengl/texture/region/buffer/BaseTextureRegionBuffer;->isFlippedHorizontal()Z

    move-result v0

    return v0
.end method

.method public isFlippedVertical()Z
    .locals 1

    .prologue
    .line 109
    iget-object v0, p0, Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;->mTextureRegionBuffer:Lorg/anddev/andengine/opengl/texture/region/buffer/BaseTextureRegionBuffer;

    invoke-virtual {v0}, Lorg/anddev/andengine/opengl/texture/region/buffer/BaseTextureRegionBuffer;->isFlippedVertical()Z

    move-result v0

    return v0
.end method

.method public onApply(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 2
    .parameter "pGL"

    .prologue
    .line 131
    sget-boolean v1, Lorg/anddev/andengine/opengl/util/GLHelper;->EXTENSIONS_VERTEXBUFFEROBJECTS:Z

    if-eqz v1, :cond_0

    move-object v0, p1

    .line 132
    check-cast v0, Ljavax/microedition/khronos/opengles/GL11;

    .line 134
    .local v0, gl11:Ljavax/microedition/khronos/opengles/GL11;
    iget-object v1, p0, Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;->mTextureRegionBuffer:Lorg/anddev/andengine/opengl/texture/region/buffer/BaseTextureRegionBuffer;

    invoke-virtual {v1, v0}, Lorg/anddev/andengine/opengl/texture/region/buffer/BaseTextureRegionBuffer;->selectOnHardware(Ljavax/microedition/khronos/opengles/GL11;)V

    .line 136
    iget-object v1, p0, Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;->mTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    invoke-virtual {v1}, Lorg/anddev/andengine/opengl/texture/Texture;->getHardwareTextureID()I

    move-result v1

    invoke-static {p1, v1}, Lorg/anddev/andengine/opengl/util/GLHelper;->bindTexture(Ljavax/microedition/khronos/opengles/GL10;I)V

    .line 137
    invoke-static {v0}, Lorg/anddev/andengine/opengl/util/GLHelper;->texCoordZeroPointer(Ljavax/microedition/khronos/opengles/GL11;)V

    .line 142
    .end local v0           #gl11:Ljavax/microedition/khronos/opengles/GL11;
    :goto_0
    return-void

    .line 139
    :cond_0
    iget-object v1, p0, Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;->mTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    invoke-virtual {v1}, Lorg/anddev/andengine/opengl/texture/Texture;->getHardwareTextureID()I

    move-result v1

    invoke-static {p1, v1}, Lorg/anddev/andengine/opengl/util/GLHelper;->bindTexture(Ljavax/microedition/khronos/opengles/GL10;I)V

    .line 140
    iget-object v1, p0, Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;->mTextureRegionBuffer:Lorg/anddev/andengine/opengl/texture/region/buffer/BaseTextureRegionBuffer;

    invoke-virtual {v1}, Lorg/anddev/andengine/opengl/texture/region/buffer/BaseTextureRegionBuffer;->getFloatBuffer()Lorg/anddev/andengine/opengl/util/FastFloatBuffer;

    move-result-object v1

    invoke-static {p1, v1}, Lorg/anddev/andengine/opengl/util/GLHelper;->texCoordPointer(Ljavax/microedition/khronos/opengles/GL10;Lorg/anddev/andengine/opengl/util/FastFloatBuffer;)V

    goto :goto_0
.end method

.method protected abstract onCreateTextureRegionBuffer()Lorg/anddev/andengine/opengl/texture/region/buffer/BaseTextureRegionBuffer;
.end method

.method public setFlippedHorizontal(Z)V
    .locals 1
    .parameter "pFlippedHorizontal"

    .prologue
    .line 105
    iget-object v0, p0, Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;->mTextureRegionBuffer:Lorg/anddev/andengine/opengl/texture/region/buffer/BaseTextureRegionBuffer;

    invoke-virtual {v0, p1}, Lorg/anddev/andengine/opengl/texture/region/buffer/BaseTextureRegionBuffer;->setFlippedHorizontal(Z)V

    .line 106
    return-void
.end method

.method public setFlippedVertical(Z)V
    .locals 1
    .parameter "pFlippedVertical"

    .prologue
    .line 113
    iget-object v0, p0, Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;->mTextureRegionBuffer:Lorg/anddev/andengine/opengl/texture/region/buffer/BaseTextureRegionBuffer;

    invoke-virtual {v0, p1}, Lorg/anddev/andengine/opengl/texture/region/buffer/BaseTextureRegionBuffer;->setFlippedVertical(Z)V

    .line 114
    return-void
.end method

.method public setHeight(I)V
    .locals 0
    .parameter "pHeight"

    .prologue
    .line 74
    iput p1, p0, Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;->mHeight:I

    .line 75
    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;->updateTextureRegionBuffer()V

    .line 76
    return-void
.end method

.method public setTexturePosition(II)V
    .locals 0
    .parameter "pX"
    .parameter "pY"

    .prologue
    .line 79
    iput p1, p0, Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;->mTexturePositionX:I

    .line 80
    iput p2, p0, Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;->mTexturePositionY:I

    .line 81
    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;->updateTextureRegionBuffer()V

    .line 82
    return-void
.end method

.method public setWidth(I)V
    .locals 0
    .parameter "pWidth"

    .prologue
    .line 69
    iput p1, p0, Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;->mWidth:I

    .line 70
    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;->updateTextureRegionBuffer()V

    .line 71
    return-void
.end method

.method protected updateTextureRegionBuffer()V
    .locals 1

    .prologue
    .line 127
    iget-object v0, p0, Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;->mTextureRegionBuffer:Lorg/anddev/andengine/opengl/texture/region/buffer/BaseTextureRegionBuffer;

    invoke-virtual {v0}, Lorg/anddev/andengine/opengl/texture/region/buffer/BaseTextureRegionBuffer;->update()V

    .line 128
    return-void
.end method
