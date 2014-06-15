.class public Lorg/anddev/andengine/engine/options/TouchOptions;
.super Ljava/lang/Object;
.source "TouchOptions.java"


# instance fields
.field private mRunOnUpdateThread:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public disableRunOnUpdateThread()Lorg/anddev/andengine/engine/options/TouchOptions;
    .locals 1

    .prologue
    .line 31
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/anddev/andengine/engine/options/TouchOptions;->setRunOnUpdateThread(Z)Lorg/anddev/andengine/engine/options/TouchOptions;

    move-result-object v0

    return-object v0
.end method

.method public enableRunOnUpdateThread()Lorg/anddev/andengine/engine/options/TouchOptions;
    .locals 1

    .prologue
    .line 27
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/anddev/andengine/engine/options/TouchOptions;->setRunOnUpdateThread(Z)Lorg/anddev/andengine/engine/options/TouchOptions;

    move-result-object v0

    return-object v0
.end method

.method public isRunOnUpdateThread()Z
    .locals 1

    .prologue
    .line 43
    iget-boolean v0, p0, Lorg/anddev/andengine/engine/options/TouchOptions;->mRunOnUpdateThread:Z

    return v0
.end method

.method public setRunOnUpdateThread(Z)Lorg/anddev/andengine/engine/options/TouchOptions;
    .locals 0
    .parameter "pRunOnUpdateThread"

    .prologue
    .line 35
    iput-boolean p1, p0, Lorg/anddev/andengine/engine/options/TouchOptions;->mRunOnUpdateThread:Z

    .line 36
    return-object p0
.end method
