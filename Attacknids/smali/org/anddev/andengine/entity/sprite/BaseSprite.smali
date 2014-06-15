.class public abstract Lorg/anddev/andengine/entity/sprite/BaseSprite;
.super Lorg/anddev/andengine/entity/primitive/BaseRectangle;
.source "BaseSprite.java"


# instance fields
.field protected final mTextureRegion:Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;


# direct methods
.method public constructor <init>(FFFFLorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;)V
    .locals 0
    .parameter "pX"
    .parameter "pY"
    .parameter "pWidth"
    .parameter "pHeight"
    .parameter "pTextureRegion"

    .prologue
    .line 30
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/anddev/andengine/entity/primitive/BaseRectangle;-><init>(FFFF)V

    .line 32
    iput-object p5, p0, Lorg/anddev/andengine/entity/sprite/BaseSprite;->mTextureRegion:Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;

    .line 33
    invoke-direct {p0}, Lorg/anddev/andengine/entity/sprite/BaseSprite;->initBlendFunction()V

    .line 34
    return-void
.end method

.method public constructor <init>(FFFFLorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;Lorg/anddev/andengine/opengl/vertex/RectangleVertexBuffer;)V
    .locals 6
    .parameter "pX"
    .parameter "pY"
    .parameter "pWidth"
    .parameter "pHeight"
    .parameter "pTextureRegion"
    .parameter "pRectangleVertexBuffer"

    .prologue
    .line 37
    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move-object v5, p6

    invoke-direct/range {v0 .. v5}, Lorg/anddev/andengine/entity/primitive/BaseRectangle;-><init>(FFFFLorg/anddev/andengine/opengl/vertex/RectangleVertexBuffer;)V

    .line 39
    iput-object p5, p0, Lorg/anddev/andengine/entity/sprite/BaseSprite;->mTextureRegion:Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;

    .line 40
    invoke-direct {p0}, Lorg/anddev/andengine/entity/sprite/BaseSprite;->initBlendFunction()V

    .line 41
    return-void
.end method

.method private initBlendFunction()V
    .locals 2

    .prologue
    .line 81
    iget-object v0, p0, Lorg/anddev/andengine/entity/sprite/BaseSprite;->mTextureRegion:Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;

    invoke-virtual {v0}, Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;->getTexture()Lorg/anddev/andengine/opengl/texture/Texture;

    move-result-object v0

    invoke-virtual {v0}, Lorg/anddev/andengine/opengl/texture/Texture;->getTextureOptions()Lorg/anddev/andengine/opengl/texture/TextureOptions;

    move-result-object v0

    iget-boolean v0, v0, Lorg/anddev/andengine/opengl/texture/TextureOptions;->mPreMultipyAlpha:Z

    if-eqz v0, :cond_0

    .line 82
    const/4 v0, 0x1

    const/16 v1, 0x303

    invoke-virtual {p0, v0, v1}, Lorg/anddev/andengine/entity/sprite/BaseSprite;->setBlendFunction(II)V

    .line 84
    :cond_0
    return-void
.end method


# virtual methods
.method public getTextureRegion()Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;
    .locals 1

    .prologue
    .line 48
    iget-object v0, p0, Lorg/anddev/andengine/entity/sprite/BaseSprite;->mTextureRegion:Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;

    return-object v0
.end method

.method protected onApplyTransformations(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 1
    .parameter "pGL"

    .prologue
    .line 71
    invoke-super {p0, p1}, Lorg/anddev/andengine/entity/primitive/BaseRectangle;->onApplyTransformations(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 73
    iget-object v0, p0, Lorg/anddev/andengine/entity/sprite/BaseSprite;->mTextureRegion:Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;

    invoke-virtual {v0, p1}, Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;->onApply(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 74
    return-void
.end method

.method protected onInitDraw(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 0
    .parameter "pGL"

    .prologue
    .line 64
    invoke-super {p0, p1}, Lorg/anddev/andengine/entity/primitive/BaseRectangle;->onInitDraw(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 65
    invoke-static {p1}, Lorg/anddev/andengine/opengl/util/GLHelper;->enableTextures(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 66
    invoke-static {p1}, Lorg/anddev/andengine/opengl/util/GLHelper;->enableTexCoordArray(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 67
    return-void
.end method

.method public reset()V
    .locals 0

    .prologue
    .line 57
    invoke-super {p0}, Lorg/anddev/andengine/entity/primitive/BaseRectangle;->reset()V

    .line 59
    invoke-direct {p0}, Lorg/anddev/andengine/entity/sprite/BaseSprite;->initBlendFunction()V

    .line 60
    return-void
.end method
