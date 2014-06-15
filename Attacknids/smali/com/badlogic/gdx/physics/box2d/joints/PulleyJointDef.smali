.class public Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;
.super Lcom/badlogic/gdx/physics/box2d/JointDef;
.source "PulleyJointDef.java"


# static fields
.field private static final minPulleyLength:F = 2.0f


# instance fields
.field public final groundAnchorA:Lcom/badlogic/gdx/math/Vector2;

.field public final groundAnchorB:Lcom/badlogic/gdx/math/Vector2;

.field public lengthA:F

.field public lengthB:F

.field public final localAnchorA:Lcom/badlogic/gdx/math/Vector2;

.field public final localAnchorB:Lcom/badlogic/gdx/math/Vector2;

.field public maxLengthA:F

.field public maxLengthB:F

.field public ratio:F


# direct methods
.method public constructor <init>()V
    .locals 4

    .prologue
    const/high16 v3, -0x4080

    const/high16 v2, 0x3f80

    const/4 v1, 0x0

    .line 31
    invoke-direct {p0}, Lcom/badlogic/gdx/physics/box2d/JointDef;-><init>()V

    .line 63
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0, v3, v2}, Lcom/badlogic/gdx/math/Vector2;-><init>(FF)V

    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->groundAnchorA:Lcom/badlogic/gdx/math/Vector2;

    .line 68
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0, v2, v2}, Lcom/badlogic/gdx/math/Vector2;-><init>(FF)V

    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->groundAnchorB:Lcom/badlogic/gdx/math/Vector2;

    .line 73
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0, v3, v1}, Lcom/badlogic/gdx/math/Vector2;-><init>(FF)V

    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->localAnchorA:Lcom/badlogic/gdx/math/Vector2;

    .line 78
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0, v2, v1}, Lcom/badlogic/gdx/math/Vector2;-><init>(FF)V

    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->localAnchorB:Lcom/badlogic/gdx/math/Vector2;

    .line 83
    iput v1, p0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->lengthA:F

    .line 88
    iput v1, p0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->maxLengthA:F

    .line 93
    iput v1, p0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->lengthB:F

    .line 98
    iput v1, p0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->maxLengthB:F

    .line 103
    iput v2, p0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->ratio:F

    .line 33
    sget-object v0, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->PulleyJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->type:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    .line 34
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->collideConnected:Z

    .line 35
    return-void
.end method


# virtual methods
.method public initialize(Lcom/badlogic/gdx/physics/box2d/Body;Lcom/badlogic/gdx/physics/box2d/Body;Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/math/Vector2;F)V
    .locals 4
    .parameter "bodyA"
    .parameter "bodyB"
    .parameter "groundAnchorA"
    .parameter "groundAnchorB"
    .parameter "anchorA"
    .parameter "anchorB"
    .parameter "ratio"

    .prologue
    const/high16 v3, 0x4000

    .line 45
    iput-object p1, p0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->bodyA:Lcom/badlogic/gdx/physics/box2d/Body;

    .line 46
    iput-object p2, p0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->bodyB:Lcom/badlogic/gdx/physics/box2d/Body;

    .line 47
    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->groundAnchorA:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {v1, p3}, Lcom/badlogic/gdx/math/Vector2;->set(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    .line 48
    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->groundAnchorB:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {v1, p4}, Lcom/badlogic/gdx/math/Vector2;->set(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    .line 49
    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->localAnchorA:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {p1, p5}, Lcom/badlogic/gdx/physics/box2d/Body;->getLocalPoint(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/math/Vector2;->set(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    .line 50
    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->localAnchorB:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {p2, p6}, Lcom/badlogic/gdx/physics/box2d/Body;->getLocalPoint(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/math/Vector2;->set(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    .line 51
    invoke-virtual {p5, p3}, Lcom/badlogic/gdx/math/Vector2;->dst(Lcom/badlogic/gdx/math/Vector2;)F

    move-result v1

    iput v1, p0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->lengthA:F

    .line 52
    invoke-virtual {p6, p4}, Lcom/badlogic/gdx/math/Vector2;->dst(Lcom/badlogic/gdx/math/Vector2;)F

    move-result v1

    iput v1, p0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->lengthB:F

    .line 53
    iput p7, p0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->ratio:F

    .line 54
    iget v1, p0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->lengthA:F

    iget v2, p0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->lengthB:F

    mul-float/2addr v2, p7

    add-float v0, v1, v2

    .line 55
    .local v0, C:F
    mul-float v1, p7, v3

    sub-float v1, v0, v1

    iput v1, p0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->maxLengthA:F

    .line 56
    sub-float v1, v0, v3

    div-float/2addr v1, p7

    iput v1, p0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->maxLengthB:F

    .line 58
    return-void
.end method
