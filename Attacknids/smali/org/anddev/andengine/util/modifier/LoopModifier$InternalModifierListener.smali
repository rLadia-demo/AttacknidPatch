.class Lorg/anddev/andengine/util/modifier/LoopModifier$InternalModifierListener;
.super Ljava/lang/Object;
.source "LoopModifier.java"

# interfaces
.implements Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/anddev/andengine/util/modifier/LoopModifier;
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
.field final synthetic this$0:Lorg/anddev/andengine/util/modifier/LoopModifier;


# direct methods
.method private constructor <init>(Lorg/anddev/andengine/util/modifier/LoopModifier;)V
    .locals 0
    .parameter

    .prologue
    .line 132
    iput-object p1, p0, Lorg/anddev/andengine/util/modifier/LoopModifier$InternalModifierListener;->this$0:Lorg/anddev/andengine/util/modifier/LoopModifier;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/anddev/andengine/util/modifier/LoopModifier;Lorg/anddev/andengine/util/modifier/LoopModifier$InternalModifierListener;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 132
    invoke-direct {p0, p1}, Lorg/anddev/andengine/util/modifier/LoopModifier$InternalModifierListener;-><init>(Lorg/anddev/andengine/util/modifier/LoopModifier;)V

    return-void
.end method


# virtual methods
.method public onModifierFinished(Lorg/anddev/andengine/util/modifier/IModifier;Ljava/lang/Object;)V
    .locals 1
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
    .line 135
    .local p1, pModifier:Lorg/anddev/andengine/util/modifier/IModifier;,"Lorg/anddev/andengine/util/modifier/IModifier<TT;>;"
    .local p2, pItem:Ljava/lang/Object;,"TT;"
    iget-object v0, p0, Lorg/anddev/andengine/util/modifier/LoopModifier$InternalModifierListener;->this$0:Lorg/anddev/andengine/util/modifier/LoopModifier;

    invoke-virtual {v0, p2}, Lorg/anddev/andengine/util/modifier/LoopModifier;->onHandleLoopFinished(Ljava/lang/Object;)V

    .line 136
    return-void
.end method
