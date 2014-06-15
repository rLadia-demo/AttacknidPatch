.class Lorg/anddev/andengine/entity/shape/modifier/PathModifier$1;
.super Lorg/anddev/andengine/entity/shape/modifier/MoveModifier;
.source "PathModifier.java"


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


# direct methods
.method constructor <init>(Lorg/anddev/andengine/entity/shape/modifier/PathModifier;FFFFFLorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V
    .locals 8
    .parameter
    .parameter "$anonymous0"
    .parameter "$anonymous1"
    .parameter "$anonymous2"
    .parameter "$anonymous3"
    .parameter "$anonymous4"
    .parameter "$anonymous5"
    .parameter "$anonymous6"

    .prologue
    .line 1
    iput-object p1, p0, Lorg/anddev/andengine/entity/shape/modifier/PathModifier$1;->this$0:Lorg/anddev/andengine/entity/shape/modifier/PathModifier;

    move-object v0, p0

    move v1, p2

    move v2, p3

    move v3, p4

    move v4, p5

    move v5, p6

    move-object v6, p7

    move-object/from16 v7, p8

    .line 78
    invoke-direct/range {v0 .. v7}, Lorg/anddev/andengine/entity/shape/modifier/MoveModifier;-><init>(FFFFFLorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    return-void
.end method


# virtual methods
.method protected bridge synthetic onManagedInitialize(Ljava/lang/Object;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    check-cast p1, Lorg/anddev/andengine/entity/shape/IShape;

    invoke-virtual {p0, p1}, Lorg/anddev/andengine/entity/shape/modifier/PathModifier$1;->onManagedInitialize(Lorg/anddev/andengine/entity/shape/IShape;)V

    return-void
.end method

.method protected onManagedInitialize(Lorg/anddev/andengine/entity/shape/IShape;)V
    .locals 3
    .parameter "pShape"

    .prologue
    .line 81
    invoke-super {p0, p1}, Lorg/anddev/andengine/entity/shape/modifier/MoveModifier;->onManagedInitialize(Ljava/lang/Object;)V

    .line 82
    iget-object v0, p0, Lorg/anddev/andengine/entity/shape/modifier/PathModifier$1;->this$0:Lorg/anddev/andengine/entity/shape/modifier/PathModifier;

    #getter for: Lorg/anddev/andengine/entity/shape/modifier/PathModifier;->mPathModifierListener:Lorg/anddev/andengine/entity/shape/modifier/PathModifier$IPathModifierListener;
    invoke-static {v0}, Lorg/anddev/andengine/entity/shape/modifier/PathModifier;->access$2(Lorg/anddev/andengine/entity/shape/modifier/PathModifier;)Lorg/anddev/andengine/entity/shape/modifier/PathModifier$IPathModifierListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 83
    iget-object v0, p0, Lorg/anddev/andengine/entity/shape/modifier/PathModifier$1;->this$0:Lorg/anddev/andengine/entity/shape/modifier/PathModifier;

    #getter for: Lorg/anddev/andengine/entity/shape/modifier/PathModifier;->mPathModifierListener:Lorg/anddev/andengine/entity/shape/modifier/PathModifier$IPathModifierListener;
    invoke-static {v0}, Lorg/anddev/andengine/entity/shape/modifier/PathModifier;->access$2(Lorg/anddev/andengine/entity/shape/modifier/PathModifier;)Lorg/anddev/andengine/entity/shape/modifier/PathModifier$IPathModifierListener;

    move-result-object v0

    iget-object v1, p0, Lorg/anddev/andengine/entity/shape/modifier/PathModifier$1;->this$0:Lorg/anddev/andengine/entity/shape/modifier/PathModifier;

    const/4 v2, 0x0

    invoke-interface {v0, v1, p1, v2}, Lorg/anddev/andengine/entity/shape/modifier/PathModifier$IPathModifierListener;->onWaypointPassed(Lorg/anddev/andengine/entity/shape/modifier/PathModifier;Lorg/anddev/andengine/entity/shape/IShape;I)V

    .line 85
    :cond_0
    return-void
.end method
