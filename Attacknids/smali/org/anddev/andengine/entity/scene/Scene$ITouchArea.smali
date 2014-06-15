.class public interface abstract Lorg/anddev/andengine/entity/scene/Scene$ITouchArea;
.super Ljava/lang/Object;
.source "Scene.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/anddev/andengine/entity/scene/Scene;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "ITouchArea"
.end annotation


# virtual methods
.method public abstract contains(FF)Z
.end method

.method public abstract convertLocalToSceneCoordinates(FF)[F
.end method

.method public abstract convertSceneToLocalCoordinates(FF)[F
.end method

.method public abstract onAreaTouched(Lorg/anddev/andengine/input/touch/TouchEvent;FF)Z
.end method
