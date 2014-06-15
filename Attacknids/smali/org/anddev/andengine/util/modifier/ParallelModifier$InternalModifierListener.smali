.class Lorg/anddev/andengine/util/modifier/ParallelModifier$InternalModifierListener;
.super Ljava/lang/Object;
.source "ParallelModifier.java"

# interfaces
.implements Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/anddev/andengine/util/modifier/ParallelModifier;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "InternalModifierListener"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener",
        "<TT;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/anddev/andengine/util/modifier/ParallelModifier;


# direct methods
.method private constructor <init>(Lorg/anddev/andengine/util/modifier/ParallelModifier;)V
    .locals 0
    .parameter

    .prologue
    .line 115
    iput-object p1, p0, Lorg/anddev/andengine/util/modifier/ParallelModifier$InternalModifierListener;->this$0:Lorg/anddev/andengine/util/modifier/ParallelModifier;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/anddev/andengine/util/modifier/ParallelModifier;Lorg/anddev/andengine/util/modifier/ParallelModifier$InternalModifierListener;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 115
    invoke-direct {p0, p1}, Lorg/anddev/andengine/util/modifier/ParallelModifier$InternalModifierListener;-><init>(Lorg/anddev/andengine/util/modifier/ParallelModifier;)V

    return-void
.end method


# virtual methods
.method public onModifierFinished(Lorg/anddev/andengine/util/modifier/IModifier;Ljava/lang/Object;)V
    .locals 2
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/anddev/andengine/util/modifier/IModifier",
            "<TT;>;TT;)V"
        }
    .end annotation

    .prologue
    .local p1, pModifier:Lorg/anddev/andengine/util/modifier/IModifier;,"Lorg/anddev/andengine/util/modifier/IModifier<TT;>;"
    .local p2, pItem:Ljava/lang/Object;,"TT;"
    const/4 v1, 0x1

    .line 118
    iget-object v0, p0, Lorg/anddev/andengine/util/modifier/ParallelModifier$InternalModifierListener;->this$0:Lorg/anddev/andengine/util/modifier/ParallelModifier;

    iput-boolean v1, v0, Lorg/anddev/andengine/util/modifier/ParallelModifier;->mFinished:Z

    .line 119
    iget-object v0, p0, Lorg/anddev/andengine/util/modifier/ParallelModifier$InternalModifierListener;->this$0:Lorg/anddev/andengine/util/modifier/ParallelModifier;

    #setter for: Lorg/anddev/andengine/util/modifier/ParallelModifier;->mFinishedCached:Z
    invoke-static {v0, v1}, Lorg/anddev/andengine/util/modifier/ParallelModifier;->access$1(Lorg/anddev/andengine/util/modifier/ParallelModifier;Z)V

    .line 120
    iget-object v0, p0, Lorg/anddev/andengine/util/modifier/ParallelModifier$InternalModifierListener;->this$0:Lorg/anddev/andengine/util/modifier/ParallelModifier;

    iget-object v0, v0, Lorg/anddev/andengine/util/modifier/ParallelModifier;->mModifierListener:Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;

    if-eqz v0, :cond_0

    .line 121
    iget-object v0, p0, Lorg/anddev/andengine/util/modifier/ParallelModifier$InternalModifierListener;->this$0:Lorg/anddev/andengine/util/modifier/ParallelModifier;

    iget-object v0, v0, Lorg/anddev/andengine/util/modifier/ParallelModifier;->mModifierListener:Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;

    iget-object v1, p0, Lorg/anddev/andengine/util/modifier/ParallelModifier$InternalModifierListener;->this$0:Lorg/anddev/andengine/util/modifier/ParallelModifier;

    invoke-interface {v0, v1, p2}, Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;->onModifierFinished(Lorg/anddev/andengine/util/modifier/IModifier;Ljava/lang/Object;)V

    .line 123
    :cond_0
    return-void
.end method
