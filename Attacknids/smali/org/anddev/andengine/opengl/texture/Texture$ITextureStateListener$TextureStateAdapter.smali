.class public Lorg/anddev/andengine/opengl/texture/Texture$ITextureStateListener$TextureStateAdapter;
.super Ljava/lang/Object;
.source "Texture.java"

# interfaces
.implements Lorg/anddev/andengine/opengl/texture/Texture$ITextureStateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/anddev/andengine/opengl/texture/Texture$ITextureStateListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TextureStateAdapter"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 287
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLoadedToHardware(Lorg/anddev/andengine/opengl/texture/Texture;)V
    .locals 0
    .parameter "pTexture"

    .prologue
    .line 289
    return-void
.end method

.method public onTextureSourceLoadExeption(Lorg/anddev/andengine/opengl/texture/Texture;Lorg/anddev/andengine/opengl/texture/source/ITextureSource;Ljava/lang/Throwable;)V
    .locals 0
    .parameter "pTexture"
    .parameter "pTextureSource"
    .parameter "pThrowable"

    .prologue
    .line 292
    return-void
.end method

.method public onUnloadedFromHardware(Lorg/anddev/andengine/opengl/texture/Texture;)V
    .locals 0
    .parameter "pTexture"

    .prologue
    .line 295
    return-void
.end method
