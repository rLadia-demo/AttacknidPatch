.class Lorg/anddev/andengine/entity/shape/modifier/PathModifier$3;
.super Ljava/lang/Object;
.source "PathModifier.java"

# interfaces
.implements Lorg/anddev/andengine/util/modifier/SequenceModifier$ISubSequenceModifierListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/anddev/andengine/entity/shape/modifier/PathModifier;-><init>(FLorg/anddev/andengine/util/Path;Lorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;Lorg/anddev/andengine/entity/shape/modifier/PathModifier$IPathModifierListener;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lorg/anddev/andengine/util/modifier/SequenceModifier$ISubSequenceModifierListener",
        "<",
        "Lorg/anddev/andengine/entity/shape/IShape;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/anddev/andengine/entity/shape/modifier/PathModifier;


# direct methods
.method constructor <init>(Lorg/anddev/andengine/entity/shape/modifier/PathModifier;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lorg/anddev/andengine/entity/shape/modifier/PathModifier$3;->this$0:Lorg/anddev/andengine/entity/shape/modifier/PathModifier;

    .line 107
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onSubSequenceFinished(Lorg/anddev/andengine/util/modifier/IModifier;Ljava/lang/Object;I)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 1
    check-cast p1, Lorg/anddev/andengine/util/modifier/IModifier;

    check-cast p2, Lorg/anddev/andengine/entity/shape/IShape;

    invoke-virtual {p0, p1, p2, p3}, Lorg/anddev/andengine/entity/shape/modifier/PathModifier$3;->onSubSequenceFinished(Lorg/anddev/andengine/util/modifier/IModifier;Lorg/anddev/andengine/entity/shape/IShape;I)V

    return-void
.end method

.method public onSubSequenceFinished(Lorg/anddev/andengine/util/modifier/IModifier;Lorg/anddev/andengine/entity/shape/IShape;I)V
    .locals 2
    .parameter
    .parameter "pShape"
    .parameter "pIndex"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/anddev/andengine/util/modifier/IModifier",
            "<",
            "Lorg/anddev/andengine/entity/shape/IShape;",
            ">;",
            "Lorg/anddev/andengine/entity/shape/IShape;",
            "I)V"
        }
    .end annotation

    .prologue
    .line 110
    .local p1, pShapeModifier:Lorg/anddev/andengine/util/modifier/IModifier;,"Lorg/anddev/andengine/util/modifier/IModifier<Lorg/anddev/andengine/entity/shape/IShape;>;"
    iget-object v0, p0, Lorg/anddev/andengine/entity/shape/modifier/PathModifier$3;->this$0:Lorg/anddev/andengine/entity/shape/modifier/PathModifier;

    #getter for: Lorg/anddev/andengine/entity/shape/modifier/PathModifier;->mPathModifierListener:Lorg/anddev/andengine/entity/shape/modifier/PathModifier$IPathModifierListener;
    invoke-static {v0}, Lorg/anddev/andengine/entity/shape/modifier/PathModifier;->access$2(Lorg/anddev/andengine/entity/shape/modifier/PathModifier;)Lorg/anddev/andengine/entity/shape/modifier/PathModifier$IPathModifierListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 111
    iget-object v0, p0, Lorg/anddev/andengine/entity/shape/modifier/PathModifier$3;->this$0:Lorg/anddev/andengine/entity/shape/modifier/PathModifier;

    #getter for: Lorg/anddev/andengine/entity/shape/modifier/PathModifier;->mPathModifierListener:Lorg/anddev/andengine/entity/shape/modifier/PathModifier$IPathModifierListener;
    invoke-static {v0}, Lorg/anddev/andengine/entity/shape/modifier/PathModifier;->access$2(Lorg/anddev/andengine/entity/shape/modifier/PathModifier;)Lorg/anddev/andengine/entity/shape/modifier/PathModifier$IPathModifierListener;

    move-result-object v0

    iget-object v1, p0, Lorg/anddev/andengine/entity/shape/modifier/PathModifier$3;->this$0:Lorg/anddev/andengine/entity/shape/modifier/PathModifier;

    invoke-interface {v0, v1, p2, p3}, Lorg/anddev/andengine/entity/shape/modifier/PathModifier$IPathModifierListener;->onWaypointPassed(Lorg/anddev/andengine/entity/shape/modifier/PathModifier;Lorg/anddev/andengine/entity/shape/IShape;I)V

    .line 113
    :cond_0
    return-void
.end method
