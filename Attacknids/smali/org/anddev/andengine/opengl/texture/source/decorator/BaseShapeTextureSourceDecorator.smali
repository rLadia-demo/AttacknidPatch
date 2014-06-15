.class public abstract Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator;
.super Lorg/anddev/andengine/opengl/texture/source/decorator/BaseTextureSourceDecorator;
.source "BaseShapeTextureSourceDecorator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;
    }
.end annotation


# instance fields
.field protected final mTextureSourceDecoratorShape:Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;


# direct methods
.method public constructor <init>(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;)V
    .locals 0
    .parameter "pTextureSource"
    .parameter "pTextureSourceDecoratorShape"

    .prologue
    .line 29
    invoke-direct {p0, p1}, Lorg/anddev/andengine/opengl/texture/source/decorator/BaseTextureSourceDecorator;-><init>(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;)V

    .line 31
    iput-object p2, p0, Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator;->mTextureSourceDecoratorShape:Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;

    .line 32
    return-void
.end method

.method public constructor <init>(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;Z)V
    .locals 0
    .parameter "pTextureSource"
    .parameter "pTextureSourceDecoratorShape"
    .parameter "pAntiAliasing"

    .prologue
    .line 35
    invoke-direct {p0, p1, p3}, Lorg/anddev/andengine/opengl/texture/source/decorator/BaseTextureSourceDecorator;-><init>(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;Z)V

    .line 37
    iput-object p2, p0, Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator;->mTextureSourceDecoratorShape:Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;

    .line 38
    return-void
.end method


# virtual methods
.method public bridge synthetic clone()Lorg/anddev/andengine/opengl/texture/source/ITextureSource;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator;->clone()Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator;

    move-result-object v0

    return-object v0
.end method

.method public abstract clone()Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator;
.end method

.method public bridge synthetic clone()Lorg/anddev/andengine/opengl/texture/source/decorator/BaseTextureSourceDecorator;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator;->clone()Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator;

    move-result-object v0

    return-object v0
.end method

.method protected onDecorateBitmap(Landroid/graphics/Canvas;)V
    .locals 2
    .parameter "pCanvas"

    .prologue
    .line 53
    iget-object v0, p0, Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator;->mTextureSourceDecoratorShape:Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;

    iget-object v1, p0, Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1, v1}, Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;->onDecorateBitmap(Landroid/graphics/Canvas;Landroid/graphics/Paint;)V

    .line 54
    return-void
.end method
