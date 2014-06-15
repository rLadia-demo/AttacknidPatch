.class Lorg/anddev/andengine/entity/shape/modifier/PathModifier$2;
.super Ljava/lang/Object;
.source "PathModifier.java"

# interfaces
.implements Lorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/anddev/andengine/entity/shape/modifier/PathModifier;-><init>(FLorg/anddev/andengine/util/Path;Lorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;Lorg/anddev/andengine/entity/shape/modifier/PathModifier$IPathModifierListener;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/anddev/andengine/entity/shape/modifier/PathModifier;

.field private final synthetic val$modifierCount:I


# direct methods
.method constructor <init>(Lorg/anddev/andengine/entity/shape/modifier/PathModifier;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lorg/anddev/andengine/entity/shape/modifier/PathModifier$2;->this$0:Lorg/anddev/andengine/entity/shape/modifier/PathModifier;

    iput p2, p0, Lorg/anddev/andengine/entity/shape/modifier/PathModifier$2;->val$modifierCount:I

    .line 96
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onModifierFinished(Lorg/anddev/andengine/util/modifier/IModifier;Ljava/lang/Object;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    check-cast p1, Lorg/anddev/andengine/util/modifier/IModifier;

    check-cast p2, Lorg/anddev/andengine/entity/shape/IShape;

    invoke-virtual {p0, p1, p2}, Lorg/anddev/andengine/entity/shape/modifier/PathModifier$2;->onModifierFinished(Lorg/anddev/andengine/util/modifier/IModifier;Lorg/anddev/andengine/entity/shape/IShape;)V

    return-void
.end method

.method public onModifierFinished(Lorg/anddev/andengine/util/modifier/IModifier;Lorg/anddev/andengine/entity/shape/IShape;)V
    .locals 3
    .parameter
    .parameter "pShape"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/anddev/andengine/util/modifier/IModifier",
            "<",
            "Lorg/anddev/andengine/entity/shape/IShape;",
            ">;",
            "Lorg/anddev/andengine/entity/shape/IShape;",
            ")V"
        }
    .end annotation

    .prologue
    .line 99
    .local p1, pShapeModifier:Lorg/anddev/andengine/util/modifier/IModifier;,"Lorg/anddev/andengine/util/modifier/IModifier<Lorg/anddev/andengine/entity/shape/IShape;>;"
    iget-object v0, p0, Lorg/anddev/andengine/entity/shape/modifier/PathModifier$2;->this$0:Lorg/anddev/andengine/entity/shape/modifier/PathModifier;

    #getter for: Lorg/anddev/andengine/entity/shape/modifier/PathModifier;->mPathModifierListener:Lorg/anddev/andengine/entity/shape/modifier/PathModifier$IPathModifierListener;
    invoke-static {v0}, Lorg/anddev/andengine/entity/shape/modifier/PathModifier;->access$2(Lorg/anddev/andengine/entity/shape/modifier/PathModifier;)Lorg/anddev/andengine/entity/shape/modifier/PathModifier$IPathModifierListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 100
    iget-object v0, p0, Lorg/anddev/andengine/entity/shape/modifier/PathModifier$2;->this$0:Lorg/anddev/andengine/entity/shape/modifier/PathModifier;

    #getter for: Lorg/anddev/andengine/entity/shape/modifier/PathModifier;->mPathModifierListener:Lorg/anddev/andengine/entity/shape/modifier/PathModifier$IPathModifierListener;
    invoke-static {v0}, Lorg/anddev/andengine/entity/shape/modifier/PathModifier;->access$2(Lorg/anddev/andengine/entity/shape/modifier/PathModifier;)Lorg/anddev/andengine/entity/shape/modifier/PathModifier$IPathModifierListener;

    move-result-object v0

    iget-object v1, p0, Lorg/anddev/andengine/entity/shape/modifier/PathModifier$2;->this$0:Lorg/anddev/andengine/entity/shape/modifier/PathModifier;

    iget v2, p0, Lorg/anddev/andengine/entity/shape/modifier/PathModifier$2;->val$modifierCount:I

    invoke-interface {v0, v1, p2, v2}, Lorg/anddev/andengine/entity/shape/modifier/PathModifier$IPathModifierListener;->onWaypointPassed(Lorg/anddev/andengine/entity/shape/modifier/PathModifier;Lorg/anddev/andengine/entity/shape/IShape;I)V

    .line 102
    :cond_0
    iget-object v0, p0, Lorg/anddev/andengine/entity/shape/modifier/PathModifier$2;->this$0:Lorg/anddev/andengine/entity/shape/modifier/PathModifier;

    #getter for: Lorg/anddev/andengine/entity/shape/modifier/PathModifier;->mModifierListener:Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;
    invoke-static {v0}, Lorg/anddev/andengine/entity/shape/modifier/PathModifier;->access$3(Lorg/anddev/andengine/entity/shape/modifier/PathModifier;)Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 103
    iget-object v0, p0, Lorg/anddev/andengine/entity/shape/modifier/PathModifier$2;->this$0:Lorg/anddev/andengine/entity/shape/modifier/PathModifier;

    #getter for: Lorg/anddev/andengine/entity/shape/modifier/PathModifier;->mModifierListener:Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;
    invoke-static {v0}, Lorg/anddev/andengine/entity/shape/modifier/PathModifier;->access$3(Lorg/anddev/andengine/entity/shape/modifier/PathModifier;)Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;

    move-result-object v0

    iget-object v1, p0, Lorg/anddev/andengine/entity/shape/modifier/PathModifier$2;->this$0:Lorg/anddev/andengine/entity/shape/modifier/PathModifier;

    invoke-interface {v0, v1, p2}, Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;->onModifierFinished(Lorg/anddev/andengine/util/modifier/IModifier;Ljava/lang/Object;)V

    .line 105
    :cond_1
    return-void
.end method
