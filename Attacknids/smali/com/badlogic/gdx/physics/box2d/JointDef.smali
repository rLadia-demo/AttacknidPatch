.class public Lcom/badlogic/gdx/physics/box2d/JointDef;
.super Ljava/lang/Object;
.source "JointDef.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;
    }
.end annotation


# instance fields
.field public bodyA:Lcom/badlogic/gdx/physics/box2d/Body;

.field public bodyB:Lcom/badlogic/gdx/physics/box2d/Body;

.field public collideConnected:Z

.field public type:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    sget-object v0, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->Unknown:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/JointDef;->type:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    .line 50
    iput-object v1, p0, Lcom/badlogic/gdx/physics/box2d/JointDef;->bodyA:Lcom/badlogic/gdx/physics/box2d/Body;

    .line 53
    iput-object v1, p0, Lcom/badlogic/gdx/physics/box2d/JointDef;->bodyB:Lcom/badlogic/gdx/physics/box2d/Body;

    .line 56
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/badlogic/gdx/physics/box2d/JointDef;->collideConnected:Z

    .line 18
    return-void
.end method
