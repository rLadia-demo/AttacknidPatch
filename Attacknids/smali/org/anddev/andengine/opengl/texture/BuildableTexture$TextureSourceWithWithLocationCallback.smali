.class public Lorg/anddev/andengine/opengl/texture/BuildableTexture$TextureSourceWithWithLocationCallback;
.super Ljava/lang/Object;
.source "BuildableTexture.java"

# interfaces
.implements Lorg/anddev/andengine/opengl/texture/source/ITextureSource;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/anddev/andengine/opengl/texture/BuildableTexture;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TextureSourceWithWithLocationCallback"
.end annotation


# instance fields
.field private final mCallback:Lorg/anddev/andengine/util/Callback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/anddev/andengine/util/Callback",
            "<",
            "Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;",
            ">;"
        }
    .end annotation
.end field

.field private final mTextureSource:Lorg/anddev/andengine/opengl/texture/source/ITextureSource;


# direct methods
.method public constructor <init>(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;Lorg/anddev/andengine/util/Callback;)V
    .locals 0
    .parameter "pTextureSource"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/anddev/andengine/opengl/texture/source/ITextureSource;",
            "Lorg/anddev/andengine/util/Callback",
            "<",
            "Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 151
    .local p2, pCallback:Lorg/anddev/andengine/util/Callback;,"Lorg/anddev/andengine/util/Callback<Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 152
    iput-object p1, p0, Lorg/anddev/andengine/opengl/texture/BuildableTexture$TextureSourceWithWithLocationCallback;->mTextureSource:Lorg/anddev/andengine/opengl/texture/source/ITextureSource;

    .line 153
    iput-object p2, p0, Lorg/anddev/andengine/opengl/texture/BuildableTexture$TextureSourceWithWithLocationCallback;->mCallback:Lorg/anddev/andengine/util/Callback;

    .line 154
    return-void
.end method

.method static synthetic access$2(Lorg/anddev/andengine/opengl/texture/BuildableTexture$TextureSourceWithWithLocationCallback;)Lorg/anddev/andengine/opengl/texture/source/ITextureSource;
    .locals 1
    .parameter

    .prologue
    .line 144
    iget-object v0, p0, Lorg/anddev/andengine/opengl/texture/BuildableTexture$TextureSourceWithWithLocationCallback;->mTextureSource:Lorg/anddev/andengine/opengl/texture/source/ITextureSource;

    return-object v0
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
    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/BuildableTexture$TextureSourceWithWithLocationCallback;->clone()Lorg/anddev/andengine/opengl/texture/BuildableTexture$TextureSourceWithWithLocationCallback;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lorg/anddev/andengine/opengl/texture/BuildableTexture$TextureSourceWithWithLocationCallback;
    .locals 1

    .prologue
    .line 158
    const/4 v0, 0x0

    return-object v0
.end method

.method public bridge synthetic clone()Lorg/anddev/andengine/opengl/texture/source/ITextureSource;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/BuildableTexture$TextureSourceWithWithLocationCallback;->clone()Lorg/anddev/andengine/opengl/texture/BuildableTexture$TextureSourceWithWithLocationCallback;

    move-result-object v0

    return-object v0
.end method

.method public getCallback()Lorg/anddev/andengine/util/Callback;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/anddev/andengine/util/Callback",
            "<",
            "Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;",
            ">;"
        }
    .end annotation

    .prologue
    .line 166
    iget-object v0, p0, Lorg/anddev/andengine/opengl/texture/BuildableTexture$TextureSourceWithWithLocationCallback;->mCallback:Lorg/anddev/andengine/util/Callback;

    return-object v0
.end method

.method public getHeight()I
    .locals 1

    .prologue
    .line 184
    iget-object v0, p0, Lorg/anddev/andengine/opengl/texture/BuildableTexture$TextureSourceWithWithLocationCallback;->mTextureSource:Lorg/anddev/andengine/opengl/texture/source/ITextureSource;

    invoke-interface {v0}, Lorg/anddev/andengine/opengl/texture/source/ITextureSource;->getHeight()I

    move-result v0

    return v0
.end method

.method public getTextureSource()Lorg/anddev/andengine/opengl/texture/source/ITextureSource;
    .locals 1

    .prologue
    .line 170
    iget-object v0, p0, Lorg/anddev/andengine/opengl/texture/BuildableTexture$TextureSourceWithWithLocationCallback;->mTextureSource:Lorg/anddev/andengine/opengl/texture/source/ITextureSource;

    return-object v0
.end method

.method public getWidth()I
    .locals 1

    .prologue
    .line 179
    iget-object v0, p0, Lorg/anddev/andengine/opengl/texture/BuildableTexture$TextureSourceWithWithLocationCallback;->mTextureSource:Lorg/anddev/andengine/opengl/texture/source/ITextureSource;

    invoke-interface {v0}, Lorg/anddev/andengine/opengl/texture/source/ITextureSource;->getWidth()I

    move-result v0

    return v0
.end method

.method public onLoadBitmap()Landroid/graphics/Bitmap;
    .locals 1

    .prologue
    .line 189
    iget-object v0, p0, Lorg/anddev/andengine/opengl/texture/BuildableTexture$TextureSourceWithWithLocationCallback;->mTextureSource:Lorg/anddev/andengine/opengl/texture/source/ITextureSource;

    invoke-interface {v0}, Lorg/anddev/andengine/opengl/texture/source/ITextureSource;->onLoadBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 194
    iget-object v0, p0, Lorg/anddev/andengine/opengl/texture/BuildableTexture$TextureSourceWithWithLocationCallback;->mTextureSource:Lorg/anddev/andengine/opengl/texture/source/ITextureSource;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
