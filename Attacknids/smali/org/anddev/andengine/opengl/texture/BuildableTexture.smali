.class public Lorg/anddev/andengine/opengl/texture/BuildableTexture;
.super Lorg/anddev/andengine/opengl/texture/Texture;
.source "BuildableTexture.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/anddev/andengine/opengl/texture/BuildableTexture$TextureSourceWithWithLocationCallback;
    }
.end annotation


# instance fields
.field private final mTextureSourcesToPlace:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lorg/anddev/andengine/opengl/texture/BuildableTexture$TextureSourceWithWithLocationCallback;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(II)V
    .locals 2
    .parameter "pWidth"
    .parameter "pHeight"

    .prologue
    .line 36
    sget-object v0, Lorg/anddev/andengine/opengl/texture/TextureOptions;->DEFAULT:Lorg/anddev/andengine/opengl/texture/TextureOptions;

    const/4 v1, 0x0

    invoke-direct {p0, p1, p2, v0, v1}, Lorg/anddev/andengine/opengl/texture/Texture;-><init>(IILorg/anddev/andengine/opengl/texture/TextureOptions;Lorg/anddev/andengine/opengl/texture/Texture$ITextureStateListener;)V

    .line 25
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/anddev/andengine/opengl/texture/BuildableTexture;->mTextureSourcesToPlace:Ljava/util/ArrayList;

    .line 37
    return-void
.end method

.method public constructor <init>(IILorg/anddev/andengine/opengl/texture/Texture$ITextureStateListener;)V
    .locals 1
    .parameter "pWidth"
    .parameter "pHeight"
    .parameter "pTextureStateListener"

    .prologue
    .line 45
    sget-object v0, Lorg/anddev/andengine/opengl/texture/TextureOptions;->DEFAULT:Lorg/anddev/andengine/opengl/texture/TextureOptions;

    invoke-direct {p0, p1, p2, v0, p3}, Lorg/anddev/andengine/opengl/texture/Texture;-><init>(IILorg/anddev/andengine/opengl/texture/TextureOptions;Lorg/anddev/andengine/opengl/texture/Texture$ITextureStateListener;)V

    .line 25
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/anddev/andengine/opengl/texture/BuildableTexture;->mTextureSourcesToPlace:Ljava/util/ArrayList;

    .line 46
    return-void
.end method

.method public constructor <init>(IILorg/anddev/andengine/opengl/texture/TextureOptions;)V
    .locals 1
    .parameter "pWidth"
    .parameter "pHeight"
    .parameter "pTextureOptions"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 54
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lorg/anddev/andengine/opengl/texture/Texture;-><init>(IILorg/anddev/andengine/opengl/texture/TextureOptions;Lorg/anddev/andengine/opengl/texture/Texture$ITextureStateListener;)V

    .line 25
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/anddev/andengine/opengl/texture/BuildableTexture;->mTextureSourcesToPlace:Ljava/util/ArrayList;

    .line 55
    return-void
.end method

.method public constructor <init>(IILorg/anddev/andengine/opengl/texture/TextureOptions;Lorg/anddev/andengine/opengl/texture/Texture$ITextureStateListener;)V
    .locals 1
    .parameter "pWidth"
    .parameter "pHeight"
    .parameter "pTextureOptions"
    .parameter "pTextureStateListener"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 64
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/anddev/andengine/opengl/texture/Texture;-><init>(IILorg/anddev/andengine/opengl/texture/TextureOptions;Lorg/anddev/andengine/opengl/texture/Texture$ITextureStateListener;)V

    .line 25
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/anddev/andengine/opengl/texture/BuildableTexture;->mTextureSourcesToPlace:Ljava/util/ArrayList;

    .line 65
    return-void
.end method


# virtual methods
.method public addTextureSource(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;II)Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;
    .locals 1
    .parameter "pTextureSource"
    .parameter "pTexturePositionX"
    .parameter "pTexturePositionY"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 81
    invoke-super {p0, p1, p2, p3}, Lorg/anddev/andengine/opengl/texture/Texture;->addTextureSource(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;II)Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;

    move-result-object v0

    return-object v0
.end method

