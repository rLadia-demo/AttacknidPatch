.class public abstract Lorg/anddev/andengine/input/touch/detector/BaseDetector;
.super Ljava/lang/Object;
.source "BaseDetector.java"

# interfaces
.implements Lorg/anddev/andengine/entity/scene/Scene$IOnSceneTouchListener;


# instance fields
.field private mEnabled:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/anddev/andengine/input/touch/detector/BaseDetector;->mEnabled:Z

    .line 11
    return-void
.end method


# virtual methods
.method public isEnabled()Z
    .locals 1

    .prologue
    .line 31
    iget-boolean v0, p0, Lorg/anddev/andengine/input/touch/detector/BaseDetector;->mEnabled:Z

    return v0
.end method

.method protected abstract onManagedTouchEvent(Lorg/anddev/andengine/input/touch/TouchEvent;)Z
.end method

.method public onSceneTouchEvent(Lorg/anddev/andengine/entity/scene/Scene;Lorg/anddev/andengine/input/touch/TouchEvent;)Z
    .locals 1
    .parameter "pScene"
    .parameter "pSceneTouchEvent"

    .prologue
    .line 46
    invoke-virtual {p0, p2}, Lorg/anddev/andengine/input/touch/detector/BaseDetector;->onTouchEvent(Lorg/anddev/andengine/input/touch/TouchEvent;)Z

    move-result v0

    return v0
.end method

.method public final onTouchEvent(Lorg/anddev/andengine/input/touch/TouchEvent;)Z
    .locals 1
    .parameter "pSceneTouchEvent"

    .prologue
    .line 50
    iget-boolean v0, p0, Lorg/anddev/andengine/input/touch/detector/BaseDetector;->mEnabled:Z

    if-eqz v0, :cond_0

    .line 51
    invoke-virtual {p0, p1}, Lorg/anddev/andengine/input/touch/detector/BaseDetector;->onManagedTouchEvent(Lorg/anddev/andengine/input/touch/TouchEvent;)Z

    move-result v0

    .line 53
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setEnabled(Z)V
    .locals 0
    .parameter "pEnabled"

    .prologue
    .line 35
    iput-boolean p1, p0, Lorg/anddev/andengine/input/touch/detector/BaseDetector;->mEnabled:Z

    .line 36
    return-void
.end method
