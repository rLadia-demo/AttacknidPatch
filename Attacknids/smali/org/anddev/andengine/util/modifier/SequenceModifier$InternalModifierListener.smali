.class Lorg/anddev/andengine/util/modifier/SequenceModifier$InternalModifierListener;
.super Ljava/lang/Object;
.source "SequenceModifier.java"

# interfaces
.implements Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/anddev/andengine/util/modifier/SequenceModifier;
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
.field final synthetic this$0:Lorg/anddev/andengine/util/modifier/SequenceModifier;


# direct methods
.method private constructor <init>(Lorg/anddev/andengine/util/modifier/SequenceModifier;)V
    .locals 0
    .parameter

    .prologue
    .line 145
    iput-object p1, p0, Lorg/anddev/andengine/util/modifier/SequenceModifier$InternalModifierListener;->this$0:Lorg/anddev/andengine/util/modifier/SequenceModifier;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/anddev/andengine/util/modifier/SequenceModifier;Lorg/anddev/andengine/util/modifier/SequenceModifier$InternalModifierListener;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 145
    invoke-direct {p0, p1}, Lorg/anddev/andengine/util/modifier/SequenceModifier$InternalModifierListener;-><init>(Lorg/anddev/andengine/util/modifier/SequenceModifier;)V

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
    .line 148
    .local p1, pModifier:Lorg/anddev/andengine/util/modifier/IModifier;,"Lorg/anddev/andengine/util/modifier/IModifier<TT;>;"
    .local p2, pItem:Ljava/lang/Object;,"TT;"
    iget-object v0, p0, Lorg/anddev/andengine/util/modifier/SequenceModifier$InternalModifierListener;->this$0:Lorg/anddev/andengine/util/modifier/SequenceModifier;

    #calls: Lorg/anddev/andengine/util/modifier/SequenceModifier;->onHandleModifierFinished(Lorg/anddev/andengine/util/modifier/SequenceModifier$InternalModifierListener;Lorg/anddev/andengine/util/modifier/IModifier;Ljava/lang/Object;)V
    invoke-static {v0, p0, p1, p2}, Lorg/anddev/andengine/util/modifier/SequenceModifier;->access$1(Lorg/anddev/andengine/util/modifier/SequenceModifier;Lorg/anddev/andengine/util/modifier/SequenceModifier$InternalModifierListener;Lorg/anddev/andengine/util/modifier/IModifier;Ljava/lang/Object;)V

    .line 149
    return-void
.end method
