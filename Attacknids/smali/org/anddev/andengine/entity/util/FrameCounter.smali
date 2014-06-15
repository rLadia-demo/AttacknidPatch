.class public Lorg/anddev/andengine/entity/util/FrameCounter;
.super Ljava/lang/Object;
.source "FrameCounter.java"

# interfaces
.implements Lorg/anddev/andengine/engine/handler/IUpdateHandler;


# instance fields
.field private mFrames:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getFrames()I
    .locals 1

    .prologue
    .line 29
    iget v0, p0, Lorg/anddev/andengine/entity/util/FrameCounter;->mFrames:I

    return v0
.end method

.method public onUpdate(F)V
    .locals 1
    .parameter "pSecondsElapsed"

    .prologue
    .line 38
    iget v0, p0, Lorg/anddev/andengine/entity/util/FrameCounter;->mFrames:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/anddev/andengine/entity/util/FrameCounter;->mFrames:I

    .line 39
    return-void
.end method

.method public reset()V
    .locals 1

    .prologue
    .line 43
    const/4 v0, 0x0

    iput v0, p0, Lorg/anddev/andengine/entity/util/FrameCounter;->mFrames:I

    .line 44
    return-void
.end method
