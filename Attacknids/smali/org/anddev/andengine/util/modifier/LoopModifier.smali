.class public Lorg/anddev/andengine/util/modifier/LoopModifier;
.super Lorg/anddev/andengine/util/modifier/BaseModifier;
.source "LoopModifier.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/anddev/andengine/util/modifier/LoopModifier$ILoopModifierListener;,
        Lorg/anddev/andengine/util/modifier/LoopModifier$InternalModifierListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lorg/anddev/andengine/util/modifier/BaseModifier",
        "<TT;>;"
    }
.end annotation


# static fields
.field public static final LOOP_CONTINUOUS:I = -0x1


# instance fields
.field private final mDuration:F

.field private final mInitialLoopCount:I

.field private mLoopCount:I

.field private mLoopModifierListener:Lorg/anddev/andengine/util/modifier/LoopModifier$ILoopModifierListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/anddev/andengine/util/modifier/LoopModifier$ILoopModifierListener",
            "<TT;>;"
        }
    .end annotation
.end field

.field private final mModifier:Lorg/anddev/andengine/util/modifier/IModifier;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/anddev/andengine/util/modifier/IModifier",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(ILorg/anddev/andengine/util/modifier/IModifier;)V
    .locals 1
    .parameter "pLoopCount"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lorg/anddev/andengine/util/modifier/IModifier",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 38
    .local p0, this:Lorg/anddev/andengine/util/modifier/LoopModifier;,"Lorg/anddev/andengine/util/modifier/LoopModifier<TT;>;"
    .local p2, pModifier:Lorg/anddev/andengine/util/modifier/IModifier;,"Lorg/anddev/andengine/util/modifier/IModifier<TT;>;"
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1, p2}, Lorg/anddev/andengine/util/modifier/LoopModifier;-><init>(Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;ILorg/anddev/andengine/util/modifier/IModifier;)V

    .line 39
    return-void
.end method

.method public constructor <init>(Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;ILorg/anddev/andengine/util/modifier/IModifier;)V
    .locals 1
    .parameter
    .parameter "pLoopCount"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener",
            "<TT;>;I",
            "Lorg/anddev/andengine/util/modifier/IModifier",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 42
    .local p0, this:Lorg/anddev/andengine/util/modifier/LoopModifier;,"Lorg/anddev/andengine/util/modifier/LoopModifier<TT;>;"
    .local p1, pModifierListener:Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;,"Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener<TT;>;"
    .local p3, pModifier:Lorg/anddev/andengine/util/modifier/IModifier;,"Lorg/anddev/andengine/util/modifier/IModifier<TT;>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0, p3}, Lorg/anddev/andengine/util/modifier/LoopModifier;-><init>(Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;ILorg/anddev/andengine/util/modifier/LoopModifier$ILoopModifierListener;Lorg/anddev/andengine/util/modifier/IModifier;)V

    .line 43
    return-void
.end method

