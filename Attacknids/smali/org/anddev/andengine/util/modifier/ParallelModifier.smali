.class public Lorg/anddev/andengine/util/modifier/ParallelModifier;
.super Lorg/anddev/andengine/util/modifier/BaseModifier;
.source "ParallelModifier.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/anddev/andengine/util/modifier/ParallelModifier$InternalModifierListener;
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


# instance fields
.field private final mDuration:F

.field private mFinishedCached:Z

.field private final mModifiers:[Lorg/anddev/andengine/util/modifier/IModifier;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lorg/anddev/andengine/util/modifier/IModifier",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public varargs constructor <init>(Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;[Lorg/anddev/andengine/util/modifier/IModifier;)V
    .locals 3
    .parameter
    .parameter "pModifiers"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener",
            "<TT;>;[",
            "Lorg/anddev/andengine/util/modifier/IModifier",
            "<TT;>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 34
    .local p0, this:Lorg/anddev/andengine/util/modifier/ParallelModifier;,"Lorg/anddev/andengine/util/modifier/ParallelModifier<TT;>;"
    .local p1, pModifierListener:Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;,"Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener<TT;>;"
    invoke-direct {p0, p1}, Lorg/anddev/andengine/util/modifier/BaseModifier;-><init>(Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;)V

    .line 35
    array-length v1, p2

    if-nez v1, :cond_0

    .line 36
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "pModifiers must not be empty!"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 39
    :cond_0
    iput-object p2, p0, Lorg/anddev/andengine/util/modifier/ParallelModifier;->mModifiers:[Lorg/anddev/andengine/util/modifier/IModifier;

    .line 41
    invoke-static {p2}, Lorg/anddev/andengine/util/modifier/util/ModifierUtils;->getModifierWithLongestDuration([Lorg/anddev/andengine/util/modifier/IModifier;)Lorg/anddev/andengine/util/modifier/IModifier;

    move-result-object v0

    .line 42
    .local v0, shapeModifierWithLongestDuration:Lorg/anddev/andengine/util/modifier/IModifier;,"Lorg/anddev/andengine/util/modifier/IModifier<TT;>;"
    invoke-interface {v0}, Lorg/anddev/andengine/util/modifier/IModifier;->getDuration()F

    move-result v1

    iput v1, p0, Lorg/anddev/andengine/util/modifier/ParallelModifier;->mDuration:F

    .line 43
    new-instance v1, Lorg/anddev/andengine/util/modifier/ParallelModifier$InternalModifierListener;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lorg/anddev/andengine/util/modifier/ParallelModifier$InternalModifierListener;-><init>(Lorg/anddev/andengine/util/modifier/ParallelModifier;Lorg/anddev/andengine/util/modifier/ParallelModifier$InternalModifierListener;)V

    invoke-interface {v0, v1}, Lorg/anddev/andengine/util/modifier/IModifier;->setModifierListener(Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;)V

    .line 44
    return-void
.end method

.method protected constructor <init>(Lorg/anddev/andengine/util/modifier/ParallelModifier;)V
    .locals 6
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/anddev/andengine/util/modifier/ParallelModifier",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 48
    .local p0, this:Lorg/anddev/andengine/util/modifier/ParallelModifier;,"Lorg/anddev/andengine/util/modifier/ParallelModifier<TT;>;"
    .local p1, pParallelModifier:Lorg/anddev/andengine/util/modifier/ParallelModifier;,"Lorg/anddev/andengine/util/modifier/ParallelModifier<TT;>;"
    iget-object v4, p1, Lorg/anddev/andengine/util/modifier/ParallelModifier;->mModifierListener:Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;

    invoke-direct {p0, v4}, Lorg/anddev/andengine/util/modifier/BaseModifier;-><init>(Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;)V

    .line 50
    iget-object v1, p1, Lorg/anddev/andengine/util/modifier/ParallelModifier;->mModifiers:[Lorg/anddev/andengine/util/modifier/IModifier;

    .line 51
    .local v1, otherModifiers:[Lorg/anddev/andengine/util/modifier/IModifier;
    array-length v4, v1

    new-array v4, v4, [Lorg/anddev/andengine/util/modifier/IModifier;

    iput-object v4, p0, Lorg/anddev/andengine/util/modifier/ParallelModifier;->mModifiers:[Lorg/anddev/andengine/util/modifier/IModifier;

    .line 53
    iget-object v3, p0, Lorg/anddev/andengine/util/modifier/ParallelModifier;->mModifiers:[Lorg/anddev/andengine/util/modifier/IModifier;

    .line 54
    .local v3, shapeModifiers:[Lorg/anddev/andengine/util/modifier/IModifier;
    array-length v4, v3

    add-int/lit8 v0, v4, -0x1

    .local v0, i:I
    :goto_0
    if-gez v0, :cond_0

    .line 58
    invoke-static {v3}, Lorg/anddev/andengine/util/modifier/util/ModifierUtils;->getModifierWithLongestDuration([Lorg/anddev/andengine/util/modifier/IModifier;)Lorg/anddev/andengine/util/modifier/IModifier;

    move-result-object v2

    .line 59
    .local v2, shapeModifierWithLongestDuration:Lorg/anddev/andengine/util/modifier/IModifier;,"Lorg/anddev/andengine/util/modifier/IModifier<TT;>;"
    invoke-interface {v2}, Lorg/anddev/andengine/util/modifier/IModifier;->getDuration()F

    move-result v4

    iput v4, p0, Lorg/anddev/andengine/util/modifier/ParallelModifier;->mDuration:F

    .line 60
    new-instance v4, Lorg/anddev/andengine/util/modifier/ParallelModifier$InternalModifierListener;

    const/4 v5, 0x0

    invoke-direct {v4, p0, v5}, Lorg/anddev/andengine/util/modifier/ParallelModifier$InternalModifierListener;-><init>(Lorg/anddev/andengine/util/modifier/ParallelModifier;Lorg/anddev/andengine/util/modifier/ParallelModifier$InternalModifierListener;)V

    invoke-interface {v2, v4}, Lorg/anddev/andengine/util/modifier/IModifier;->setModifierListener(Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;)V

    .line 61
    return-void

    .line 55
    .end local v2           #shapeModifierWithLongestDuration:Lorg/anddev/andengine/util/modifier/IModifier;,"Lorg/anddev/andengine/util/modifier/IModifier<TT;>;"
    :cond_0
    aget-object v4, v1, v0

    invoke-interface {v4}, Lorg/anddev/andengine/util/modifier/IModifier;->clone()Lorg/anddev/andengine/util/modifier/IModifier;

    move-result-object v4

    aput-object v4, v3, v0

    .line 54
    add-int/lit8 v0, v0, -0x1

    goto :goto_0
.end method

.method public varargs constructor <init>([Lorg/anddev/andengine/util/modifier/IModifier;)V
    .locals 1
    .parameter "pModifiers"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lorg/anddev/andengine/util/modifier/IModifier",
            "<TT;>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 30
    .local p0, this:Lorg/anddev/andengine/util/modifier/ParallelModifier;,"Lorg/anddev/andengine/util/modifier/ParallelModifier<TT;>;"
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lorg/anddev/andengine/util/modifier/ParallelModifier;-><init>(Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;[Lorg/anddev/andengine/util/modifier/IModifier;)V

    .line 31
    return-void
.end method

.method static synthetic access$1(Lorg/anddev/andengine/util/modifier/ParallelModifier;Z)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 23
    iput-boolean p1, p0, Lorg/anddev/andengine/util/modifier/ParallelModifier;->mFinishedCached:Z

    return-void
.end method


# virtual methods
.method public bridge synthetic clone()Lorg/anddev/andengine/util/modifier/IModifier;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/anddev/andengine/util/modifier/ParallelModifier;->clone()Lorg/anddev/andengine/util/modifier/ParallelModifier;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lorg/anddev/andengine/util/modifier/ParallelModifier;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/anddev/andengine/util/modifier/ParallelModifier",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 65
    .local p0, this:Lorg/anddev/andengine/util/modifier/ParallelModifier;,"Lorg/anddev/andengine/util/modifier/ParallelModifier<TT;>;"
    new-instance v0, Lorg/anddev/andengine/util/modifier/ParallelModifier;

    invoke-direct {v0, p0}, Lorg/anddev/andengine/util/modifier/ParallelModifier;-><init>(Lorg/anddev/andengine/util/modifier/ParallelModifier;)V

    return-object v0
.end method

.method public getDuration()F
    .locals 1

    .prologue
    .line 78
    .local p0, this:Lorg/anddev/andengine/util/modifier/ParallelModifier;,"Lorg/anddev/andengine/util/modifier/ParallelModifier<TT;>;"
    iget v0, p0, Lorg/anddev/andengine/util/modifier/ParallelModifier;->mDuration:F

    return v0
.end method

.method public onUpdate(FLjava/lang/Object;)V
    .locals 4
    .parameter "pSecondsElapsed"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(FTT;)V"
        }
    .end annotation

    .prologue
    .local p0, this:Lorg/anddev/andengine/util/modifier/ParallelModifier;,"Lorg/anddev/andengine/util/modifier/ParallelModifier<TT;>;"
    .local p2, pItem:Ljava/lang/Object;,"TT;"
    const/4 v3, 0x0

    .line 83
    iput-boolean v3, p0, Lorg/anddev/andengine/util/modifier/ParallelModifier;->mFinishedCached:Z

    .line 85
    iget-object v1, p0, Lorg/anddev/andengine/util/modifier/ParallelModifier;->mModifiers:[Lorg/anddev/andengine/util/modifier/IModifier;

    .line 86
    .local v1, shapeModifiers:[Lorg/anddev/andengine/util/modifier/IModifier;
    array-length v2, v1

    add-int/lit8 v0, v2, -0x1

    .local v0, i:I
    :goto_0
    if-gez v0, :cond_1

    .line 94
    iput-boolean v3, p0, Lorg/anddev/andengine/util/modifier/ParallelModifier;->mFinishedCached:Z

    .line 95
    :cond_0
    return-void

    .line 87
    :cond_1
    aget-object v2, v1, v0

    invoke-interface {v2, p1, p2}, Lorg/anddev/andengine/util/modifier/IModifier;->onUpdate(FLjava/lang/Object;)V

    .line 89
    iget-boolean v2, p0, Lorg/anddev/andengine/util/modifier/ParallelModifier;->mFinishedCached:Z

    if-nez v2, :cond_0

    .line 86
    add-int/lit8 v0, v0, -0x1

    goto :goto_0
.end method

.method public reset()V
    .locals 3

    .prologue
    .line 99
    .local p0, this:Lorg/anddev/andengine/util/modifier/ParallelModifier;,"Lorg/anddev/andengine/util/modifier/ParallelModifier<TT;>;"
    const/4 v2, 0x0

    iput-boolean v2, p0, Lorg/anddev/andengine/util/modifier/ParallelModifier;->mFinished:Z

    .line 101
    iget-object v1, p0, Lorg/anddev/andengine/util/modifier/ParallelModifier;->mModifiers:[Lorg/anddev/andengine/util/modifier/IModifier;

    .line 102
    .local v1, shapeModifiers:[Lorg/anddev/andengine/util/modifier/IModifier;
    array-length v2, v1

    add-int/lit8 v0, v2, -0x1

    .local v0, i:I
    :goto_0
    if-gez v0, :cond_0

    .line 105
    return-void

    .line 103
    :cond_0
    aget-object v2, v1, v0

    invoke-interface {v2}, Lorg/anddev/andengine/util/modifier/IModifier;->reset()V

    .line 102
    add-int/lit8 v0, v0, -0x1

    goto :goto_0
.end method
