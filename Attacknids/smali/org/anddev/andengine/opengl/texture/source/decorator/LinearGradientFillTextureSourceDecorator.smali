.class public Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator;
.super Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator;
.source "LinearGradientFillTextureSourceDecorator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;
    }
.end annotation


# instance fields
.field protected final mFromColor:I

.field protected final mLinearGradientDirection:Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;

.field protected final mToColor:I


# direct methods
.method public constructor <init>(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;IILorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;)V
    .locals 6
    .parameter "pTextureSource"
    .parameter "pFromColor"
    .parameter "pToColor"
    .parameter "pLinearGradientDirection"

    .prologue
    .line 31
    sget-object v2, Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;->RECTANGLE:Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;

    move-object v0, p0

    move-object v1, p1

    move v3, p2

    move v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator;-><init>(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;IILorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;)V

    .line 32
    return-void
.end method

.method public constructor <init>(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;IILorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;Z)V
    .locals 7
    .parameter "pTextureSource"
    .parameter "pFromColor"
    .parameter "pToColor"
    .parameter "pLinearGradientDirection"
    .parameter "pAntiAliasing"

    .prologue
    .line 39
    sget-object v2, Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;->RECTANGLE:Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;

    move-object v0, p0

    move-object v1, p1

    move v3, p2

    move v4, p3

    move-object v5, p4

    move v6, p5

    invoke-direct/range {v0 .. v6}, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator;-><init>(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;IILorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;Z)V

    .line 40
    return-void
.end method

.method public constructor <init>(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;IILorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;)V
    .locals 7
    .parameter "pTextureSource"
    .parameter "pTextureSourceDecoratorShape"
    .parameter "pFromColor"
    .parameter "pToColor"
    .parameter "pLinearGradientDirection"

    .prologue
    .line 35
    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v6}, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator;-><init>(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;IILorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;Z)V

    .line 36
    return-void
.end method

.method public constructor <init>(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;IILorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;Z)V
    .locals 12
    .parameter "pTextureSource"
    .parameter "pTextureSourceDecoratorShape"
    .parameter "pFromColor"
    .parameter "pToColor"
    .parameter "pLinearGradientDirection"
    .parameter "pAntiAliasing"

    .prologue
    .line 43
    move/from16 v0, p6

    invoke-direct {p0, p1, p2, v0}, Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator;-><init>(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;Z)V

    .line 44
    iput p3, p0, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator;->mFromColor:I

    .line 45
    move/from16 v0, p4

    iput v0, p0, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator;->mToColor:I

    .line 46
    move-object/from16 v0, p5

    iput-object v0, p0, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator;->mLinearGradientDirection:Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;

    .line 48
    iget-object v1, p0, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator;->mPaint:Landroid/graphics/Paint;

    sget-object v6, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v6}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 50
    invoke-interface {p1}, Lorg/anddev/andengine/opengl/texture/source/ITextureSource;->getWidth()I

    move-result v10

    .line 51
    .local v10, width:I
    invoke-interface {p1}, Lorg/anddev/andengine/opengl/texture/source/ITextureSource;->getHeight()I

    move-result v9

    .line 53
    .local v9, height:I
    invoke-virtual/range {p5 .. p5}, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;->getFromX()I

    move-result v1

    mul-int/2addr v1, v10

    int-to-float v2, v1

    .line 54
    .local v2, fromX:F
    invoke-virtual/range {p5 .. p5}, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;->getFromY()I

    move-result v1

    mul-int/2addr v1, v9

    int-to-float v3, v1

    .line 55
    .local v3, fromY:F
    invoke-virtual/range {p5 .. p5}, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;->getToX()I

    move-result v1

    mul-int/2addr v1, v10

    int-to-float v4, v1

    .line 56
    .local v4, toX:F
    invoke-virtual/range {p5 .. p5}, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;->getToY()I

    move-result v1

    mul-int/2addr v1, v9

    int-to-float v5, v1

    .line 58
    .local v5, toY:F
    iget-object v11, p0, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator;->mPaint:Landroid/graphics/Paint;

    new-instance v1, Landroid/graphics/LinearGradient;

    sget-object v8, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    move v6, p3

    move/from16 v7, p4

    invoke-direct/range {v1 .. v8}, Landroid/graphics/LinearGradient;-><init>(FFFFIILandroid/graphics/Shader$TileMode;)V

    invoke-virtual {v11, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 59
    return-void
.end method


# virtual methods
.method public bridge synthetic clone()Lorg/anddev/andengine/opengl/texture/source/ITextureSource;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator;->clone()Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator;->clone()Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator;
    .locals 7

    .prologue
    .line 63
    new-instance v0, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator;

    iget-object v1, p0, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator;->mTextureSource:Lorg/anddev/andengine/opengl/texture/source/ITextureSource;

    iget-object v2, p0, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator;->mTextureSourceDecoratorShape:Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;

    iget v3, p0, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator;->mFromColor:I

    iget v4, p0, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator;->mToColor:I

    iget-object v5, p0, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator;->mLinearGradientDirection:Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;

    iget-boolean v6, p0, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator;->mAntiAliasing:Z

    invoke-direct/range {v0 .. v6}, Lorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator;-><init>(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;IILorg/anddev/andengine/opengl/texture/source/decorator/LinearGradientFillTextureSourceDecorator$LinearGradientDirection;Z)V

    return-object v0
.end method
