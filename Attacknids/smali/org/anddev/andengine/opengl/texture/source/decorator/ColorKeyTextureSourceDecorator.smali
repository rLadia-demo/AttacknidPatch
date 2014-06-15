.class public Lorg/anddev/andengine/opengl/texture/source/decorator/ColorKeyTextureSourceDecorator;
.super Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator;
.source "ColorKeyTextureSourceDecorator.java"


# static fields
.field private static final TOLERANCE_DEFAULT:I


# instance fields
.field private final mColorKeyColor:I


# direct methods
.method public constructor <init>(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;I)V
    .locals 1
    .parameter "pTextureSource"
    .parameter "pColorKeyColor"

    .prologue
    .line 31
    sget-object v0, Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;->RECTANGLE:Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;

    invoke-direct {p0, p1, v0, p2}, Lorg/anddev/andengine/opengl/texture/source/decorator/ColorKeyTextureSourceDecorator;-><init>(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;I)V

    .line 32
    return-void
.end method

.method public constructor <init>(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;II)V
    .locals 1
    .parameter "pTextureSource"
    .parameter "pColorKeyColor"
    .parameter "pTolerance"

    .prologue
    .line 39
    sget-object v0, Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;->RECTANGLE:Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;

    invoke-direct {p0, p1, v0, p2, p3}, Lorg/anddev/andengine/opengl/texture/source/decorator/ColorKeyTextureSourceDecorator;-><init>(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;II)V

    .line 40
    return-void
.end method

.method public constructor <init>(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;I)V
    .locals 1
    .parameter "pTextureSource"
    .parameter "pTextureSourceDecoratorShape"
    .parameter "pColorKeyColor"

    .prologue
    .line 35
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lorg/anddev/andengine/opengl/texture/source/decorator/ColorKeyTextureSourceDecorator;-><init>(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;II)V

    .line 36
    return-void
.end method

.method public constructor <init>(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;II)V
    .locals 3
    .parameter "pTextureSource"
    .parameter "pTextureSourceDecoratorShape"
    .parameter "pColorKeyColor"
    .parameter "pTolerance"

    .prologue
    .line 43
    invoke-direct {p0, p1, p2}, Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator;-><init>(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;)V

    .line 44
    iput p3, p0, Lorg/anddev/andengine/opengl/texture/source/decorator/ColorKeyTextureSourceDecorator;->mColorKeyColor:I

    .line 45
    iget-object v0, p0, Lorg/anddev/andengine/opengl/texture/source/decorator/ColorKeyTextureSourceDecorator;->mPaint:Landroid/graphics/Paint;

    new-instance v1, Landroid/graphics/AvoidXfermode;

    sget-object v2, Landroid/graphics/AvoidXfermode$Mode;->TARGET:Landroid/graphics/AvoidXfermode$Mode;

    invoke-direct {v1, p3, p4, v2}, Landroid/graphics/AvoidXfermode;-><init>(IILandroid/graphics/AvoidXfermode$Mode;)V

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 46
    iget-object v0, p0, Lorg/anddev/andengine/opengl/texture/source/decorator/ColorKeyTextureSourceDecorator;->mPaint:Landroid/graphics/Paint;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 47
    return-void
.end method


# virtual methods
.method public bridge synthetic clone()Lorg/anddev/andengine/opengl/texture/source/ITextureSource;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/source/decorator/ColorKeyTextureSourceDecorator;->clone()Lorg/anddev/andengine/opengl/texture/source/decorator/ColorKeyTextureSourceDecorator;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/source/decorator/ColorKeyTextureSourceDecorator;->clone()Lorg/anddev/andengine/opengl/texture/source/decorator/ColorKeyTextureSourceDecorator;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lorg/anddev/andengine/opengl/texture/source/decorator/ColorKeyTextureSourceDecorator;
    .locals 4

    .prologue
    .line 51
    new-instance v0, Lorg/anddev/andengine/opengl/texture/source/decorator/ColorKeyTextureSourceDecorator;

    iget-object v1, p0, Lorg/anddev/andengine/opengl/texture/source/decorator/ColorKeyTextureSourceDecorator;->mTextureSource:Lorg/anddev/andengine/opengl/texture/source/ITextureSource;

    iget-object v2, p0, Lorg/anddev/andengine/opengl/texture/source/decorator/ColorKeyTextureSourceDecorator;->mTextureSourceDecoratorShape:Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;

    iget v3, p0, Lorg/anddev/andengine/opengl/texture/source/decorator/ColorKeyTextureSourceDecorator;->mColorKeyColor:I

    invoke-direct {v0, v1, v2, v3}, Lorg/anddev/andengine/opengl/texture/source/decorator/ColorKeyTextureSourceDecorator;-><init>(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;I)V

    return-object v0
.end method
