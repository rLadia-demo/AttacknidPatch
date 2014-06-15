.class public abstract Lorg/anddev/andengine/util/modifier/BaseModifier;
.super Ljava/lang/Object;
.source "BaseModifier.java"

# interfaces
.implements Lorg/anddev/andengine/util/modifier/IModifier;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lorg/anddev/andengine/util/modifier/IModifier",
        "<TT;>;"
    }
.end annotation


# instance fields
.field protected mFinished:Z

.field protected mModifierListener:Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener",
            "<TT;>;"
        }
    .end annotation
.end field

.field private mRemoveWhenFinished:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 27
    .local p0, this:Lorg/anddev/andengine/util/modifier/BaseModifier;,"Lorg/anddev/andengine/util/modifier/BaseModifier<TT;>;"
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/anddev/andengine/util/modifier/BaseModifier;-><init>(Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;)V

    .line 28
    return-void
.end method

.method protected constructor <init>(Lorg/anddev/andengine/util/modifier/BaseModifier;)V
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/anddev/andengine/util/modifier/BaseModifier",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 35
    .local p0, this:Lorg/anddev/andengine/util/modifier/BaseModifier;,"Lorg/anddev/andengine/util/modifier/BaseModifier<TT;>;"
    .local p1, pBaseModifier:Lorg/anddev/andengine/util/modifier/BaseModifier;,"Lorg/anddev/andengine/util/modifier/BaseModifier<TT;>;"
    iget-object v0, p1, Lorg/anddev/andengine/util/modifier/BaseModifier;->mModifierListener:Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;

    invoke-direct {p0, v0}, Lorg/anddev/andengine/util/modifier/BaseModifier;-><init>(Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;)V

    .line 36
    return-void
.end method

.method public constructor <init>(Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;)V
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 30
    .local p0, this:Lorg/anddev/andengine/util/modifier/BaseModifier;,"Lorg/anddev/andengine/util/modifier/BaseModifier<TT;>;"
    .local p1, pModifierListener:Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;,"Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/anddev/andengine/util/modifier/BaseModifier;->mRemoveWhenFinished:Z

    .line 31
    iput-object p1, p0, Lorg/anddev/andengine/util/modifier/BaseModifier;->mModifierListener:Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;

    .line 32
    return-void
.end method


# virtual methods
.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/anddev/andengine/util/modifier/BaseModifier;->clone()Lorg/anddev/andengine/util/modifier/IModifier;

    move-result-object v0

    return-object v0
.end method

.method public abstract clone()Lorg/anddev/andengine/util/modifier/IModifier;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/anddev/andengine/util/modifier/IModifier",
            "<TT;>;"
        }
    .end annotation
.end method

.method public getModifierListener()Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 61
    .local p0, this:Lorg/anddev/andengine/util/modifier/BaseModifier;,"Lorg/anddev/andengine/util/modifier/BaseModifier<TT;>;"
    iget-object v0, p0, Lorg/anddev/andengine/util/modifier/BaseModifier;->mModifierListener:Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;

    return-object v0
.end method

.method public isFinished()Z
    .locals 1

    .prologue
    .line 48
    .local p0, this:Lorg/anddev/andengine/util/modifier/BaseModifier;,"Lorg/anddev/andengine/util/modifier/BaseModifier<TT;>;"
    iget-boolean v0, p0, Lorg/anddev/andengine/util/modifier/BaseModifier;->mFinished:Z

    return v0
.end method

.method public final isRemoveWhenFinished()Z
    .locals 1

    .prologue
    .line 53
    .local p0, this:Lorg/anddev/andengine/util/modifier/BaseModifier;,"Lorg/anddev/andengine/util/modifier/BaseModifier<TT;>;"
    iget-boolean v0, p0, Lorg/anddev/andengine/util/modifier/BaseModifier;->mRemoveWhenFinished:Z

    return v0
.end method

.method public setModifierListener(Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;)V
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 65
    .local p0, this:Lorg/anddev/andengine/util/modifier/BaseModifier;,"Lorg/anddev/andengine/util/modifier/BaseModifier<TT;>;"
    .local p1, pModifierListener:Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;,"Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener<TT;>;"
    iput-object p1, p0, Lorg/anddev/andengine/util/modifier/BaseModifier;->mModifierListener:Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;

    .line 66
    return-void
.end method

.method public final setRemoveWhenFinished(Z)V
    .locals 0
    .parameter "pRemoveWhenFinished"

    .prologue
    .line 57
    .local p0, this:Lorg/anddev/andengine/util/modifier/BaseModifier;,"Lorg/anddev/andengine/util/modifier/BaseModifier<TT;>;"
    iput-boolean p1, p0, Lorg/anddev/andengine/util/modifier/BaseModifier;->mRemoveWhenFinished:Z

    .line 58
    return-void
.end method
