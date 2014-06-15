.class public Lcom/badlogic/gdx/physics/box2d/JointEdge;
.super Ljava/lang/Object;
.source "JointEdge.java"


# instance fields
.field public final joint:Lcom/badlogic/gdx/physics/box2d/Joint;

.field public final other:Lcom/badlogic/gdx/physics/box2d/Body;


# direct methods
.method protected constructor <init>(Lcom/badlogic/gdx/physics/box2d/Body;Lcom/badlogic/gdx/physics/box2d/Joint;)V
    .locals 0
    .parameter "other"
    .parameter "joint"

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-object p1, p0, Lcom/badlogic/gdx/physics/box2d/JointEdge;->other:Lcom/badlogic/gdx/physics/box2d/Body;

    .line 33
    iput-object p2, p0, Lcom/badlogic/gdx/physics/box2d/JointEdge;->joint:Lcom/badlogic/gdx/physics/box2d/Joint;

    .line 34
    return-void
.end method
