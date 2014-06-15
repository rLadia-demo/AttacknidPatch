.class public Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator;
.super Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator;
.source "RadialGradientFillTextureSourceDecorator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator$RadialGradientDirection;
    }
.end annotation


# static fields
.field private static synthetic $SWITCH_TABLE$org$anddev$andengine$opengl$texture$source$decorator$RadialGradientFillTextureSourceDecorator$RadialGradientDirection:[I


# instance fields
.field protected final mFromColor:I

.field protected final mRadialGradientDirection:Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator$RadialGradientDirection;

.field protected final mToColor:I


# direct methods
.method static synthetic $SWITCH_TABLE$org$anddev$andengine$opengl$texture$source$decorator$RadialGradientFillTextureSourceDecorator$RadialGradientDirection()[I
    .locals 3

    .prologue
    .line 13
    sget-object v0, Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator;->$SWITCH_TABLE$org$anddev$andengine$opengl$texture$source$decorator$RadialGradientFillTextureSourceDecorator$RadialGradientDirection:[I

    if-eqz v0, :cond_0

    :goto_0
    return-object v0

    :cond_0
    invoke-static {}, Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator$RadialGradientDirection;->values()[Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator$RadialGradientDirection;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator$RadialGradientDirection;->INSIDE_OUT:Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator$RadialGradientDirection;

    invoke-virtual {v1}, Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator$RadialGradientDirection;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_1

    :goto_1
    :try_start_1
    sget-object v1, Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator$RadialGradientDirection;->OUTSIDE_IN:Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator$RadialGradientDirection;

    invoke-virtual {v1}, Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator$RadialGradientDirection;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_0

    :goto_2
    sput-object v0, Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator;->$SWITCH_TABLE$org$anddev$andengine$opengl$texture$source$decorator$RadialGradientFillTextureSourceDecorator$RadialGradientDirection:[I

    goto :goto_0

    :catch_0
    move-exception v1

    goto :goto_2

    :catch_1
    move-exception v1

    goto :goto_1
.end method

.method public constructor <init>(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;IILorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator$RadialGradientDirection;)V
    .locals 6
    .parameter "pTextureSource"
    .parameter "pFromColor"
    .parameter "pToColor"
    .parameter "pRadialGradientDirection"

    .prologue
    .line 31
    sget-object v2, Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;->RECTANGLE:Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;

    move-object v0, p0

    move-object v1, p1

    move v3, p2

    move v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator;-><init>(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;IILorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator$RadialGradientDirection;)V

    .line 32
    return-void
.end method

.method public constructor <init>(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;IILorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator$RadialGradientDirection;Z)V
    .locals 7
    .parameter "pTextureSource"
    .parameter "pFromColor"
    .parameter "pToColor"
    .parameter "pRadialGradientDirection"
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

    invoke-direct/range {v0 .. v6}, Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator;-><init>(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;IILorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator$RadialGradientDirection;Z)V

    .line 40
    return-void
.end method

.method public constructor <init>(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;IILorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator$RadialGradientDirection;)V
    .locals 7
    .parameter "pTextureSource"
    .parameter "pTextureSourceDecoratorShape"
    .parameter "pFromColor"
    .parameter "pToColor"
    .parameter "pRadialGradientDirection"

    .prologue
    .line 35
    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v6}, Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator;-><init>(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;IILorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator$RadialGradientDirection;Z)V

    .line 36
    return-void
.end method

.method public constructor <init>(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;IILorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator$RadialGradientDirection;Z)V
    .locals 11
    .parameter "pTextureSource"
    .parameter "pTextureSourceDecoratorShape"
    .parameter "pFromColor"
    .parameter "pToColor"
    .parameter "pRadialGradientDirection"
    .parameter "pAntiAliasing"

    .prologue
    .line 43
    move/from16 v0, p6

    invoke-direct {p0, p1, p2, v0}, Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator;-><init>(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;Z)V

    .line 44
    iput p3, p0, Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator;->mFromColor:I

    .line 45
    iput p4, p0, Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator;->mToColor:I

    .line 46
    move-object/from16 v0, p5

    iput-object v0, p0, Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator;->mRadialGradientDirection:Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator$RadialGradientDirection;

    .line 48
    iget-object v1, p0, Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator;->mPaint:Landroid/graphics/Paint;

    sget-object v5, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v5}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 50
    invoke-interface {p1}, Lorg/anddev/andengine/opengl/texture/source/ITextureSource;->getWidth()I

    move-result v9

    .line 51
    .local v9, width:I
    invoke-interface {p1}, Lorg/anddev/andengine/opengl/texture/source/ITextureSource;->getHeight()I

    move-result v8

    .line 53
    .local v8, height:I
    int-to-float v1, v9

    const/high16 v5, 0x3f00

    mul-float v2, v1, v5

    .line 54
    .local v2, centerX:F
    int-to-float v1, v8

    const/high16 v5, 0x3f00

    mul-float v3, v1, v5

    .line 56
    .local v3, centerY:F
    invoke-static {v2, v3}, Ljava/lang/Math;->max(FF)F

    move-result v4

    .line 58
    .local v4, radius:F
    invoke-static {}, Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator;->$SWITCH_TABLE$org$anddev$andengine$opengl$texture$source$decorator$RadialGradientFillTextureSourceDecorator$RadialGradientDirection()[I

    move-result-object v1

    invoke-virtual/range {p5 .. p5}, Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator$RadialGradientDirection;->ordinal()I

    move-result v5

    aget v1, v1, v5

    packed-switch v1, :pswitch_data_0

    .line 66
    :goto_0
    return-void

    .line 60
    :pswitch_0
    iget-object v10, p0, Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator;->mPaint:Landroid/graphics/Paint;

    new-instance v1, Landroid/graphics/RadialGradient;

    sget-object v7, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    move v5, p3

    move v6, p4

    invoke-direct/range {v1 .. v7}, Landroid/graphics/RadialGradient;-><init>(FFFIILandroid/graphics/Shader$TileMode;)V

    invoke-virtual {v10, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    goto :goto_0

    .line 63
    :pswitch_1
    iget-object v10, p0, Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator;->mPaint:Landroid/graphics/Paint;

    new-instance v1, Landroid/graphics/RadialGradient;

    sget-object v7, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    move v5, p4

    move v6, p3

    invoke-direct/range {v1 .. v7}, Landroid/graphics/RadialGradient;-><init>(FFFIILandroid/graphics/Shader$TileMode;)V

    invoke-virtual {v10, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    goto :goto_0

    .line 58
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method


# virtual methods
.method public bridge synthetic clone()Lorg/anddev/andengine/opengl/texture/source/ITextureSource;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator;->clone()Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator;->clone()Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator;
    .locals 7

    .prologue
    .line 70
    new-instance v0, Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator;

    iget-object v1, p0, Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator;->mTextureSource:Lorg/anddev/andengine/opengl/texture/source/ITextureSource;

    iget-object v2, p0, Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator;->mTextureSourceDecoratorShape:Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;

    iget v3, p0, Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator;->mFromColor:I

    iget v4, p0, Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator;->mToColor:I

    iget-object v5, p0, Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator;->mRadialGradientDirection:Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator$RadialGradientDirection;

    iget-boolean v6, p0, Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator;->mAntiAliasing:Z

    invoke-direct/range {v0 .. v6}, Lorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator;-><init>(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;IILorg/anddev/andengine/opengl/texture/source/decorator/RadialGradientFillTextureSourceDecorator$RadialGradientDirection;Z)V

    return-object v0
.end method
