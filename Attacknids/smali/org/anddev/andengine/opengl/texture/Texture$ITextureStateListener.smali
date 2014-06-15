.class public interface abstract Lorg/anddev/andengine/opengl/texture/Texture$ITextureStateListener;
.super Ljava/lang/Object;
.source "Texture.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/anddev/andengine/opengl/texture/Texture;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "ITextureStateListener"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/anddev/andengine/opengl/texture/Texture$ITextureStateListener$DebugTextureStateListener;,
        Lorg/anddev/andengine/opengl/texture/Texture$ITextureStateListener$TextureStateAdapter;
    }
.end annotation


# virtual methods
.method public abstract onLoadedToHardware(Lorg/anddev/andengine/opengl/texture/Texture;)V
.end method

.method public abstract onTextureSourceLoadExeption(Lorg/anddev/andengine/opengl/texture/Texture;Lorg/anddev/andengine/opengl/texture/source/ITextureSource;Ljava/lang/Throwable;)V
.end method

.method public abstract onUnloadedFromHardware(Lorg/anddev/andengine/opengl/texture/Texture;)V
.end method
