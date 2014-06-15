.class public interface abstract Lorg/anddev/andengine/opengl/texture/builder/ITextureBuilder;
.super Ljava/lang/Object;
.source "ITextureBuilder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/anddev/andengine/opengl/texture/builder/ITextureBuilder$TextureSourcePackingException;
    }
.end annotation


# virtual methods
.method public abstract pack(Lorg/anddev/andengine/opengl/texture/BuildableTexture;Ljava/util/ArrayList;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/anddev/andengine/opengl/texture/BuildableTexture;",
            "Ljava/util/ArrayList",
            "<",
            "Lorg/anddev/andengine/opengl/texture/BuildableTexture$TextureSourceWithWithLocationCallback;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/anddev/andengine/opengl/texture/builder/ITextureBuilder$TextureSourcePackingException;
        }
    .end annotation
.end method
