.class public interface abstract Lorg/anddev/andengine/entity/scene/background/IBackground;
.super Ljava/lang/Object;
.source "IBackground.java"

# interfaces
.implements Lorg/anddev/andengine/opengl/IDrawable;
.implements Lorg/anddev/andengine/engine/handler/IUpdateHandler;


# virtual methods
.method public abstract addBackgroundModifier(Lorg/anddev/andengine/util/modifier/IModifier;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/anddev/andengine/util/modifier/IModifier",
            "<",
            "Lorg/anddev/andengine/entity/scene/background/IBackground;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract clearBackgroundModifiers()V
.end method

.method public abstract removeBackgroundModifier(Lorg/anddev/andengine/util/modifier/IModifier;)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/anddev/andengine/util/modifier/IModifier",
            "<",
            "Lorg/anddev/andengine/entity/scene/background/IBackground;",
            ">;)Z"
        }
    .end annotation
.end method

.method public abstract setColor(FFF)V
.end method

.method public abstract setColor(FFFF)V
.end method
