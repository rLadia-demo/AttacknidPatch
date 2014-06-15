.class public Lorg/anddev/andengine/entity/text/Text;
.super Lorg/anddev/andengine/entity/shape/RectangularShape;
.source "Text.java"


# instance fields
.field protected final mCharactersMaximum:I

.field private final mFont:Lorg/anddev/andengine/opengl/font/Font;

.field private mLines:[Ljava/lang/String;

.field private mMaximumLineWidth:I

.field private mText:Ljava/lang/String;

.field private final mTextTextureBuffer:Lorg/anddev/andengine/opengl/texture/buffer/TextTextureBuffer;

.field protected final mVertexCount:I

.field private mWidths:[I


# direct methods
.method public constructor <init>(FFLorg/anddev/andengine/opengl/font/Font;Ljava/lang/String;)V
    .locals 6
    .parameter "pX"
    .parameter "pY"
    .parameter "pFont"
    .parameter "pText"

    .prologue
    .line 47
    sget-object v5, Lorg/anddev/andengine/util/HorizontalAlign;->LEFT:Lorg/anddev/andengine/util/HorizontalAlign;

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Lorg/anddev/andengine/entity/text/Text;-><init>(FFLorg/anddev/andengine/opengl/font/Font;Ljava/lang/String;Lorg/anddev/andengine/util/HorizontalAlign;)V

    .line 48
    return-void
.end method

.method public constructor <init>(FFLorg/anddev/andengine/opengl/font/Font;Ljava/lang/String;Lorg/anddev/andengine/util/HorizontalAlign;)V
    .locals 7
    .parameter "pX"
    .parameter "pY"
    .parameter "pFont"
    .parameter "pText"
    .parameter "pHorizontalAlign"

    .prologue
    .line 51
    invoke-virtual {p4}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xa

    invoke-static {p4, v1}, Lorg/anddev/andengine/util/StringUtils;->countOccurrences(Ljava/lang/String;C)I

    move-result v1

    sub-int v6, v0, v1

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v6}, Lorg/anddev/andengine/entity/text/Text;-><init>(FFLorg/anddev/andengine/opengl/font/Font;Ljava/lang/String;Lorg/anddev/andengine/util/HorizontalAlign;I)V

    .line 52
    return-void
.end method

.method protected constructor <init>(FFLorg/anddev/andengine/opengl/font/Font;Ljava/lang/String;Lorg/anddev/andengine/util/HorizontalAlign;I)V
    .locals 7
    .parameter "pX"
    .parameter "pY"
    .parameter "pFont"
    .parameter "pText"
    .parameter "pHorizontalAlign"
    .parameter "pCharactersMaximum"

    .prologue
    const v6, 0x88e4

    const/4 v3, 0x0

    .line 55
    new-instance v5, Lorg/anddev/andengine/opengl/vertex/TextVertexBuffer;

    invoke-direct {v5, p6, p5, v6}, Lorg/anddev/andengine/opengl/vertex/TextVertexBuffer;-><init>(ILorg/anddev/andengine/util/HorizontalAlign;I)V

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v4, v3

    invoke-direct/range {v0 .. v5}, Lorg/anddev/andengine/entity/shape/RectangularShape;-><init>(FFFFLorg/anddev/andengine/opengl/vertex/VertexBuffer;)V

    .line 57
    iput p6, p0, Lorg/anddev/andengine/entity/text/Text;->mCharactersMaximum:I

    .line 58
    iget v0, p0, Lorg/anddev/andengine/entity/text/Text;->mCharactersMaximum:I

    mul-int/lit8 v0, v0, 0x6

    iput v0, p0, Lorg/anddev/andengine/entity/text/Text;->mVertexCount:I

    .line 60
    new-instance v0, Lorg/anddev/andengine/opengl/texture/buffer/TextTextureBuffer;

    iget v1, p0, Lorg/anddev/andengine/entity/text/Text;->mVertexCount:I

    mul-int/lit8 v1, v1, 0x2

    invoke-direct {v0, v1, v6}, Lorg/anddev/andengine/opengl/texture/buffer/TextTextureBuffer;-><init>(II)V

    iput-object v0, p0, Lorg/anddev/andengine/entity/text/Text;->mTextTextureBuffer:Lorg/anddev/andengine/opengl/texture/buffer/TextTextureBuffer;

    .line 61
    invoke-static {}, Lorg/anddev/andengine/opengl/buffer/BufferObjectManager;->getActiveInstance()Lorg/anddev/andengine/opengl/buffer/BufferObjectManager;

    move-result-object v0

    iget-object v1, p0, Lorg/anddev/andengine/entity/text/Text;->mTextTextureBuffer:Lorg/anddev/andengine/opengl/texture/buffer/TextTextureBuffer;

    invoke-virtual {v0, v1}, Lorg/anddev/andengine/opengl/buffer/BufferObjectManager;->loadBufferObject(Lorg/anddev/andengine/opengl/buffer/BufferObject;)V

    .line 62
    iput-object p3, p0, Lorg/anddev/andengine/entity/text/Text;->mFont:Lorg/anddev/andengine/opengl/font/Font;

    .line 64
    invoke-virtual {p0, p4}, Lorg/anddev/andengine/entity/text/Text;->updateText(Ljava/lang/String;)V

    .line 66
    invoke-direct {p0}, Lorg/anddev/andengine/entity/text/Text;->initBlendFunction()V

    .line 67
    return-void
.end method

.method private applyTexture(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 2
    .parameter "pGL"

    .prologue
    .line 163
    sget-boolean v1, Lorg/anddev/andengine/opengl/util/GLHelper;->EXTENSIONS_VERTEXBUFFEROBJECTS:Z

    if-eqz v1, :cond_0

    move-object v0, p1

    .line 164
    check-cast v0, Ljavax/microedition/khronos/opengles/GL11;

    .line 166
    .local v0, gl11:Ljavax/microedition/khronos/opengles/GL11;
    iget-object v1, p0, Lorg/anddev/andengine/entity/text/Text;->mTextTextureBuffer:Lorg/anddev/andengine/opengl/texture/buffer/TextTextureBuffer;

    invoke-virtual {v1, v0}, Lorg/anddev/andengine/opengl/texture/buffer/TextTextureBuffer;->selectOnHardware(Ljavax/microedition/khronos/opengles/GL11;)V

    .line 168
    iget-object v1, p0, Lorg/anddev/andengine/entity/text/Text;->mFont:Lorg/anddev/andengine/opengl/font/Font;

    invoke-virtual {v1}, Lorg/anddev/andengine/opengl/font/Font;->getTexture()Lorg/anddev/andengine/opengl/texture/Texture;

    move-result-object v1

    invoke-virtual {v1}, Lorg/anddev/andengine/opengl/texture/Texture;->getHardwareTextureID()I

    move-result v1

    invoke-static {p1, v1}, Lorg/anddev/andengine/opengl/util/GLHelper;->bindTexture(Ljavax/microedition/khronos/opengles/GL10;I)V

    .line 169
    invoke-static {v0}, Lorg/anddev/andengine/opengl/util/GLHelper;->texCoordZeroPointer(Ljavax/microedition/khronos/opengles/GL11;)V

    .line 174
    .end local v0           #gl11:Ljavax/microedition/khronos/opengles/GL11;
    :goto_0
    return-void

    .line 171
    :cond_0
    iget-object v1, p0, Lorg/anddev/andengine/entity/text/Text;->mFont:Lorg/anddev/andengine/opengl/font/Font;

    invoke-virtual {v1}, Lorg/anddev/andengine/opengl/font/Font;->getTexture()Lorg/anddev/andengine/opengl/texture/Texture;

    move-result-object v1

    invoke-virtual {v1}, Lorg/anddev/andengine/opengl/texture/Texture;->getHardwareTextureID()I

    move-result v1

    invoke-static {p1, v1}, Lorg/anddev/andengine/opengl/util/GLHelper;->bindTexture(Ljavax/microedition/khronos/opengles/GL10;I)V

    .line 172
    iget-object v1, p0, Lorg/anddev/andengine/entity/text/Text;->mTextTextureBuffer:Lorg/anddev/andengine/opengl/texture/buffer/TextTextureBuffer;

    invoke-virtual {v1}, Lorg/anddev/andengine/opengl/texture/buffer/TextTextureBuffer;->getFloatBuffer()Lorg/anddev/andengine/opengl/util/FastFloatBuffer;

    move-result-object v1

    invoke-static {p1, v1}, Lorg/anddev/andengine/opengl/util/GLHelper;->texCoordPointer(Ljavax/microedition/khronos/opengles/GL10;Lorg/anddev/andengine/opengl/util/FastFloatBuffer;)V

    goto :goto_0
.end method

.method private initBlendFunction()V
    .locals 2

    .prologue
    .line 157
    iget-object v0, p0, Lorg/anddev/andengine/entity/text/Text;->mFont:Lorg/anddev/andengine/opengl/font/Font;

    invoke-virtual {v0}, Lorg/anddev/andengine/opengl/font/Font;->getTexture()Lorg/anddev/andengine/opengl/texture/Texture;

    move-result-object v0

    invoke-virtual {v0}, Lorg/anddev/andengine/opengl/texture/Texture;->getTextureOptions()Lorg/anddev/andengine/opengl/texture/TextureOptions;

    move-result-object v0

    iget-boolean v0, v0, Lorg/anddev/andengine/opengl/texture/TextureOptions;->mPreMultipyAlpha:Z

    if-eqz v0, :cond_0

    .line 158
    const/4 v0, 0x1

    const/16 v1, 0x303

    invoke-virtual {p0, v0, v1}, Lorg/anddev/andengine/entity/text/Text;->setBlendFunction(II)V

    .line 160
    :cond_0
    return-void
.end method


# virtual methods
.method protected drawVertices(Ljavax/microedition/khronos/opengles/GL10;Lorg/anddev/andengine/engine/camera/Camera;)V
    .locals 3
    .parameter "pGL"
    .parameter "pCamera"

    .prologue
    .line 135
    const/4 v0, 0x4

    const/4 v1, 0x0

    iget v2, p0, Lorg/anddev/andengine/entity/text/Text;->mVertexCount:I

    invoke-interface {p1, v0, v1, v2}, Ljavax/microedition/khronos/opengles/GL10;->glDrawArrays(III)V

    .line 136
    return-void
.end method

.method public getCharacterCount()I
    .locals 1

    .prologue
    .line 114
    iget v0, p0, Lorg/anddev/andengine/entity/text/Text;->mCharactersMaximum:I

    return v0
.end method

.method public getVertexBuffer()Lorg/anddev/andengine/opengl/vertex/TextVertexBuffer;
    .locals 1

    .prologue
    .line 119
    invoke-super {p0}, Lorg/anddev/andengine/entity/shape/RectangularShape;->getVertexBuffer()Lorg/anddev/andengine/opengl/vertex/VertexBuffer;

    move-result-object v0

    check-cast v0, Lorg/anddev/andengine/opengl/vertex/TextVertexBuffer;

    return-object v0
.end method

.method public bridge synthetic getVertexBuffer()Lorg/anddev/andengine/opengl/vertex/VertexBuffer;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/text/Text;->getVertexBuffer()Lorg/anddev/andengine/opengl/vertex/TextVertexBuffer;

    move-result-object v0

    return-object v0
.end method

.method protected onApplyTransformations(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 0
    .parameter "pGL"

    .prologue
    .line 148
    invoke-super {p0, p1}, Lorg/anddev/andengine/entity/shape/RectangularShape;->onApplyTransformations(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 149
    invoke-direct {p0, p1}, Lorg/anddev/andengine/entity/text/Text;->applyTexture(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 150
    return-void
.end method

.method protected onInitDraw(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 0
    .parameter "pGL"

    .prologue
    .line 128
    invoke-super {p0, p1}, Lorg/anddev/andengine/entity/shape/RectangularShape;->onInitDraw(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 129
    invoke-static {p1}, Lorg/anddev/andengine/opengl/util/GLHelper;->enableTextures(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 130
    invoke-static {p1}, Lorg/anddev/andengine/opengl/util/GLHelper;->enableTexCoordArray(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 131
    return-void
.end method

.method protected onUpdateVertexBuffer()V
    .locals 5

    .prologue
    .line 140
    iget-object v0, p0, Lorg/anddev/andengine/entity/text/Text;->mFont:Lorg/anddev/andengine/opengl/font/Font;

    .line 141
    .local v0, font:Lorg/anddev/andengine/opengl/font/Font;
    if-eqz v0, :cond_0

    .line 142
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/text/Text;->getVertexBuffer()Lorg/anddev/andengine/opengl/vertex/TextVertexBuffer;

    move-result-object v1

    iget v2, p0, Lorg/anddev/andengine/entity/text/Text;->mMaximumLineWidth:I

    iget-object v3, p0, Lorg/anddev/andengine/entity/text/Text;->mWidths:[I

    iget-object v4, p0, Lorg/anddev/andengine/entity/text/Text;->mLines:[Ljava/lang/String;

    invoke-virtual {v1, v0, v2, v3, v4}, Lorg/anddev/andengine/opengl/vertex/TextVertexBuffer;->update(Lorg/anddev/andengine/opengl/font/Font;I[I[Ljava/lang/String;)V

    .line 144
    :cond_0
    return-void
.end method

.method protected updateText(Ljava/lang/String;)V
    .locals 13
    .parameter "pText"

    .prologue
    const/high16 v12, 0x3f00

    .line 70
    iput-object p1, p0, Lorg/anddev/andengine/entity/text/Text;->mText:Ljava/lang/String;

    .line 71
    iget-object v0, p0, Lorg/anddev/andengine/entity/text/Text;->mFont:Lorg/anddev/andengine/opengl/font/Font;

    .line 73
    .local v0, font:Lorg/anddev/andengine/opengl/font/Font;
    iget-object v9, p0, Lorg/anddev/andengine/entity/text/Text;->mText:Ljava/lang/String;

    const/16 v10, 0xa

    iget-object v11, p0, Lorg/anddev/andengine/entity/text/Text;->mLines:[Ljava/lang/String;

    invoke-static {v9, v10, v11}, Lorg/anddev/andengine/util/StringUtils;->split(Ljava/lang/String;C[Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v9

    iput-object v9, p0, Lorg/anddev/andengine/entity/text/Text;->mLines:[Ljava/lang/String;

    .line 74
    iget-object v4, p0, Lorg/anddev/andengine/entity/text/Text;->mLines:[Ljava/lang/String;

    .line 76
    .local v4, lines:[Ljava/lang/String;
    array-length v3, v4

    .line 77
    .local v3, lineCount:I
    iget-object v9, p0, Lorg/anddev/andengine/entity/text/Text;->mWidths:[I

    if-eqz v9, :cond_1

    iget-object v9, p0, Lorg/anddev/andengine/entity/text/Text;->mWidths:[I

    array-length v9, v9

    if-ne v9, v3, :cond_1

    const/4 v8, 0x1

    .line 78
    .local v8, widthsReusable:Z
    :goto_0
    if-nez v8, :cond_0

    .line 79
    new-array v9, v3, [I

    iput-object v9, p0, Lorg/anddev/andengine/entity/text/Text;->mWidths:[I

    .line 81
    :cond_0
    iget-object v7, p0, Lorg/anddev/andengine/entity/text/Text;->mWidths:[I

    .line 83
    .local v7, widths:[I
    const/4 v5, 0x0

    .line 85
    .local v5, maximumLineWidth:I
    add-int/lit8 v2, v3, -0x1

    .local v2, i:I
    :goto_1
    if-gez v2, :cond_2

    .line 89
    iput v5, p0, Lorg/anddev/andengine/entity/text/Text;->mMaximumLineWidth:I

    .line 91
    iget v9, p0, Lorg/anddev/andengine/entity/text/Text;->mMaximumLineWidth:I

    int-to-float v9, v9

    iput v9, p0, Lorg/anddev/andengine/entity/shape/RectangularShape;->mWidth:F

    .line 92
    iget v6, p0, Lorg/anddev/andengine/entity/shape/RectangularShape;->mWidth:F

    .line 93
    .local v6, width:F
    iput v6, p0, Lorg/anddev/andengine/entity/shape/RectangularShape;->mBaseWidth:F

    .line 95
    invoke-virtual {v0}, Lorg/anddev/andengine/opengl/font/Font;->getLineHeight()I

    move-result v9

    mul-int/2addr v9, v3

    add-int/lit8 v10, v3, -0x1

    invoke-virtual {v0}, Lorg/anddev/andengine/opengl/font/Font;->getLineGap()I

    move-result v11

    mul-int/2addr v10, v11

    add-int/2addr v9, v10

    int-to-float v9, v9

    iput v9, p0, Lorg/anddev/andengine/entity/shape/RectangularShape;->mHeight:F

    .line 96
    iget v1, p0, Lorg/anddev/andengine/entity/shape/RectangularShape;->mHeight:F

    .line 97
    .local v1, height:F
    iput v1, p0, Lorg/anddev/andengine/entity/shape/RectangularShape;->mBaseHeight:F

    .line 99
    mul-float v9, v6, v12

    iput v9, p0, Lorg/anddev/andengine/entity/text/Text;->mRotationCenterX:F

    .line 100
    mul-float v9, v1, v12

    iput v9, p0, Lorg/anddev/andengine/entity/text/Text;->mRotationCenterY:F

    .line 102
    iget v9, p0, Lorg/anddev/andengine/entity/text/Text;->mRotationCenterX:F

    iput v9, p0, Lorg/anddev/andengine/entity/text/Text;->mScaleCenterX:F

    .line 103
    iget v9, p0, Lorg/anddev/andengine/entity/text/Text;->mRotationCenterY:F

    iput v9, p0, Lorg/anddev/andengine/entity/text/Text;->mScaleCenterY:F

    .line 105
    iget-object v9, p0, Lorg/anddev/andengine/entity/text/Text;->mTextTextureBuffer:Lorg/anddev/andengine/opengl/texture/buffer/TextTextureBuffer;

    invoke-virtual {v9, v0, v4}, Lorg/anddev/andengine/opengl/texture/buffer/TextTextureBuffer;->update(Lorg/anddev/andengine/opengl/font/Font;[Ljava/lang/String;)V

    .line 106
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/text/Text;->updateVertexBuffer()V

    .line 107
    return-void

    .line 77
    .end local v1           #height:F
    .end local v2           #i:I
    .end local v5           #maximumLineWidth:I
    .end local v6           #width:F
    .end local v7           #widths:[I
    .end local v8           #widthsReusable:Z
    :cond_1
    const/4 v8, 0x0

    goto :goto_0

    .line 86
    .restart local v2       #i:I
    .restart local v5       #maximumLineWidth:I
    .restart local v7       #widths:[I
    .restart local v8       #widthsReusable:Z
    :cond_2
    aget-object v9, v4, v2

    invoke-virtual {v0, v9}, Lorg/anddev/andengine/opengl/font/Font;->getStringWidth(Ljava/lang/String;)I

    move-result v9

    aput v9, v7, v2

    .line 87
    aget v9, v7, v2

    invoke-static {v5, v9}, Ljava/lang/Math;->max(II)I

    move-result v5

    .line 85
    add-int/lit8 v2, v2, -0x1

    goto :goto_1
.end method
