.class public Lorg/anddev/andengine/opengl/texture/source/EmptyBitmapTextureSource;
.super Ljava/lang/Object;
.source "EmptyBitmapTextureSource.java"

# interfaces
.implements Lorg/anddev/andengine/opengl/texture/source/ITextureSource;


# instance fields
.field private final mHeight:I

.field private final mWidth:I


# direct methods
.method public constructor <init>(II)V
    .locals 0
    .parameter "pWidth"
    .parameter "pHeight"

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput p1, p0, Lorg/anddev/andengine/opengl/texture/source/EmptyBitmapTextureSource;->mWidth:I

    .line 28
    iput p2, p0, Lorg/anddev/andengine/opengl/texture/source/EmptyBitmapTextureSource;->mHeight:I

    .line 29
    return-void
.end method


# virtual methods
.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/source/EmptyBitmapTextureSource;->clone()Lorg/anddev/andengine/opengl/texture/source/EmptyBitmapTextureSource;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lorg/anddev/andengine/opengl/texture/source/EmptyBitmapTextureSource;
    .locals 3

    .prologue
    .line 33
    new-instance v0, Lorg/anddev/andengine/opengl/texture/source/EmptyBitmapTextureSource;

    iget v1, p0, Lorg/anddev/andengine/opengl/texture/source/EmptyBitmapTextureSource;->mWidth:I

    iget v2, p0, Lorg/anddev/andengine/opengl/texture/source/EmptyBitmapTextureSource;->mHeight:I

    invoke-direct {v0, v1, v2}, Lorg/anddev/andengine/opengl/texture/source/EmptyBitmapTextureSource;-><init>(II)V

    return-object v0
.end method

.method public bridge synthetic clone()Lorg/anddev/andengine/opengl/texture/source/ITextureSource;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/source/EmptyBitmapTextureSource;->clone()Lorg/anddev/andengine/opengl/texture/source/EmptyBitmapTextureSource;

    move-result-object v0

    return-object v0
.end method

.method public getHeight()I
    .locals 1

    .prologue
    .line 46
    iget v0, p0, Lorg/anddev/andengine/opengl/texture/source/EmptyBitmapTextureSource;->mHeight:I

    return v0
.end method

.method public getWidth()I
    .locals 1

    .prologue
    .line 51
    iget v0, p0, Lorg/anddev/andengine/opengl/texture/source/EmptyBitmapTextureSource;->mWidth:I

    return v0
.end method

.method public onLoadBitmap()Landroid/graphics/Bitmap;
    .locals 3

    .prologue
    .line 56
    iget v0, p0, Lorg/anddev/andengine/opengl/texture/source/EmptyBitmapTextureSource;->mWidth:I

    iget v1, p0, Lorg/anddev/andengine/opengl/texture/source/EmptyBitmapTextureSource;->mHeight:I

    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 61
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lorg/anddev/andengine/opengl/texture/source/EmptyBitmapTextureSource;->mWidth:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " x "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lorg/anddev/andengine/opengl/texture/source/EmptyBitmapTextureSource;->mHeight:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
