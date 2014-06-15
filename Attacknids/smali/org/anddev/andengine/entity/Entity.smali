.class public abstract Lorg/anddev/andengine/entity/Entity;
.super Ljava/lang/Object;
.source "Entity.java"

# interfaces
.implements Lorg/anddev/andengine/entity/IEntity;


# instance fields
.field private mIgnoreUpdate:Z

.field private mVisible:Z

.field private mZIndex:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/anddev/andengine/entity/Entity;->mVisible:Z

    .line 23
    const/4 v0, 0x0

    iput v0, p0, Lorg/anddev/andengine/entity/Entity;->mZIndex:I

    .line 31
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .parameter "pZIndex"

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/anddev/andengine/entity/Entity;->mVisible:Z

    .line 23
    const/4 v0, 0x0

    iput v0, p0, Lorg/anddev/andengine/entity/Entity;->mZIndex:I

    .line 34
    iput p1, p0, Lorg/anddev/andengine/entity/Entity;->mZIndex:I

    .line 35
    return-void
.end method


# virtual methods
.method public getZIndex()I
    .locals 1

    .prologue
    .line 59
    iget v0, p0, Lorg/anddev/andengine/entity/Entity;->mZIndex:I

    return v0
.end method

.method public isIgnoreUpdate()Z
    .locals 1

    .prologue
    .line 50
    iget-boolean v0, p0, Lorg/anddev/andengine/entity/Entity;->mIgnoreUpdate:Z

    return v0
.end method

.method public isVisible()Z
    .locals 1

    .prologue
    .line 42
    iget-boolean v0, p0, Lorg/anddev/andengine/entity/Entity;->mVisible:Z

    return v0
.end method

.method public final onDraw(Ljavax/microedition/khronos/opengles/GL10;Lorg/anddev/andengine/engine/camera/Camera;)V
    .locals 1
    .parameter "pGL"
    .parameter "pCamera"

    .prologue
    .line 75
    iget-boolean v0, p0, Lorg/anddev/andengine/entity/Entity;->mVisible:Z

    if-eqz v0, :cond_0

    .line 76
    invoke-virtual {p0, p1, p2}, Lorg/anddev/andengine/entity/Entity;->onManagedDraw(Ljavax/microedition/khronos/opengles/GL10;Lorg/anddev/andengine/engine/camera/Camera;)V

    .line 78
    :cond_0
    return-void
.end method

.method protected abstract onManagedDraw(Ljavax/microedition/khronos/opengles/GL10;Lorg/anddev/andengine/engine/camera/Camera;)V
.end method

.method protected abstract onManagedUpdate(F)V
.end method

.method public final onUpdate(F)V
    .locals 1
    .parameter "pSecondsElapsed"

    .prologue
    .line 84
    iget-boolean v0, p0, Lorg/anddev/andengine/entity/Entity;->mIgnoreUpdate:Z

    if-nez v0, :cond_0

    .line 85
    invoke-virtual {p0, p1}, Lorg/anddev/andengine/entity/Entity;->onManagedUpdate(F)V

    .line 87
    :cond_0
    return-void
.end method

.method public reset()V
    .locals 1

    .prologue
    .line 95
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/anddev/andengine/entity/Entity;->mVisible:Z

    .line 96
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/anddev/andengine/entity/Entity;->mIgnoreUpdate:Z

    .line 97
    return-void
.end method

.method public setIgnoreUpdate(Z)V
    .locals 0
    .parameter "pIgnoreUpdate"

    .prologue
    .line 54
    iput-boolean p1, p0, Lorg/anddev/andengine/entity/Entity;->mIgnoreUpdate:Z

    .line 55
    return-void
.end method

.method public setVisible(Z)V
    .locals 0
    .parameter "pVisible"

    .prologue
    .line 46
    iput-boolean p1, p0, Lorg/anddev/andengine/entity/Entity;->mVisible:Z

    .line 47
    return-void
.end method

.method public setZIndex(I)V
    .locals 0
    .parameter "pZIndex"

    .prologue
    .line 64
    iput p1, p0, Lorg/anddev/andengine/entity/Entity;->mZIndex:I

    .line 65
    return-void
.end method