.method public constructor <init>(Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;ILorg/anddev/andengine/util/modifier/LoopModifier$ILoopModifierListener;Lorg/anddev/andengine/util/modifier/IModifier;)V
    .locals 2
    .parameter
    .parameter "pLoopCount"
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener",
            "<TT;>;I",
            "Lorg/anddev/andengine/util/modifier/LoopModifier$ILoopModifierListener",
            "<TT;>;",
            "Lorg/anddev/andengine/util/modifier/IModifier",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 46
    .local p0, this:Lorg/anddev/andengine/util/modifier/LoopModifier;,"Lorg/anddev/andengine/util/modifier/LoopModifier<TT;>;"
    .local p1, pModifierListener:Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;,"Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener<TT;>;"
    .local p3, pLoopModifierListener:Lorg/anddev/andengine/util/modifier/LoopModifier$ILoopModifierListener;,"Lorg/anddev/andengine/util/modifier/LoopModifier$ILoopModifierListener<TT;>;"
    .local p4, pModifier:Lorg/anddev/andengine/util/modifier/IModifier;,"Lorg/anddev/andengine/util/modifier/IModifier<TT;>;"
    invoke-direct {p0, p1}, Lorg/anddev/andengine/util/modifier/BaseModifier;-><init>(Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;)V

    .line 47
    iput-object p3, p0, Lorg/anddev/andengine/util/modifier/LoopModifier;->mLoopModifierListener:Lorg/anddev/andengine/util/modifier/LoopModifier$ILoopModifierListener;

    .line 48
    iput-object p4, p0, Lorg/anddev/andengine/util/modifier/LoopModifier;->mModifier:Lorg/anddev/andengine/util/modifier/IModifier;

    .line 49
    iput p2, p0, Lorg/anddev/andengine/util/modifier/LoopModifier;->mInitialLoopCount:I

    .line 50
    iput p2, p0, Lorg/anddev/andengine/util/modifier/LoopModifier;->mLoopCount:I

    .line 51
    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    const/high16 v0, 0x7f80

    :goto_0
    iput v0, p0, Lorg/anddev/andengine/util/modifier/LoopModifier;->mDuration:F

    .line 53
    new-instance v0, Lorg/anddev/andengine/util/modifier/LoopModifier$InternalModifierListener;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lorg/anddev/andengine/util/modifier/LoopModifier$InternalModifierListener;-><init>(Lorg/anddev/andengine/util/modifier/LoopModifier;Lorg/anddev/andengine/util/modifier/LoopModifier$InternalModifierListener;)V

    invoke-interface {p4, v0}, Lorg/anddev/andengine/util/modifier/IModifier;->setModifierListener(Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;)V

    .line 54
    return-void

    .line 51
    :cond_0
    invoke-interface {p4}, Lorg/anddev/andengine/util/modifier/IModifier;->getDuration()F

    move-result v0

    int-to-float v1, p2

    mul-float/2addr v0, v1

    goto :goto_0
.end method

.method public constructor <init>(Lorg/anddev/andengine/util/modifier/IModifier;)V
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/anddev/andengine/util/modifier/IModifier",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 34
    .local p0, this:Lorg/anddev/andengine/util/modifier/LoopModifier;,"Lorg/anddev/andengine/util/modifier/LoopModifier<TT;>;"
    .local p1, pModifier:Lorg/anddev/andengine/util/modifier/IModifier;,"Lorg/anddev/andengine/util/modifier/IModifier<TT;>;"
    const/4 v0, 0x0

    const/4 v1, -0x1

    invoke-direct {p0, v0, v1, p1}, Lorg/anddev/andengine/util/modifier/LoopModifier;-><init>(Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;ILorg/anddev/andengine/util/modifier/IModifier;)V

    .line 35
    return-void
.end method

.method protected constructor <init>(Lorg/anddev/andengine/util/modifier/LoopModifier;)V
    .locals 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/anddev/andengine/util/modifier/LoopModifier",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 57
    .local p0, this:Lorg/anddev/andengine/util/modifier/LoopModifier;,"Lorg/anddev/andengine/util/modifier/LoopModifier<TT;>;"
    .local p1, pLoopModifier:Lorg/anddev/andengine/util/modifier/LoopModifier;,"Lorg/anddev/andengine/util/modifier/LoopModifier<TT;>;"
    iget-object v0, p1, Lorg/anddev/andengine/util/modifier/LoopModifier;->mModifierListener:Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;

    iget v1, p1, Lorg/anddev/andengine/util/modifier/LoopModifier;->mInitialLoopCount:I

    iget-object v2, p1, Lorg/anddev/andengine/util/modifier/LoopModifier;->mModifier:Lorg/anddev/andengine/util/modifier/IModifier;

    invoke-interface {v2}, Lorg/anddev/andengine/util/modifier/IModifier;->clone()Lorg/anddev/andengine/util/modifier/IModifier;

    move-result-object v2

    invoke-direct {p0, v0, v1, v2}, Lorg/anddev/andengine/util/modifier/LoopModifier;-><init>(Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;ILorg/anddev/andengine/util/modifier/IModifier;)V

    .line 58
    return-void
