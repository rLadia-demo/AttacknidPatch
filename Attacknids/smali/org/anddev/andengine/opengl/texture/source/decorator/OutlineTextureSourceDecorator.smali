.class public Lorg/anddev/andengine/opengl/texture/source/decorator/OutlineTextureSourceDecorator;
.super Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator;
.source "OutlineTextureSourceDecorator.java"


# instance fields
.field protected final mOutlineColor:I


# direct methods
.method public constructor <init>(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;I)V
    .locals 1
    .parameter "pTextureSource"
    .parameter "pOutlineColor"

    .prologue
    .line 27
    sget-object v0, Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;->RECTANGLE:Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;

    invoke-direct {p0, p1, v0, p2}, Lorg/anddev/andengine/opengl/texture/source/decorator/OutlineTextureSourceDecorator;-><init>(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;I)V

    .line 28
    return-void
.end method

.method public constructor <init>(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;IZ)V
    .locals 1
    .parameter "pTextureSource"
    .parameter "pOutlineColor"
    .parameter "pAntiAliasing"

    .prologue
    .line 35
    sget-object v0, Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;->RECTANGLE:Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;

    invoke-direct {p0, p1, v0, p2, p3}, Lorg/anddev/andengine/opengl/texture/source/decorator/OutlineTextureSourceDecorator;-><init>(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;IZ)V

    .line 36
    return-void
.end method

.method public constructor <init>(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;I)V
    .locals 1
    .parameter "pTextureSource"
    .parameter "pTextureSourceDecoratorShape"
    .parameter "pOutlineColor"

    .prologue
    .line 31
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lorg/anddev/andengine/opengl/texture/source/decorator/OutlineTextureSourceDecorator;-><init>(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;IZ)V

    .line 32
    return-void
.end method

.method public constructor <init>(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;IZ)V
    .locals 2
    .parameter "pTextureSource"
    .parameter "pTextureSourceDecoratorShape"
    .parameter "pOutlineColor"
    .parameter "pAntiAliasing"

    .prologue
    .line 39
    invoke-direct {p0, p1, p2, p4}, Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator;-><init>(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;Z)V

    .line 40
    iput p3, p0, Lorg/anddev/andengine/opengl/texture/source/decorator/OutlineTextureSourceDecorator;->mOutlineColor:I

    .line 42
    iget-object v0, p0, Lorg/anddev/andengine/opengl/texture/source/decorator/OutlineTextureSourceDecorator;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 43
    iget-object v0, p0, Lorg/anddev/andengine/opengl/texture/source/decorator/OutlineTextureSourceDecorator;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p3}, Landroid/graphics/Paint;->setColor(I)V

    .line 44
    return-void
.end method


# virtual methods
.method public bridge synthetic clone()Lorg/anddev/andengine/opengl/texture/source/ITextureSource;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/source/decorator/OutlineTextureSourceDecorator;->clone()Lorg/anddev/andengine/opengl/texture/source/decorator/OutlineTextureSourceDecorator;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/source/decorator/OutlineTextureSourceDecorator;->clone()Lorg/anddev/andengine/opengl/texture/source/decorator/OutlineTextureSourceDecorator;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lorg/anddev/andengine/opengl/texture/source/decorator/OutlineTextureSourceDecorator;
    .locals 5

    .prologue
    .line 48
    new-instance v0, Lorg/anddev/andengine/opengl/texture/source/decorator/OutlineTextureSourceDecorator;

    iget-object v1, p0, Lorg/anddev/andengine/opengl/texture/source/decorator/OutlineTextureSourceDecorator;->mTextureSource:Lorg/anddev/andengine/opengl/texture/source/ITextureSource;

    iget-object v2, p0, Lorg/anddev/andengine/opengl/texture/source/decorator/OutlineTextureSourceDecorator;->mTextureSourceDecoratorShape:Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;

    iget v3, p0, Lorg/anddev/andengine/opengl/texture/source/decorator/OutlineTextureSourceDecorator;->mOutlineColor:I

    iget-boolean v4, p0, Lorg/anddev/andengine/opengl/texture/source/decorator/OutlineTextureSourceDecorator;->mAntiAliasing:Z

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/anddev/andengine/opengl/texture/source/decorator/OutlineTextureSourceDecorator;-><init>(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;IZ)V

    return-object v0
.end method
