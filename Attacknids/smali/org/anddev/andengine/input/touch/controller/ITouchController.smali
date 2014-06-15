.class public interface abstract Lorg/anddev/andengine/input/touch/controller/ITouchController;
.super Ljava/lang/Object;
.source "ITouchController.java"

# interfaces
.implements Lorg/anddev/andengine/engine/handler/IUpdateHandler;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/anddev/andengine/input/touch/controller/ITouchController$ITouchEventCallback;
    }
.end annotation


# virtual methods
.method public abstract applyTouchOptions(Lorg/anddev/andengine/engine/options/TouchOptions;)V
.end method

.method public abstract onHandleMotionEvent(Landroid/view/MotionEvent;)Z
.end method

.method public abstract setTouchEventCallback(Lorg/anddev/andengine/input/touch/controller/ITouchController$ITouchEventCallback;)V
.end method