.method public addTextureSource(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;Lorg/anddev/andengine/util/Callback;)V
    .locals 2
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
    .line 100
    .local p2, pCallback:Lorg/anddev/andengine/util/Callback;,"Lorg/anddev/andengine/util/Callback<Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;>;"
    iget-object v0, p0, Lorg/anddev/andengine/opengl/texture/BuildableTexture;->mTextureSourcesToPlace:Ljava/util/ArrayList;

    new-instance v1, Lorg/anddev/andengine/opengl/texture/BuildableTexture$TextureSourceWithWithLocationCallback;

    invoke-direct {v1, p1, p2}, Lorg/anddev/andengine/opengl/texture/BuildableTexture$TextureSourceWithWithLocationCallback;-><init>(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;Lorg/anddev/andengine/util/Callback;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 101
    return-void
.end method

.method public build(Lorg/anddev/andengine/opengl/texture/builder/ITextureBuilder;)V
    .locals 1
    .parameter "pTextureSourcePackingAlgorithm"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/anddev/andengine/opengl/texture/builder/ITextureBuilder$TextureSourcePackingException;
        }
    .end annotation

    .prologue
    .line 126
    iget-object v0, p0, Lorg/anddev/andengine/opengl/texture/BuildableTexture;->mTextureSourcesToPlace:Ljava/util/ArrayList;

    invoke-interface {p1, p0, v0}, Lorg/anddev/andengine/opengl/texture/builder/ITextureBuilder;->pack(Lorg/anddev/andengine/opengl/texture/BuildableTexture;Ljava/util/ArrayList;)V

    .line 127
    iget-object v0, p0, Lorg/anddev/andengine/opengl/texture/BuildableTexture;->mTextureSourcesToPlace:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 128
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/anddev/andengine/opengl/texture/BuildableTexture;->mUpdateOnHardwareNeeded:Z

    .line 129
    return-void
.end method

.method public clearTextureSources()V
    .locals 1

    .prologue
    .line 86
    invoke-super {p0}, Lorg/anddev/andengine/opengl/texture/Texture;->clearTextureSources()V

    .line 87
    iget-object v0, p0, Lorg/anddev/andengine/opengl/texture/BuildableTexture;->mTextureSourcesToPlace:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 88
    return-void
.end method

.method public removeTextureSource(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;)V
    .locals 4
    .parameter "pTextureSource"

    .prologue
    .line 108
    iget-object v2, p0, Lorg/anddev/andengine/opengl/texture/BuildableTexture;->mTextureSourcesToPlace:Ljava/util/ArrayList;

    .line 109
    .local v2, textureSources:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/opengl/texture/BuildableTexture$TextureSourceWithWithLocationCallback;>;"
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/lit8 v0, v3, -0x1

    .local v0, i:I
    :goto_0
    if-gez v0, :cond_0

    .line 117
    :goto_1
    return-void

    .line 110
    :cond_0
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/anddev/andengine/opengl/texture/BuildableTexture$TextureSourceWithWithLocationCallback;

    .line 111
    .local v1, textureSource:Lorg/anddev/andengine/opengl/texture/BuildableTexture$TextureSourceWithWithLocationCallback;
    #getter for: Lorg/anddev/andengine/opengl/texture/BuildableTexture$TextureSourceWithWithLocationCallback;->mTextureSource:Lorg/anddev/andengine/opengl/texture/source/ITextureSource;
    invoke-static {v1}, Lorg/anddev/andengine/opengl/texture/BuildableTexture$TextureSourceWithWithLocationCallback;->access$2(Lorg/anddev/andengine/opengl/texture/BuildableTexture$TextureSourceWithWithLocationCallback;)Lorg/anddev/andengine/opengl/texture/source/ITextureSource;

    move-result-object v3

    if-ne v3, p1, :cond_1

    .line 112
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 113
    const/4 v3, 0x1

    iput-boolean v3, p0, Lorg/anddev/andengine/opengl/texture/BuildableTexture;->mUpdateOnHardwareNeeded:Z

    goto :goto_1

    .line 109
    :cond_1
    add-int/lit8 v0, v0, -0x1

    goto :goto_0
.end method
