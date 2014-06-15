.class public Lorg/anddev/andengine/util/modifier/SequenceModifier;
.super Lorg/anddev/andengine/util/modifier/BaseModifier;
.source "SequenceModifier.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/anddev/andengine/util/modifier/SequenceModifier$ISubSequenceModifierListener;,
        Lorg/anddev/andengine/util/modifier/SequenceModifier$InternalModifierListener;
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
.field private mCurrentSubSequenceModifier:I

.field private final mDuration:F

.field private mSubSequenceModifierListener:Lorg/anddev/andengine/util/modifier/SequenceModifier$ISubSequenceModifierListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/anddev/andengine/util/modifier/SequenceModifier$ISubSequenceModifierListener",
            "<TT;>;"
        }
    .end annotation
.end field

.field private final mSubSequenceModifiers:[Lorg/anddev/andengine/util/modifier/IModifier;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lorg/anddev/andengine/util/modifier/IModifier",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public varargs constructor <init>(Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;Lorg/anddev/andengine/util/modifier/SequenceModifier$ISubSequenceModifierListener;[Lorg/anddev/andengine/util/modifier/IModifier;)V
    .locals 3
    .parameter
    .parameter
    .parameter "pModifiers"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener",
            "<TT;>;",
            "Lorg/anddev/andengine/util/modifier/SequenceModifier$ISubSequenceModifierListener",
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
    .line 39
    .local p0, this:Lorg/anddev/andengine/util/modifier/SequenceModifier;,"Lorg/anddev/andengine/util/modifier/SequenceModifier<TT;>;"
    .local p1, pModifierListener:Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;,"Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener<TT;>;"
    .local p2, pSubSequenceModifierListener:Lorg/anddev/andengine/util/modifier/SequenceModifier$ISubSequenceModifierListener;,"Lorg/anddev/andengine/util/modifier/SequenceModifier$ISubSequenceModifierListener<TT;>;"
    invoke-direct {p0, p1}, Lorg/anddev/andengine/util/modifier/BaseModifier;-><init>(Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;)V

    .line 40
    array-length v0, p3

    if-nez v0, :cond_0

    .line 41
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "pModifiers must not be empty!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 44
    :cond_0
    iput-object p2, p0, Lorg/anddev/andengine/util/modifier/SequenceModifier;->mSubSequenceModifierListener:Lorg/anddev/andengine/util/modifier/SequenceModifier$ISubSequenceModifierListener;

    .line 45
    iput-object p3, p0, Lorg/anddev/andengine/util/modifier/SequenceModifier;->mSubSequenceModifiers:[Lorg/anddev/andengine/util/modifier/IModifier;

    .line 47
    invoke-static {p3}, Lorg/anddev/andengine/util/modifier/util/ModifierUtils;->getSequenceDurationOfModifier([Lorg/anddev/andengine/util/modifier/IModifier;)F

    move-result v0

    iput v0, p0, Lorg/anddev/andengine/util/modifier/SequenceModifier;->mDuration:F

    .line 49
    const/4 v0, 0x0

    aget-object v0, p3, v0

    new-instance v1, Lorg/anddev/andengine/util/modifier/SequenceModifier$InternalModifierListener;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lorg/anddev/andengine/util/modifier/SequenceModifier$InternalModifierListener;-><init>(Lorg/anddev/andengine/util/modifier/SequenceModifier;Lorg/anddev/andengine/util/modifier/SequenceModifier$InternalModifierListener;)V

    invoke-interface {v0, v1}, Lorg/anddev/andengine/util/modifier/IModifier;->setModifierListener(Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;)V

    .line 50
    return-void
.end method

.method public varargs constructor <init>(Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;[Lorg/anddev/andengine/util/modifier/IModifier;)V
    .locals 1
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
    .line 35
    .local p0, this:Lorg/anddev/andengine/util/modifier/SequenceModifier;,"Lorg/anddev/andengine/util/modifier/SequenceModifier<TT;>;"
    .local p1, pModifierListener:Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;,"Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener<TT;>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2}, Lorg/anddev/andengine/util/modifier/SequenceModifier;-><init>(Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;Lorg/anddev/andengine/util/modifier/SequenceModifier$ISubSequenceModifierListener;[Lorg/anddev/andengine/util/modifier/IModifier;)V

    .line 36
    return-void
.end method

.method protected constructor <init>(Lorg/anddev/andengine/util/modifier/SequenceModifier;)V
    .locals 6
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/anddev/andengine/util/modifier/SequenceModifier",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 54
    .local p0, this:Lorg/anddev/andengine/util/modifier/SequenceModifier;,"Lorg/anddev/andengine/util/modifier/SequenceModifier<TT;>;"
    .local p1, pSequenceModifier:Lorg/anddev/andengine/util/modifier/SequenceModifier;,"Lorg/anddev/andengine/util/modifier/SequenceModifier<TT;>;"
    iget-object v3, p1, Lorg/anddev/andengine/util/modifier/SequenceModifier;->mModifierListener:Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;

    invoke-direct {p0, v3}, Lorg/anddev/andengine/util/modifier/BaseModifier;-><init>(Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;)V

    .line 55
    iget-object v3, p1, Lorg/anddev/andengine/util/modifier/SequenceModifier;->mSubSequenceModifierListener:Lorg/anddev/andengine/util/modifier/SequenceModifier$ISubSequenceModifierListener;

    iput-object v3, p0, Lorg/anddev/andengine/util/modifier/SequenceModifier;->mSubSequenceModifierListener:Lorg/anddev/andengine/util/modifier/SequenceModifier$ISubSequenceModifierListener;

    .line 57
    iget v3, p1, Lorg/anddev/andengine/util/modifier/SequenceModifier;->mDuration:F

    iput v3, p0, Lorg/anddev/andengine/util/modifier/SequenceModifier;->mDuration:F

    .line 59
    iget-object v1, p1, Lorg/anddev/andengine/util/modifier/SequenceModifier;->mSubSequenceModifiers:[Lorg/anddev/andengine/util/modifier/IModifier;

    .line 60
    .local v1, otherModifiers:[Lorg/anddev/andengine/util/modifier/IModifier;
    array-length v3, v1

    new-array v3, v3, [Lorg/anddev/andengine/util/modifier/IModifier;

    iput-object v3, p0, Lorg/anddev/andengine/util/modifier/SequenceModifier;->mSubSequenceModifiers:[Lorg/anddev/andengine/util/modifier/IModifier;

    .line 62
    iget-object v2, p0, Lorg/anddev/andengine/util/modifier/SequenceModifier;->mSubSequenceModifiers:[Lorg/anddev/andengine/util/modifier/IModifier;

    .line 63
    .local v2, shapeModifiers:[Lorg/anddev/andengine/util/modifier/IModifier;
    array-length v3, v2

    add-int/lit8 v0, v3, -0x1

    .local v0, i:I
    :goto_0
    if-gez v0, :cond_0

    .line 67
    const/4 v3, 0x0

    aget-object v3, v2, v3

    new-instance v4, Lorg/anddev/andengine/util/modifier/SequenceModifier$InternalModifierListener;

    const/4 v5, 0x0

    invoke-direct {v4, p0, v5}, Lorg/anddev/andengine/util/modifier/SequenceModifier$InternalModifierListener;-><init>(Lorg/anddev/andengine/util/modifier/SequenceModifier;Lorg/anddev/andengine/util/modifier/SequenceModifier$InternalModifierListener;)V

    invoke-interface {v3, v4}, Lorg/anddev/andengine/util/modifier/IModifier;->setModifierListener(Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;)V

    .line 68
    return-void

    .line 64
    :cond_0
    aget-object v3, v1, v0

    invoke-interface {v3}, Lorg/anddev/andengine/util/modifier/IModifier;->clone()Lorg/anddev/andengine/util/modifier/IModifier;

    move-result-object v3

    aput-object v3, v2, v0

    .line 63
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
    .line 31
    .local p0, this:Lorg/anddev/andengine/util/modifier/SequenceModifier;,"Lorg/anddev/andengine/util/modifier/SequenceModifier<TT;>;"
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lorg/anddev/andengine/util/modifier/SequenceModifier;-><init>(Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;[Lorg/anddev/andengine/util/modifier/IModifier;)V

    .line 32
    return-void
.end method

.method static synthetic access$1(Lorg/anddev/andengine/util/modifier/SequenceModifier;Lorg/anddev/andengine/util/modifier/SequenceModifier$InternalModifierListener;Lorg/anddev/andengine/util/modifier/IModifier;Ljava/lang/Object;)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 118
    invoke-direct {p0, p1, p2, p3}, Lorg/anddev/andengine/util/modifier/SequenceModifier;->onHandleModifierFinished(Lorg/anddev/andengine/util/modifier/SequenceModifier$InternalModifierListener;Lorg/anddev/andengine/util/modifier/IModifier;Ljava/lang/Object;)V

    return-void
.end method

.method private onHandleModifierFinished(Lorg/anddev/andengine/util/modifier/SequenceModifier$InternalModifierListener;Lorg/anddev/andengine/util/modifier/IModifier;Ljava/lang/Object;)V
    .locals 3
    .parameter
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/anddev/andengine/util/modifier/SequenceModifier",
            "<TT;>.InternalModifier",
            "Listener;",
            "Lorg/anddev/andengine/util/modifier/IModifier",
            "<TT;>;TT;)V"
        }
    .end annotation

    .prologue
    .line 119
    .local p0, this:Lorg/anddev/andengine/util/modifier/SequenceModifier;,"Lorg/anddev/andengine/util/modifier/SequenceModifier<TT;>;"
    .local p1, pInternalModifierListener:Lorg/anddev/andengine/util/modifier/SequenceModifier$InternalModifierListener;,"Lorg/anddev/andengine/util/modifier/SequenceModifier<TT;>.InternalModifierListener;"
    .local p2, pModifier:Lorg/anddev/andengine/util/modifier/IModifier;,"Lorg/anddev/andengine/util/modifier/IModifier<TT;>;"
    .local p3, pItem:Ljava/lang/Object;,"TT;"
    iget v1, p0, Lorg/anddev/andengine/util/modifier/SequenceModifier;->mCurrentSubSequenceModifier:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/anddev/andengine/util/modifier/SequenceModifier;->mCurrentSubSequenceModifier:I

    .line 121
    iget v1, p0, Lorg/anddev/andengine/util/modifier/SequenceModifier;->mCurrentSubSequenceModifier:I

    iget-object v2, p0, Lorg/anddev/andengine/util/modifier/SequenceModifier;->mSubSequenceModifiers:[Lorg/anddev/andengine/util/modifier/IModifier;

    array-length v2, v2

    if-ge v1, v2, :cond_1

    .line 122
    iget-object v1, p0, Lorg/anddev/andengine/util/modifier/SequenceModifier;->mSubSequenceModifiers:[Lorg/anddev/andengine/util/modifier/IModifier;

    iget v2, p0, Lorg/anddev/andengine/util/modifier/SequenceModifier;->mCurrentSubSequenceModifier:I

    aget-object v0, v1, v2

    .line 123
    .local v0, nextSubSequenceModifier:Lorg/anddev/andengine/util/modifier/IModifier;,"Lorg/anddev/andengine/util/modifier/IModifier<TT;>;"
    invoke-interface {v0, p1}, Lorg/anddev/andengine/util/modifier/IModifier;->setModifierListener(Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;)V

    .line 125
    iget-object v1, p0, Lorg/anddev/andengine/util/modifier/SequenceModifier;->mSubSequenceModifierListener:Lorg/anddev/andengine/util/modifier/SequenceModifier$ISubSequenceModifierListener;

    if-eqz v1, :cond_0

    .line 126
    iget-object v1, p0, Lorg/anddev/andengine/util/modifier/SequenceModifier;->mSubSequenceModifierListener:Lorg/anddev/andengine/util/modifier/SequenceModifier$ISubSequenceModifierListener;

    iget v2, p0, Lorg/anddev/andengine/util/modifier/SequenceModifier;->mCurrentSubSequenceModifier:I

    invoke-interface {v1, p2, p3, v2}, Lorg/anddev/andengine/util/modifier/SequenceModifier$ISubSequenceModifierListener;->onSubSequenceFinished(Lorg/anddev/andengine/util/modifier/IModifier;Ljava/lang/Object;I)V

    .line 135
    .end local v0           #nextSubSequenceModifier:Lorg/anddev/andengine/util/modifier/IModifier;,"Lorg/anddev/andengine/util/modifier/IModifier<TT;>;"
    :cond_0
    :goto_0
    return-void

    .line 129
    :cond_1
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/anddev/andengine/util/modifier/SequenceModifier;->mFinished:Z

    .line 131
    iget-object v1, p0, Lorg/anddev/andengine/util/modifier/SequenceModifier;->mModifierListener:Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;

    if-eqz v1, :cond_0

    .line 132
    iget-object v1, p0, Lorg/anddev/andengine/util/modifier/SequenceModifier;->mModifierListener:Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;

    invoke-interface {v1, p0, p3}, Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;->onModifierFinished(Lorg/anddev/andengine/util/modifier/IModifier;Ljava/lang/Object;)V

    goto :goto_0
.end method


# virtual methods
.method public bridge synthetic clone()Lorg/anddev/andengine/util/modifier/IModifier;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/anddev/andengine/util/modifier/SequenceModifier;->clone()Lorg/anddev/andengine/util/modifier/SequenceModifier;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lorg/anddev/andengine/util/modifier/SequenceModifier;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/anddev/andengine/util/modifier/SequenceModifier",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 72
    .local p0, this:Lorg/anddev/andengine/util/modifier/SequenceModifier;,"Lorg/anddev/andengine/util/modifier/SequenceModifier<TT;>;"
    new-instance v0, Lorg/anddev/andengine/util/modifier/SequenceModifier;

    invoke-direct {v0, p0}, Lorg/anddev/andengine/util/modifier/SequenceModifier;-><init>(Lorg/anddev/andengine/util/modifier/SequenceModifier;)V

    return-object v0
.end method

.method public getDuration()F
    .locals 1

    .prologue
    .line 93
    .local p0, this:Lorg/anddev/andengine/util/modifier/SequenceModifier;,"Lorg/anddev/andengine/util/modifier/SequenceModifier<TT;>;"
    iget v0, p0, Lorg/anddev/andengine/util/modifier/SequenceModifier;->mDuration:F

    return v0
.end method

.method public getSubSequenceModifierListener()Lorg/anddev/andengine/util/modifier/SequenceModifier$ISubSequenceModifierListener;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/anddev/andengine/util/modifier/SequenceModifier$ISubSequenceModifierListener",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 80
    .local p0, this:Lorg/anddev/andengine/util/modifier/SequenceModifier;,"Lorg/anddev/andengine/util/modifier/SequenceModifier<TT;>;"
    iget-object v0, p0, Lorg/anddev/andengine/util/modifier/SequenceModifier;->mSubSequenceModifierListener:Lorg/anddev/andengine/util/modifier/SequenceModifier$ISubSequenceModifierListener;

    return-object v0
.end method

.method public onUpdate(FLjava/lang/Object;)V
    .locals 2
    .parameter "pSecondsElapsed"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(FTT;)V"
        }
    .end annotation

    .prologue
    .line 98
    .local p0, this:Lorg/anddev/andengine/util/modifier/SequenceModifier;,"Lorg/anddev/andengine/util/modifier/SequenceModifier<TT;>;"
    .local p2, pItem:Ljava/lang/Object;,"TT;"
    iget-boolean v0, p0, Lorg/anddev/andengine/util/modifier/SequenceModifier;->mFinished:Z

    if-nez v0, :cond_0

    .line 99
    iget-object v0, p0, Lorg/anddev/andengine/util/modifier/SequenceModifier;->mSubSequenceModifiers:[Lorg/anddev/andengine/util/modifier/IModifier;

    iget v1, p0, Lorg/anddev/andengine/util/modifier/SequenceModifier;->mCurrentSubSequenceModifier:I

    aget-object v0, v0, v1

    invoke-interface {v0, p1, p2}, Lorg/anddev/andengine/util/modifier/IModifier;->onUpdate(FLjava/lang/Object;)V

    .line 101
    :cond_0
    return-void
.end method

.method public reset()V
    .locals 3

    .prologue
    .local p0, this:Lorg/anddev/andengine/util/modifier/SequenceModifier;,"Lorg/anddev/andengine/util/modifier/SequenceModifier<TT;>;"
    const/4 v2, 0x0

    .line 105
    iput v2, p0, Lorg/anddev/andengine/util/modifier/SequenceModifier;->mCurrentSubSequenceModifier:I

    .line 106
    iput-boolean v2, p0, Lorg/anddev/andengine/util/modifier/SequenceModifier;->mFinished:Z

    .line 108
    iget-object v1, p0, Lorg/anddev/andengine/util/modifier/SequenceModifier;->mSubSequenceModifiers:[Lorg/anddev/andengine/util/modifier/IModifier;

    .line 109
    .local v1, shapeModifiers:[Lorg/anddev/andengine/util/modifier/IModifier;
    array-length v2, v1

    add-int/lit8 v0, v2, -0x1

    .local v0, i:I
    :goto_0
    if-gez v0, :cond_0

    .line 112
    return-void

    .line 110
    :cond_0
    aget-object v2, v1, v0

    invoke-interface {v2}, Lorg/anddev/andengine/util/modifier/IModifier;->reset()V

    .line 109
    add-int/lit8 v0, v0, -0x1

    goto :goto_0
.end method

.method public setSubSequenceModifierListener(Lorg/anddev/andengine/util/modifier/SequenceModifier$ISubSequenceModifierListener;)V
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/anddev/andengine/util/modifier/SequenceModifier$ISubSequenceModifierListener",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 84
    .local p0, this:Lorg/anddev/andengine/util/modifier/SequenceModifier;,"Lorg/anddev/andengine/util/modifier/SequenceModifier<TT;>;"
    .local p1, pSubSequenceModifierListener:Lorg/anddev/andengine/util/modifier/SequenceModifier$ISubSequenceModifierListener;,"Lorg/anddev/andengine/util/modifier/SequenceModifier$ISubSequenceModifierListener<TT;>;"
    iput-object p1, p0, Lorg/anddev/andengine/util/modifier/SequenceModifier;->mSubSequenceModifierListener:Lorg/anddev/andengine/util/modifier/SequenceModifier$ISubSequenceModifierListener;

    .line 85
    return-void
.end method