.end method


# virtual methods
.method public bridge synthetic clone()Lorg/anddev/andengine/util/modifier/IModifier;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/anddev/andengine/util/modifier/LoopModifier;->clone()Lorg/anddev/andengine/util/modifier/LoopModifier;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lorg/anddev/andengine/util/modifier/LoopModifier;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/anddev/andengine/util/modifier/LoopModifier",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 62
    .local p0, this:Lorg/anddev/andengine/util/modifier/LoopModifier;,"Lorg/anddev/andengine/util/modifier/LoopModifier<TT;>;"
    new-instance v0, Lorg/anddev/andengine/util/modifier/LoopModifier;

    invoke-direct {v0, p0}, Lorg/anddev/andengine/util/modifier/LoopModifier;-><init>(Lorg/anddev/andengine/util/modifier/LoopModifier;)V

    return-object v0
.end method

.method public getDuration()F
    .locals 1

    .prologue
    .line 83
    .local p0, this:Lorg/anddev/andengine/util/modifier/LoopModifier;,"Lorg/anddev/andengine/util/modifier/LoopModifier<TT;>;"
    iget v0, p0, Lorg/anddev/andengine/util/modifier/LoopModifier;->mDuration:F

    return v0
.end method

.method public getLoopModifierListener()Lorg/anddev/andengine/util/modifier/LoopModifier$ILoopModifierListener;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/anddev/andengine/util/modifier/LoopModifier$ILoopModifierListener",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 70
    .local p0, this:Lorg/anddev/andengine/util/modifier/LoopModifier;,"Lorg/anddev/andengine/util/modifier/LoopModifier<TT;>;"
    iget-object v0, p0, Lorg/anddev/andengine/util/modifier/LoopModifier;->mLoopModifierListener:Lorg/anddev/andengine/util/modifier/LoopModifier$ILoopModifierListener;

    return-object v0
.end method

.method public onHandleLoopFinished(Ljava/lang/Object;)V
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 105
    .local p0, this:Lorg/anddev/andengine/util/modifier/LoopModifier;,"Lorg/anddev/andengine/util/modifier/LoopModifier<TT;>;"
    .local p1, pItem:Ljava/lang/Object;,"TT;"
    iget-object v0, p0, Lorg/anddev/andengine/util/modifier/LoopModifier;->mLoopModifierListener:Lorg/anddev/andengine/util/modifier/LoopModifier$ILoopModifierListener;

    if-eqz v0, :cond_0

    .line 106
    iget-object v0, p0, Lorg/anddev/andengine/util/modifier/LoopModifier;->mLoopModifierListener:Lorg/anddev/andengine/util/modifier/LoopModifier$ILoopModifierListener;

    iget v1, p0, Lorg/anddev/andengine/util/modifier/LoopModifier;->mLoopCount:I

    invoke-interface {v0, p0, v1}, Lorg/anddev/andengine/util/modifier/LoopModifier$ILoopModifierListener;->onLoopFinished(Lorg/anddev/andengine/util/modifier/LoopModifier;I)V

    .line 109
    :cond_0
    iget v0, p0, Lorg/anddev/andengine/util/modifier/LoopModifier;->mInitialLoopCount:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_2

    .line 110
    iget-object v0, p0, Lorg/anddev/andengine/util/modifier/LoopModifier;->mModifier:Lorg/anddev/andengine/util/modifier/IModifier;

    invoke-interface {v0}, Lorg/anddev/andengine/util/modifier/IModifier;->reset()V

    .line 122
    :cond_1
    :goto_0
    return-void

    .line 112
    :cond_2
    iget v0, p0, Lorg/anddev/andengine/util/modifier/LoopModifier;->mLoopCount:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lorg/anddev/andengine/util/modifier/LoopModifier;->mLoopCount:I

    .line 113
    iget v0, p0, Lorg/anddev/andengine/util/modifier/LoopModifier;->mLoopCount:I

    if-gez v0, :cond_3

    .line 114
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/anddev/andengine/util/modifier/LoopModifier;->mFinished:Z

    .line 115
    iget-object v0, p0, Lorg/anddev/andengine/util/modifier/LoopModifier;->mModifierListener:Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;

    if-eqz v0, :cond_1

    .line 116
    iget-object v0, p0, Lorg/anddev/andengine/util/modifier/LoopModifier;->mModifierListener:Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;

    invoke-interface {v0, p0, p1}, Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;->onModifierFinished(Lorg/anddev/andengine/util/modifier/IModifier;Ljava/lang/Object;)V

    goto :goto_0

    .line 119
    :cond_3
    iget-object v0, p0, Lorg/anddev/andengine/util/modifier/LoopModifier;->mModifier:Lorg/anddev/andengine/util/modifier/IModifier;

    invoke-interface {v0}, Lorg/anddev/andengine/util/modifier/IModifier;->reset()V

    goto :goto_0
.end method

.method public onUpdate(FLjava/lang/Object;)V
    .locals 1
    .parameter "pSecondsElapsed"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(FTT;)V"
        }
    .end annotation

    .prologue
    .line 88
    .local p0, this:Lorg/anddev/andengine/util/modifier/LoopModifier;,"Lorg/anddev/andengine/util/modifier/LoopModifier<TT;>;"
    .local p2, pItem:Ljava/lang/Object;,"TT;"
    iget-boolean v0, p0, Lorg/anddev/andengine/util/modifier/LoopModifier;->mFinished:Z

    if-nez v0, :cond_0

    .line 89
    iget-object v0, p0, Lorg/anddev/andengine/util/modifier/LoopModifier;->mModifier:Lorg/anddev/andengine/util/modifier/IModifier;

    invoke-interface {v0, p1, p2}, Lorg/anddev/andengine/util/modifier/IModifier;->onUpdate(FLjava/lang/Object;)V

    .line 91
    :cond_0
    return-void
.end method

.method public reset()V
    .locals 1

    .prologue
    .line 95
    .local p0, this:Lorg/anddev/andengine/util/modifier/LoopModifier;,"Lorg/anddev/andengine/util/modifier/LoopModifier<TT;>;"
    iget v0, p0, Lorg/anddev/andengine/util/modifier/LoopModifier;->mInitialLoopCount:I

    iput v0, p0, Lorg/anddev/andengine/util/modifier/LoopModifier;->mLoopCount:I

    .line 97
    iget-object v0, p0, Lorg/anddev/andengine/util/modifier/LoopModifier;->mModifier:Lorg/anddev/andengine/util/modifier/IModifier;

    invoke-interface {v0}, Lorg/anddev/andengine/util/modifier/IModifier;->reset()V

    .line 98
    return-void
.end method

.method public setLoopModifierListener(Lorg/anddev/andengine/util/modifier/LoopModifier$ILoopModifierListener;)V
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/anddev/andengine/util/modifier/LoopModifier$ILoopModifierListener",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 74
    .local p0, this:Lorg/anddev/andengine/util/modifier/LoopModifier;,"Lorg/anddev/andengine/util/modifier/LoopModifier<TT;>;"
    .local p1, pLoopModifierListener:Lorg/anddev/andengine/util/modifier/LoopModifier$ILoopModifierListener;,"Lorg/anddev/andengine/util/modifier/LoopModifier$ILoopModifierListener<TT;>;"
    iput-object p1, p0, Lorg/anddev/andengine/util/modifier/LoopModifier;->mLoopModifierListener:Lorg/anddev/andengine/util/modifier/LoopModifier$ILoopModifierListener;

    .line 75
    return-void
.end method
