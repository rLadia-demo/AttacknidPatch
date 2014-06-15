.class public Lcom/badlogic/gdx/physics/box2d/World;
.super Ljava/lang/Object;
.source "World.java"


# instance fields
.field private final addr:J

.field protected final bodies:Lcom/badlogic/gdx/utils/LongHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/LongHashMap",
            "<",
            "Lcom/badlogic/gdx/physics/box2d/Body;",
            ">;"
        }
    .end annotation
.end field

.field private final contact:Lcom/badlogic/gdx/physics/box2d/Contact;

.field private contactAddrs:[J

.field protected contactFilter:Lcom/badlogic/gdx/physics/box2d/ContactFilter;

.field protected contactListener:Lcom/badlogic/gdx/physics/box2d/ContactListener;

.field private final contacts:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/badlogic/gdx/physics/box2d/Contact;",
            ">;"
        }
    .end annotation
.end field

.field protected final fixtures:Lcom/badlogic/gdx/utils/LongHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/LongHashMap",
            "<",
            "Lcom/badlogic/gdx/physics/box2d/Fixture;",
            ">;"
        }
    .end annotation
.end field

.field private final freeContacts:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/badlogic/gdx/physics/box2d/Contact;",
            ">;"
        }
    .end annotation
.end field

.field private freeIdx:I

.field final gravity:Lcom/badlogic/gdx/math/Vector2;

.field protected final joints:Lcom/badlogic/gdx/utils/LongHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/LongHashMap",
            "<",
            "Lcom/badlogic/gdx/physics/box2d/Joint;",
            ">;"
        }
    .end annotation
.end field

.field private queryCallback:Lcom/badlogic/gdx/physics/box2d/QueryCallback;

.field final tmpGravity:[F


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/math/Vector2;Z)V
    .locals 7
    .parameter "gravity"
    .parameter "doSleep"

    .prologue
    const-wide/16 v5, 0x0

    const/16 v4, 0xc8

    const/4 v3, 0x0

    const/16 v2, 0x64

    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    new-instance v1, Lcom/badlogic/gdx/utils/LongHashMap;

    invoke-direct {v1, v2}, Lcom/badlogic/gdx/utils/LongHashMap;-><init>(I)V

    iput-object v1, p0, Lcom/badlogic/gdx/physics/box2d/World;->bodies:Lcom/badlogic/gdx/utils/LongHashMap;

    .line 60
    new-instance v1, Lcom/badlogic/gdx/utils/LongHashMap;

    invoke-direct {v1, v2}, Lcom/badlogic/gdx/utils/LongHashMap;-><init>(I)V

    iput-object v1, p0, Lcom/badlogic/gdx/physics/box2d/World;->fixtures:Lcom/badlogic/gdx/utils/LongHashMap;

    .line 63
    new-instance v1, Lcom/badlogic/gdx/utils/LongHashMap;

    invoke-direct {v1, v2}, Lcom/badlogic/gdx/utils/LongHashMap;-><init>(I)V

    iput-object v1, p0, Lcom/badlogic/gdx/physics/box2d/World;->joints:Lcom/badlogic/gdx/utils/LongHashMap;

    .line 66
    iput-object v3, p0, Lcom/badlogic/gdx/physics/box2d/World;->contactFilter:Lcom/badlogic/gdx/physics/box2d/ContactFilter;

    .line 69
    iput-object v3, p0, Lcom/badlogic/gdx/physics/box2d/World;->contactListener:Lcom/badlogic/gdx/physics/box2d/ContactListener;

    .line 503
    const/4 v1, 0x2

    new-array v1, v1, [F

    iput-object v1, p0, Lcom/badlogic/gdx/physics/box2d/World;->tmpGravity:[F

    .line 504
    new-instance v1, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v1}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object v1, p0, Lcom/badlogic/gdx/physics/box2d/World;->gravity:Lcom/badlogic/gdx/math/Vector2;

    .line 556
    iput-object v3, p0, Lcom/badlogic/gdx/physics/box2d/World;->queryCallback:Lcom/badlogic/gdx/physics/box2d/QueryCallback;

    .line 575
    new-array v1, v4, [J

    iput-object v1, p0, Lcom/badlogic/gdx/physics/box2d/World;->contactAddrs:[J

    .line 576
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/badlogic/gdx/physics/box2d/World;->contacts:Ljava/util/ArrayList;

    .line 577
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/badlogic/gdx/physics/box2d/World;->freeContacts:Ljava/util/ArrayList;

    .line 578
    const/4 v1, 0x0

    iput v1, p0, Lcom/badlogic/gdx/physics/box2d/World;->freeIdx:I

    .line 654
    new-instance v1, Lcom/badlogic/gdx/physics/box2d/Contact;

    invoke-direct {v1, p0, v5, v6}, Lcom/badlogic/gdx/physics/box2d/Contact;-><init>(Lcom/badlogic/gdx/physics/box2d/World;J)V

    iput-object v1, p0, Lcom/badlogic/gdx/physics/box2d/World;->contact:Lcom/badlogic/gdx/physics/box2d/Contact;

    .line 78
    iget v1, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget v2, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    invoke-direct {p0, v1, v2, p2}, Lcom/badlogic/gdx/physics/box2d/World;->newWorld(FFZ)J

    move-result-wide v1

    iput-wide v1, p0, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    .line 80
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    if-lt v0, v4, :cond_0

    .line 82
    return-void

    .line 81
    :cond_0
    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/World;->freeContacts:Ljava/util/ArrayList;

    new-instance v2, Lcom/badlogic/gdx/physics/box2d/Contact;

    invoke-direct {v2, p0, v5, v6}, Lcom/badlogic/gdx/physics/box2d/Contact;-><init>(Lcom/badlogic/gdx/physics/box2d/World;J)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 80
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private beginContact(J)V
    .locals 2
    .parameter "contactAddr"

    .prologue
    .line 658
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->contact:Lcom/badlogic/gdx/physics/box2d/Contact;

    iput-wide p1, v0, Lcom/badlogic/gdx/physics/box2d/Contact;->addr:J

    .line 659
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->contactListener:Lcom/badlogic/gdx/physics/box2d/ContactListener;

    if-eqz v0, :cond_0

    .line 660
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->contactListener:Lcom/badlogic/gdx/physics/box2d/ContactListener;

    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/World;->contact:Lcom/badlogic/gdx/physics/box2d/Contact;

    invoke-interface {v0, v1}, Lcom/badlogic/gdx/physics/box2d/ContactListener;->beginContact(Lcom/badlogic/gdx/physics/box2d/Contact;)V

    .line 661
    :cond_0
    return-void
.end method

.method private contactFilter(JJ)Z
    .locals 6
    .parameter "fixtureA"
    .parameter "fixtureB"

    .prologue
    const/4 v0, 0x1

    const/4 v4, 0x0

    .line 637
    iget-object v3, p0, Lcom/badlogic/gdx/physics/box2d/World;->contactFilter:Lcom/badlogic/gdx/physics/box2d/ContactFilter;

    if-eqz v3, :cond_1

    .line 638
    iget-object v5, p0, Lcom/badlogic/gdx/physics/box2d/World;->contactFilter:Lcom/badlogic/gdx/physics/box2d/ContactFilter;

    iget-object v3, p0, Lcom/badlogic/gdx/physics/box2d/World;->fixtures:Lcom/badlogic/gdx/utils/LongHashMap;

    invoke-virtual {v3, p1, p2}, Lcom/badlogic/gdx/utils/LongHashMap;->get(J)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/badlogic/gdx/physics/box2d/Fixture;

    iget-object v4, p0, Lcom/badlogic/gdx/physics/box2d/World;->fixtures:Lcom/badlogic/gdx/utils/LongHashMap;

    invoke-virtual {v4, p3, p4}, Lcom/badlogic/gdx/utils/LongHashMap;->get(J)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/badlogic/gdx/physics/box2d/Fixture;

    invoke-interface {v5, v3, v4}, Lcom/badlogic/gdx/physics/box2d/ContactFilter;->shouldCollide(Lcom/badlogic/gdx/physics/box2d/Fixture;Lcom/badlogic/gdx/physics/box2d/Fixture;)Z

    move-result v0

    .line 650
    :cond_0
    :goto_0
    return v0

    .line 641
    :cond_1
    iget-object v3, p0, Lcom/badlogic/gdx/physics/box2d/World;->fixtures:Lcom/badlogic/gdx/utils/LongHashMap;

    invoke-virtual {v3, p1, p2}, Lcom/badlogic/gdx/utils/LongHashMap;->get(J)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/badlogic/gdx/physics/box2d/Fixture;

    invoke-virtual {v3}, Lcom/badlogic/gdx/physics/box2d/Fixture;->getFilterData()Lcom/badlogic/gdx/physics/box2d/Filter;

    move-result-object v1

    .line 642
    .local v1, filterA:Lcom/badlogic/gdx/physics/box2d/Filter;
    iget-object v3, p0, Lcom/badlogic/gdx/physics/box2d/World;->fixtures:Lcom/badlogic/gdx/utils/LongHashMap;

    invoke-virtual {v3, p3, p4}, Lcom/badlogic/gdx/utils/LongHashMap;->get(J)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/badlogic/gdx/physics/box2d/Fixture;

    invoke-virtual {v3}, Lcom/badlogic/gdx/physics/box2d/Fixture;->getFilterData()Lcom/badlogic/gdx/physics/box2d/Filter;

    move-result-object v2

    .line 644
    .local v2, filterB:Lcom/badlogic/gdx/physics/box2d/Filter;
    iget-short v3, v1, Lcom/badlogic/gdx/physics/box2d/Filter;->groupIndex:S

    iget-short v5, v2, Lcom/badlogic/gdx/physics/box2d/Filter;->groupIndex:S

    if-ne v3, v5, :cond_2

    iget-short v3, v1, Lcom/badlogic/gdx/physics/box2d/Filter;->groupIndex:S

    if-eqz v3, :cond_2

    .line 646
    iget-short v3, v1, Lcom/badlogic/gdx/physics/box2d/Filter;->groupIndex:S

    if-gtz v3, :cond_0

    move v0, v4

    goto :goto_0

    .line 649
    :cond_2
    iget-short v3, v1, Lcom/badlogic/gdx/physics/box2d/Filter;->maskBits:S

    iget-short v5, v2, Lcom/badlogic/gdx/physics/box2d/Filter;->categoryBits:S

    and-int/2addr v3, v5

    if-eqz v3, :cond_3

    iget-short v3, v1, Lcom/badlogic/gdx/physics/box2d/Filter;->categoryBits:S

    iget-short v5, v2, Lcom/badlogic/gdx/physics/box2d/Filter;->maskBits:S

    and-int/2addr v3, v5

    if-eqz v3, :cond_3

    .line 650
    .local v0, collide:Z
    :goto_1
    goto :goto_0

    .end local v0           #collide:Z
    :cond_3
    move v0, v4

    .line 649
    goto :goto_1
.end method

.method private createProperJoint(Lcom/badlogic/gdx/physics/box2d/JointDef;)J
    .locals 23
    .parameter "def"

    .prologue
    .line 212
    move-object/from16 v0, p1

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/JointDef;->type:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    sget-object v2, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->DistanceJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    if-ne v1, v2, :cond_0

    move-object/from16 v22, p1

    .line 214
    check-cast v22, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJointDef;

    .line 215
    .local v22, d:Lcom/badlogic/gdx/physics/box2d/joints/DistanceJointDef;
    move-object/from16 v0, p0

    iget-wide v2, v0, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    move-object/from16 v0, v22

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJointDef;->bodyA:Lcom/badlogic/gdx/physics/box2d/Body;

    iget-wide v4, v1, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    move-object/from16 v0, v22

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJointDef;->bodyB:Lcom/badlogic/gdx/physics/box2d/Body;

    iget-wide v6, v1, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    move-object/from16 v0, v22

    iget-boolean v8, v0, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJointDef;->collideConnected:Z

    .line 216
    move-object/from16 v0, v22

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJointDef;->localAnchorA:Lcom/badlogic/gdx/math/Vector2;

    iget v9, v1, Lcom/badlogic/gdx/math/Vector2;->x:F

    move-object/from16 v0, v22

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJointDef;->localAnchorA:Lcom/badlogic/gdx/math/Vector2;

    iget v10, v1, Lcom/badlogic/gdx/math/Vector2;->y:F

    .line 217
    move-object/from16 v0, v22

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJointDef;->localAnchorB:Lcom/badlogic/gdx/math/Vector2;

    iget v11, v1, Lcom/badlogic/gdx/math/Vector2;->x:F

    move-object/from16 v0, v22

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJointDef;->localAnchorB:Lcom/badlogic/gdx/math/Vector2;

    iget v12, v1, Lcom/badlogic/gdx/math/Vector2;->y:F

    .line 218
    move-object/from16 v0, v22

    iget v13, v0, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJointDef;->length:F

    move-object/from16 v0, v22

    iget v14, v0, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJointDef;->frequencyHz:F

    move-object/from16 v0, v22

    iget v15, v0, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJointDef;->dampingRatio:F

    move-object/from16 v1, p0

    .line 215
    invoke-direct/range {v1 .. v15}, Lcom/badlogic/gdx/physics/box2d/World;->jniCreateDistanceJoint(JJJZFFFFFFF)J

    move-result-wide v1

    .line 309
    .end local v22           #d:Lcom/badlogic/gdx/physics/box2d/joints/DistanceJointDef;
    :goto_0
    return-wide v1

    .line 220
    :cond_0
    move-object/from16 v0, p1

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/JointDef;->type:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    sget-object v2, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->FrictionJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    if-ne v1, v2, :cond_1

    move-object/from16 v22, p1

    .line 222
    check-cast v22, Lcom/badlogic/gdx/physics/box2d/joints/FrictionJointDef;

    .line 223
    .local v22, d:Lcom/badlogic/gdx/physics/box2d/joints/FrictionJointDef;
    move-object/from16 v0, p0

    iget-wide v2, v0, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    move-object/from16 v0, v22

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/FrictionJointDef;->bodyA:Lcom/badlogic/gdx/physics/box2d/Body;

    iget-wide v4, v1, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    move-object/from16 v0, v22

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/FrictionJointDef;->bodyB:Lcom/badlogic/gdx/physics/box2d/Body;

    iget-wide v6, v1, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    move-object/from16 v0, v22

    iget-boolean v8, v0, Lcom/badlogic/gdx/physics/box2d/joints/FrictionJointDef;->collideConnected:Z

    .line 224
    move-object/from16 v0, v22

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/FrictionJointDef;->localAnchorA:Lcom/badlogic/gdx/math/Vector2;

    iget v9, v1, Lcom/badlogic/gdx/math/Vector2;->x:F

    move-object/from16 v0, v22

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/FrictionJointDef;->localAnchorA:Lcom/badlogic/gdx/math/Vector2;

    iget v10, v1, Lcom/badlogic/gdx/math/Vector2;->y:F

    .line 225
    move-object/from16 v0, v22

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/FrictionJointDef;->localAnchorB:Lcom/badlogic/gdx/math/Vector2;

    iget v11, v1, Lcom/badlogic/gdx/math/Vector2;->x:F

    move-object/from16 v0, v22

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/FrictionJointDef;->localAnchorB:Lcom/badlogic/gdx/math/Vector2;

    iget v12, v1, Lcom/badlogic/gdx/math/Vector2;->y:F

    .line 226
    move-object/from16 v0, v22

    iget v13, v0, Lcom/badlogic/gdx/physics/box2d/joints/FrictionJointDef;->maxForce:F

    .line 227
    move-object/from16 v0, v22

    iget v14, v0, Lcom/badlogic/gdx/physics/box2d/joints/FrictionJointDef;->maxTorque:F

    move-object/from16 v1, p0

    .line 223
    invoke-direct/range {v1 .. v14}, Lcom/badlogic/gdx/physics/box2d/World;->jniCreateFrictionJoint(JJJZFFFFFF)J

    move-result-wide v1

    goto :goto_0

    .line 229
    .end local v22           #d:Lcom/badlogic/gdx/physics/box2d/joints/FrictionJointDef;
    :cond_1
    move-object/from16 v0, p1

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/JointDef;->type:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    sget-object v2, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->GearJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    if-ne v1, v2, :cond_2

    move-object/from16 v22, p1

    .line 231
    check-cast v22, Lcom/badlogic/gdx/physics/box2d/joints/GearJointDef;

    .line 232
    .local v22, d:Lcom/badlogic/gdx/physics/box2d/joints/GearJointDef;
    move-object/from16 v0, p0

    iget-wide v2, v0, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    move-object/from16 v0, v22

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/GearJointDef;->bodyA:Lcom/badlogic/gdx/physics/box2d/Body;

    iget-wide v4, v1, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    move-object/from16 v0, v22

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/GearJointDef;->bodyB:Lcom/badlogic/gdx/physics/box2d/Body;

    iget-wide v6, v1, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    move-object/from16 v0, v22

    iget-boolean v8, v0, Lcom/badlogic/gdx/physics/box2d/joints/GearJointDef;->collideConnected:Z

    .line 233
    move-object/from16 v0, v22

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/GearJointDef;->joint1:Lcom/badlogic/gdx/physics/box2d/Joint;

    iget-wide v9, v1, Lcom/badlogic/gdx/physics/box2d/Joint;->addr:J

    move-object/from16 v0, v22

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/GearJointDef;->joint2:Lcom/badlogic/gdx/physics/box2d/Joint;

    iget-wide v11, v1, Lcom/badlogic/gdx/physics/box2d/Joint;->addr:J

    move-object/from16 v0, v22

    iget v13, v0, Lcom/badlogic/gdx/physics/box2d/joints/GearJointDef;->ratio:F

    move-object/from16 v1, p0

    .line 232
    invoke-direct/range {v1 .. v13}, Lcom/badlogic/gdx/physics/box2d/World;->jniCreateGearJoint(JJJZJJF)J

    move-result-wide v1

    goto :goto_0

    .line 235
    .end local v22           #d:Lcom/badlogic/gdx/physics/box2d/joints/GearJointDef;
    :cond_2
    move-object/from16 v0, p1

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/JointDef;->type:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    sget-object v2, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->LineJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    if-ne v1, v2, :cond_3

    move-object/from16 v22, p1

    .line 237
    check-cast v22, Lcom/badlogic/gdx/physics/box2d/joints/LineJointDef;

    .line 238
    .local v22, d:Lcom/badlogic/gdx/physics/box2d/joints/LineJointDef;
    move-object/from16 v0, p0

    iget-wide v2, v0, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    move-object/from16 v0, v22

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/LineJointDef;->bodyA:Lcom/badlogic/gdx/physics/box2d/Body;

    iget-wide v4, v1, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    move-object/from16 v0, v22

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/LineJointDef;->bodyB:Lcom/badlogic/gdx/physics/box2d/Body;

    iget-wide v6, v1, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    move-object/from16 v0, v22

    iget-boolean v8, v0, Lcom/badlogic/gdx/physics/box2d/joints/LineJointDef;->collideConnected:Z

    .line 239
    move-object/from16 v0, v22

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/LineJointDef;->localAnchorA:Lcom/badlogic/gdx/math/Vector2;

    iget v9, v1, Lcom/badlogic/gdx/math/Vector2;->x:F

    move-object/from16 v0, v22

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/LineJointDef;->localAnchorA:Lcom/badlogic/gdx/math/Vector2;

    iget v10, v1, Lcom/badlogic/gdx/math/Vector2;->y:F

    .line 240
    move-object/from16 v0, v22

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/LineJointDef;->localAnchorB:Lcom/badlogic/gdx/math/Vector2;

    iget v11, v1, Lcom/badlogic/gdx/math/Vector2;->x:F

    move-object/from16 v0, v22

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/LineJointDef;->localAnchorB:Lcom/badlogic/gdx/math/Vector2;

    iget v12, v1, Lcom/badlogic/gdx/math/Vector2;->y:F

    .line 241
    move-object/from16 v0, v22

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/LineJointDef;->localAxisA:Lcom/badlogic/gdx/math/Vector2;

    iget v13, v1, Lcom/badlogic/gdx/math/Vector2;->x:F

    move-object/from16 v0, v22

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/LineJointDef;->localAxisA:Lcom/badlogic/gdx/math/Vector2;

    iget v14, v1, Lcom/badlogic/gdx/math/Vector2;->y:F

    .line 242
    move-object/from16 v0, v22

    iget-boolean v15, v0, Lcom/badlogic/gdx/physics/box2d/joints/LineJointDef;->enableLimit:Z

    .line 243
    move-object/from16 v0, v22

    iget v0, v0, Lcom/badlogic/gdx/physics/box2d/joints/LineJointDef;->lowerTranslation:F

    move/from16 v16, v0

    .line 244
    move-object/from16 v0, v22

    iget v0, v0, Lcom/badlogic/gdx/physics/box2d/joints/LineJointDef;->upperTranslation:F

    move/from16 v17, v0

    .line 245
    move-object/from16 v0, v22

    iget-boolean v0, v0, Lcom/badlogic/gdx/physics/box2d/joints/LineJointDef;->enableMotor:Z

    move/from16 v18, v0

    .line 246
    move-object/from16 v0, v22

    iget v0, v0, Lcom/badlogic/gdx/physics/box2d/joints/LineJointDef;->maxMotorForce:F

    move/from16 v19, v0

    .line 247
    move-object/from16 v0, v22

    iget v0, v0, Lcom/badlogic/gdx/physics/box2d/joints/LineJointDef;->motorSpeed:F

    move/from16 v20, v0

    move-object/from16 v1, p0

    .line 238
    invoke-direct/range {v1 .. v20}, Lcom/badlogic/gdx/physics/box2d/World;->jniCreateLineJoint(JJJZFFFFFFZFFZFF)J

    move-result-wide v1

    goto/16 :goto_0

    .line 250
    .end local v22           #d:Lcom/badlogic/gdx/physics/box2d/joints/LineJointDef;
    :cond_3
    move-object/from16 v0, p1

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/JointDef;->type:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    sget-object v2, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->MouseJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    if-ne v1, v2, :cond_4

    move-object/from16 v22, p1

    .line 252
    check-cast v22, Lcom/badlogic/gdx/physics/box2d/joints/MouseJointDef;

    .line 253
    .local v22, d:Lcom/badlogic/gdx/physics/box2d/joints/MouseJointDef;
    move-object/from16 v0, p0

    iget-wide v2, v0, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    move-object/from16 v0, v22

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/MouseJointDef;->bodyA:Lcom/badlogic/gdx/physics/box2d/Body;

    iget-wide v4, v1, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    move-object/from16 v0, v22

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/MouseJointDef;->bodyB:Lcom/badlogic/gdx/physics/box2d/Body;

    iget-wide v6, v1, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    move-object/from16 v0, v22

    iget-boolean v8, v0, Lcom/badlogic/gdx/physics/box2d/joints/MouseJointDef;->collideConnected:Z

    .line 254
    move-object/from16 v0, v22

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/MouseJointDef;->target:Lcom/badlogic/gdx/math/Vector2;

    iget v9, v1, Lcom/badlogic/gdx/math/Vector2;->x:F

    move-object/from16 v0, v22

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/MouseJointDef;->target:Lcom/badlogic/gdx/math/Vector2;

    iget v10, v1, Lcom/badlogic/gdx/math/Vector2;->y:F

    move-object/from16 v0, v22

    iget v11, v0, Lcom/badlogic/gdx/physics/box2d/joints/MouseJointDef;->maxForce:F

    move-object/from16 v0, v22

    iget v12, v0, Lcom/badlogic/gdx/physics/box2d/joints/MouseJointDef;->frequencyHz:F

    move-object/from16 v0, v22

    iget v13, v0, Lcom/badlogic/gdx/physics/box2d/joints/MouseJointDef;->dampingRatio:F

    move-object/from16 v1, p0

    .line 253
    invoke-direct/range {v1 .. v13}, Lcom/badlogic/gdx/physics/box2d/World;->jniCreateMouseJoint(JJJZFFFFF)J

    move-result-wide v1

    goto/16 :goto_0

    .line 256
    .end local v22           #d:Lcom/badlogic/gdx/physics/box2d/joints/MouseJointDef;
    :cond_4
    move-object/from16 v0, p1

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/JointDef;->type:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    sget-object v2, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->PrismaticJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    if-ne v1, v2, :cond_5

    move-object/from16 v22, p1

    .line 258
    check-cast v22, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJointDef;

    .line 259
    .local v22, d:Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJointDef;
    move-object/from16 v0, p0

    iget-wide v2, v0, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    move-object/from16 v0, v22

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJointDef;->bodyA:Lcom/badlogic/gdx/physics/box2d/Body;

    iget-wide v4, v1, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    move-object/from16 v0, v22

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJointDef;->bodyB:Lcom/badlogic/gdx/physics/box2d/Body;

    iget-wide v6, v1, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    move-object/from16 v0, v22

    iget-boolean v8, v0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJointDef;->collideConnected:Z

    .line 260
    move-object/from16 v0, v22

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJointDef;->localAnchorA:Lcom/badlogic/gdx/math/Vector2;

    iget v9, v1, Lcom/badlogic/gdx/math/Vector2;->x:F

    move-object/from16 v0, v22

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJointDef;->localAnchorA:Lcom/badlogic/gdx/math/Vector2;

    iget v10, v1, Lcom/badlogic/gdx/math/Vector2;->y:F

    .line 261
    move-object/from16 v0, v22

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJointDef;->localAnchorB:Lcom/badlogic/gdx/math/Vector2;

    iget v11, v1, Lcom/badlogic/gdx/math/Vector2;->x:F

    move-object/from16 v0, v22

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJointDef;->localAnchorB:Lcom/badlogic/gdx/math/Vector2;

    iget v12, v1, Lcom/badlogic/gdx/math/Vector2;->y:F

    .line 262
    move-object/from16 v0, v22

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJointDef;->localAxis1:Lcom/badlogic/gdx/math/Vector2;

    iget v13, v1, Lcom/badlogic/gdx/math/Vector2;->x:F

    move-object/from16 v0, v22

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJointDef;->localAxis1:Lcom/badlogic/gdx/math/Vector2;

    iget v14, v1, Lcom/badlogic/gdx/math/Vector2;->y:F

    .line 263
    move-object/from16 v0, v22

    iget v15, v0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJointDef;->referenceAngle:F

    .line 264
    move-object/from16 v0, v22

    iget-boolean v0, v0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJointDef;->enableLimit:Z

    move/from16 v16, v0

    .line 265
    move-object/from16 v0, v22

    iget v0, v0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJointDef;->lowerTranslation:F

    move/from16 v17, v0

    .line 266
    move-object/from16 v0, v22

    iget v0, v0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJointDef;->upperTranslation:F

    move/from16 v18, v0

    .line 267
    move-object/from16 v0, v22

    iget-boolean v0, v0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJointDef;->enableMotor:Z

    move/from16 v19, v0

    .line 268
    move-object/from16 v0, v22

    iget v0, v0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJointDef;->maxMotorForce:F

    move/from16 v20, v0

    .line 269
    move-object/from16 v0, v22

    iget v0, v0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJointDef;->motorSpeed:F

    move/from16 v21, v0

    move-object/from16 v1, p0

    .line 259
    invoke-direct/range {v1 .. v21}, Lcom/badlogic/gdx/physics/box2d/World;->jniCreatePrismaticJoint(JJJZFFFFFFFZFFZFF)J

    move-result-wide v1

    goto/16 :goto_0

    .line 271
    .end local v22           #d:Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJointDef;
    :cond_5
    move-object/from16 v0, p1

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/JointDef;->type:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    sget-object v2, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->PulleyJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    if-ne v1, v2, :cond_6

    move-object/from16 v22, p1

    .line 273
    check-cast v22, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;

    .line 274
    .local v22, d:Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;
    move-object/from16 v0, p0

    iget-wide v2, v0, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    move-object/from16 v0, v22

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->bodyA:Lcom/badlogic/gdx/physics/box2d/Body;

    iget-wide v4, v1, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    move-object/from16 v0, v22

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->bodyB:Lcom/badlogic/gdx/physics/box2d/Body;

    iget-wide v6, v1, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    move-object/from16 v0, v22

    iget-boolean v8, v0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->collideConnected:Z

    .line 275
    move-object/from16 v0, v22

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->groundAnchorA:Lcom/badlogic/gdx/math/Vector2;

    iget v9, v1, Lcom/badlogic/gdx/math/Vector2;->x:F

    move-object/from16 v0, v22

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->groundAnchorA:Lcom/badlogic/gdx/math/Vector2;

    iget v10, v1, Lcom/badlogic/gdx/math/Vector2;->y:F

    .line 276
    move-object/from16 v0, v22

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->groundAnchorB:Lcom/badlogic/gdx/math/Vector2;

    iget v11, v1, Lcom/badlogic/gdx/math/Vector2;->x:F

    move-object/from16 v0, v22

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->groundAnchorB:Lcom/badlogic/gdx/math/Vector2;

    iget v12, v1, Lcom/badlogic/gdx/math/Vector2;->y:F

    .line 277
    move-object/from16 v0, v22

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->localAnchorA:Lcom/badlogic/gdx/math/Vector2;

    iget v13, v1, Lcom/badlogic/gdx/math/Vector2;->x:F

    move-object/from16 v0, v22

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->localAnchorA:Lcom/badlogic/gdx/math/Vector2;

    iget v14, v1, Lcom/badlogic/gdx/math/Vector2;->y:F

    .line 278
    move-object/from16 v0, v22

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->localAnchorB:Lcom/badlogic/gdx/math/Vector2;

    iget v15, v1, Lcom/badlogic/gdx/math/Vector2;->x:F

    move-object/from16 v0, v22

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->localAnchorB:Lcom/badlogic/gdx/math/Vector2;

    iget v0, v1, Lcom/badlogic/gdx/math/Vector2;->y:F

    move/from16 v16, v0

    .line 279
    move-object/from16 v0, v22

    iget v0, v0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->lengthA:F

    move/from16 v17, v0

    .line 280
    move-object/from16 v0, v22

    iget v0, v0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->maxLengthA:F

    move/from16 v18, v0

    .line 281
    move-object/from16 v0, v22

    iget v0, v0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->lengthB:F

    move/from16 v19, v0

    .line 282
    move-object/from16 v0, v22

    iget v0, v0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->maxLengthB:F

    move/from16 v20, v0

    .line 283
    move-object/from16 v0, v22

    iget v0, v0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->ratio:F

    move/from16 v21, v0

    move-object/from16 v1, p0

    .line 274
    invoke-direct/range {v1 .. v21}, Lcom/badlogic/gdx/physics/box2d/World;->jniCreatePulleyJoint(JJJZFFFFFFFFFFFFF)J

    move-result-wide v1

    goto/16 :goto_0

    .line 286
    .end local v22           #d:Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;
    :cond_6
    move-object/from16 v0, p1

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/JointDef;->type:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    sget-object v2, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->RevoluteJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    if-ne v1, v2, :cond_7

    move-object/from16 v22, p1

    .line 288
    check-cast v22, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJointDef;

    .line 289
    .local v22, d:Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJointDef;
    move-object/from16 v0, p0

    iget-wide v2, v0, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    move-object/from16 v0, v22

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJointDef;->bodyA:Lcom/badlogic/gdx/physics/box2d/Body;

    iget-wide v4, v1, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    move-object/from16 v0, v22

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJointDef;->bodyB:Lcom/badlogic/gdx/physics/box2d/Body;

    iget-wide v6, v1, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    move-object/from16 v0, v22

    iget-boolean v8, v0, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJointDef;->collideConnected:Z

    .line 290
    move-object/from16 v0, v22

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJointDef;->localAnchorA:Lcom/badlogic/gdx/math/Vector2;

    iget v9, v1, Lcom/badlogic/gdx/math/Vector2;->x:F

    move-object/from16 v0, v22

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJointDef;->localAnchorA:Lcom/badlogic/gdx/math/Vector2;

    iget v10, v1, Lcom/badlogic/gdx/math/Vector2;->y:F

    .line 291
    move-object/from16 v0, v22

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJointDef;->localAnchorB:Lcom/badlogic/gdx/math/Vector2;

    iget v11, v1, Lcom/badlogic/gdx/math/Vector2;->x:F

    move-object/from16 v0, v22

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJointDef;->localAnchorB:Lcom/badlogic/gdx/math/Vector2;

    iget v12, v1, Lcom/badlogic/gdx/math/Vector2;->y:F

    .line 292
    move-object/from16 v0, v22

    iget v13, v0, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJointDef;->referenceAngle:F

    .line 293
    move-object/from16 v0, v22

    iget-boolean v14, v0, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJointDef;->enableLimit:Z

    .line 294
    move-object/from16 v0, v22

    iget v15, v0, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJointDef;->lowerAngle:F

    .line 295
    move-object/from16 v0, v22

    iget v0, v0, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJointDef;->upperAngle:F

    move/from16 v16, v0

    .line 296
    move-object/from16 v0, v22

    iget-boolean v0, v0, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJointDef;->enableMotor:Z

    move/from16 v17, v0

    .line 297
    move-object/from16 v0, v22

    iget v0, v0, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJointDef;->motorSpeed:F

    move/from16 v18, v0

    .line 298
    move-object/from16 v0, v22

    iget v0, v0, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJointDef;->maxMotorTorque:F

    move/from16 v19, v0

    move-object/from16 v1, p0

    .line 289
    invoke-direct/range {v1 .. v19}, Lcom/badlogic/gdx/physics/box2d/World;->jniCreateRevoluteJoint(JJJZFFFFFZFFZFF)J

    move-result-wide v1

    goto/16 :goto_0

    .line 300
    .end local v22           #d:Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJointDef;
    :cond_7
    move-object/from16 v0, p1

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/JointDef;->type:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    sget-object v2, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->WeldJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    if-ne v1, v2, :cond_8

    move-object/from16 v22, p1

    .line 302
    check-cast v22, Lcom/badlogic/gdx/physics/box2d/joints/WeldJointDef;

    .line 303
    .local v22, d:Lcom/badlogic/gdx/physics/box2d/joints/WeldJointDef;
    move-object/from16 v0, p0

    iget-wide v2, v0, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    move-object/from16 v0, v22

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/WeldJointDef;->bodyA:Lcom/badlogic/gdx/physics/box2d/Body;

    iget-wide v4, v1, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    move-object/from16 v0, v22

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/WeldJointDef;->bodyB:Lcom/badlogic/gdx/physics/box2d/Body;

    iget-wide v6, v1, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    move-object/from16 v0, v22

    iget-boolean v8, v0, Lcom/badlogic/gdx/physics/box2d/joints/WeldJointDef;->collideConnected:Z

    .line 304
    move-object/from16 v0, v22

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/WeldJointDef;->localAnchorA:Lcom/badlogic/gdx/math/Vector2;

    iget v9, v1, Lcom/badlogic/gdx/math/Vector2;->x:F

    move-object/from16 v0, v22

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/WeldJointDef;->localAnchorA:Lcom/badlogic/gdx/math/Vector2;

    iget v10, v1, Lcom/badlogic/gdx/math/Vector2;->y:F

    .line 305
    move-object/from16 v0, v22

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/WeldJointDef;->localAnchorB:Lcom/badlogic/gdx/math/Vector2;

    iget v11, v1, Lcom/badlogic/gdx/math/Vector2;->x:F

    move-object/from16 v0, v22

    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/WeldJointDef;->localAnchorB:Lcom/badlogic/gdx/math/Vector2;

    iget v12, v1, Lcom/badlogic/gdx/math/Vector2;->y:F

    .line 306
    move-object/from16 v0, v22

    iget v13, v0, Lcom/badlogic/gdx/physics/box2d/joints/WeldJointDef;->referenceAngle:F

    move-object/from16 v1, p0

    .line 303
    invoke-direct/range {v1 .. v13}, Lcom/badlogic/gdx/physics/box2d/World;->jniCreateWeldJoint(JJJZFFFFF)J

    move-result-wide v1

    goto/16 :goto_0

    .line 309
    .end local v22           #d:Lcom/badlogic/gdx/physics/box2d/joints/WeldJointDef;
    :cond_8
    const-wide/16 v1, 0x0

    goto/16 :goto_0
.end method

.method private endContact(J)V
    .locals 2
    .parameter "contactAddr"

    .prologue
    .line 665
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->contact:Lcom/badlogic/gdx/physics/box2d/Contact;

    iput-wide p1, v0, Lcom/badlogic/gdx/physics/box2d/Contact;->addr:J

    .line 666
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->contact:Lcom/badlogic/gdx/physics/box2d/Contact;

    invoke-virtual {v0}, Lcom/badlogic/gdx/physics/box2d/Contact;->GetWorldManifold()Lcom/badlogic/gdx/physics/box2d/WorldManifold;

    .line 667
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->contactListener:Lcom/badlogic/gdx/physics/box2d/ContactListener;

    if-eqz v0, :cond_0

    .line 668
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->contactListener:Lcom/badlogic/gdx/physics/box2d/ContactListener;

    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/World;->contact:Lcom/badlogic/gdx/physics/box2d/Contact;

    invoke-interface {v0, v1}, Lcom/badlogic/gdx/physics/box2d/ContactListener;->endContact(Lcom/badlogic/gdx/physics/box2d/Contact;)V

    .line 669
    :cond_0
    return-void
.end method

.method private native jniClearForces(J)V
.end method

.method private native jniCreateBody(JIFFFFFFFFZZZZZF)J
.end method

.method private native jniCreateDistanceJoint(JJJZFFFFFFF)J
.end method

.method private native jniCreateFrictionJoint(JJJZFFFFFF)J
.end method

.method private native jniCreateGearJoint(JJJZJJF)J
.end method

.method private native jniCreateLineJoint(JJJZFFFFFFZFFZFF)J
.end method

.method private native jniCreateMouseJoint(JJJZFFFFF)J
.end method

.method private native jniCreatePrismaticJoint(JJJZFFFFFFFZFFZFF)J
.end method

.method private native jniCreatePulleyJoint(JJJZFFFFFFFFFFFFF)J
.end method

.method private native jniCreateRevoluteJoint(JJJZFFFFFZFFZFF)J
.end method

.method private native jniCreateWeldJoint(JJJZFFFFF)J
.end method

.method private native jniDestroyBody(JJ)V
.end method

.method private native jniDestroyJoint(JJ)V
.end method

.method private native jniDispose(J)V
.end method

.method private native jniGetAutoClearForces(J)Z
.end method

.method private native jniGetBodyCount(J)I
.end method

.method private native jniGetContactCount(J)I
.end method

.method private native jniGetContactList(J[J)V
.end method

.method private native jniGetGravity(J[F)V
.end method

.method private native jniGetJointcount(J)I
.end method

.method private native jniGetProxyCount(J)I
.end method

.method private native jniIsLocked(J)Z
.end method

.method private native jniQueryAABB(JFFFF)V
.end method

.method private native jniSetAutoClearForces(JZ)V
.end method

.method private native jniSetContiousPhysics(JZ)V
.end method

.method private native jniSetGravity(JFF)V
.end method

.method private native jniSetWarmStarting(JZ)V
.end method

.method private native jniStep(JFII)V
.end method

.method private native newWorld(FFZ)J
.end method

.method private reportFixture(J)Z
    .locals 2
    .parameter "addr"

    .prologue
    .line 673
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->queryCallback:Lcom/badlogic/gdx/physics/box2d/QueryCallback;

    if-eqz v0, :cond_0

    .line 674
    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/World;->queryCallback:Lcom/badlogic/gdx/physics/box2d/QueryCallback;

    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->fixtures:Lcom/badlogic/gdx/utils/LongHashMap;

    invoke-virtual {v0, p1, p2}, Lcom/badlogic/gdx/utils/LongHashMap;->get(J)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/physics/box2d/Fixture;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/physics/box2d/QueryCallback;->reportFixture(Lcom/badlogic/gdx/physics/box2d/Fixture;)Z

    move-result v0

    .line 676
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public QueryAABB(Lcom/badlogic/gdx/physics/box2d/QueryCallback;FFFF)V
    .locals 7
    .parameter "callback"
    .parameter "lowerX"
    .parameter "lowerY"
    .parameter "upperX"
    .parameter "upperY"

    .prologue
    .line 552
    iput-object p1, p0, Lcom/badlogic/gdx/physics/box2d/World;->queryCallback:Lcom/badlogic/gdx/physics/box2d/QueryCallback;

    .line 553
    iget-wide v1, p0, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    move-object v0, p0

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/badlogic/gdx/physics/box2d/World;->jniQueryAABB(JFFFF)V

    .line 554
    return-void
.end method

.method public clearForces()V
    .locals 2

    .prologue
    .line 425
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/World;->jniClearForces(J)V

    .line 426
    return-void
.end method

.method public createBody(Lcom/badlogic/gdx/physics/box2d/BodyDef;)Lcom/badlogic/gdx/physics/box2d/Body;
    .locals 21
    .parameter "def"

    .prologue
    .line 121
    new-instance v20, Lcom/badlogic/gdx/physics/box2d/Body;

    move-object/from16 v0, p0

    iget-wide v3, v0, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    .line 122
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/badlogic/gdx/physics/box2d/BodyDef;->type:Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;

    invoke-virtual {v2}, Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;->getValue()I

    move-result v5

    .line 123
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/badlogic/gdx/physics/box2d/BodyDef;->position:Lcom/badlogic/gdx/math/Vector2;

    iget v6, v2, Lcom/badlogic/gdx/math/Vector2;->x:F

    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/badlogic/gdx/physics/box2d/BodyDef;->position:Lcom/badlogic/gdx/math/Vector2;

    iget v7, v2, Lcom/badlogic/gdx/math/Vector2;->y:F

    .line 124
    move-object/from16 v0, p1

    iget v8, v0, Lcom/badlogic/gdx/physics/box2d/BodyDef;->angle:F

    .line 125
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/badlogic/gdx/physics/box2d/BodyDef;->linearVelocity:Lcom/badlogic/gdx/math/Vector2;

    iget v9, v2, Lcom/badlogic/gdx/math/Vector2;->x:F

    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/badlogic/gdx/physics/box2d/BodyDef;->linearVelocity:Lcom/badlogic/gdx/math/Vector2;

    iget v10, v2, Lcom/badlogic/gdx/math/Vector2;->y:F

    .line 126
    move-object/from16 v0, p1

    iget v11, v0, Lcom/badlogic/gdx/physics/box2d/BodyDef;->angularVelocity:F

    .line 127
    move-object/from16 v0, p1

    iget v12, v0, Lcom/badlogic/gdx/physics/box2d/BodyDef;->linearDamping:F

    .line 128
    move-object/from16 v0, p1

    iget v13, v0, Lcom/badlogic/gdx/physics/box2d/BodyDef;->angularDamping:F

    .line 129
    move-object/from16 v0, p1

    iget-boolean v14, v0, Lcom/badlogic/gdx/physics/box2d/BodyDef;->allowSleep:Z

    .line 130
    move-object/from16 v0, p1

    iget-boolean v15, v0, Lcom/badlogic/gdx/physics/box2d/BodyDef;->awake:Z

    .line 131
    move-object/from16 v0, p1

    iget-boolean v0, v0, Lcom/badlogic/gdx/physics/box2d/BodyDef;->fixedRotation:Z

    move/from16 v16, v0

    .line 132
    move-object/from16 v0, p1

    iget-boolean v0, v0, Lcom/badlogic/gdx/physics/box2d/BodyDef;->bullet:Z

    move/from16 v17, v0

    .line 133
    move-object/from16 v0, p1

    iget-boolean v0, v0, Lcom/badlogic/gdx/physics/box2d/BodyDef;->active:Z

    move/from16 v18, v0

    .line 134
    move-object/from16 v0, p1

    iget v0, v0, Lcom/badlogic/gdx/physics/box2d/BodyDef;->inertiaScale:F

    move/from16 v19, v0

    move-object/from16 v2, p0

    .line 121
    invoke-direct/range {v2 .. v19}, Lcom/badlogic/gdx/physics/box2d/World;->jniCreateBody(JIFFFFFFFFZZZZZF)J

    move-result-wide v2

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v2, v3}, Lcom/badlogic/gdx/physics/box2d/Body;-><init>(Lcom/badlogic/gdx/physics/box2d/World;J)V

    .line 135
    .local v20, body:Lcom/badlogic/gdx/physics/box2d/Body;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/badlogic/gdx/physics/box2d/World;->bodies:Lcom/badlogic/gdx/utils/LongHashMap;

    move-object/from16 v0, v20

    iget-wide v3, v0, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    move-object/from16 v0, v20

    invoke-virtual {v2, v3, v4, v0}, Lcom/badlogic/gdx/utils/LongHashMap;->put(JLjava/lang/Object;)Ljava/lang/Object;

    .line 136
    return-object v20
.end method

.method public createJoint(Lcom/badlogic/gdx/physics/box2d/JointDef;)Lcom/badlogic/gdx/physics/box2d/Joint;
    .locals 8
    .parameter "def"

    .prologue
    .line 179
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/physics/box2d/World;->createProperJoint(Lcom/badlogic/gdx/physics/box2d/JointDef;)J

    move-result-wide v1

    .line 180
    .local v1, jointAddr:J
    const/4 v0, 0x0

    .line 181
    .local v0, joint:Lcom/badlogic/gdx/physics/box2d/Joint;
    iget-object v5, p1, Lcom/badlogic/gdx/physics/box2d/JointDef;->type:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    sget-object v6, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->DistanceJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    if-ne v5, v6, :cond_0

    .line 182
    new-instance v0, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJoint;

    .end local v0           #joint:Lcom/badlogic/gdx/physics/box2d/Joint;
    invoke-direct {v0, p0, v1, v2}, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJoint;-><init>(Lcom/badlogic/gdx/physics/box2d/World;J)V

    .line 183
    .restart local v0       #joint:Lcom/badlogic/gdx/physics/box2d/Joint;
    :cond_0
    iget-object v5, p1, Lcom/badlogic/gdx/physics/box2d/JointDef;->type:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    sget-object v6, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->FrictionJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    if-ne v5, v6, :cond_1

    .line 184
    new-instance v0, Lcom/badlogic/gdx/physics/box2d/joints/FrictionJoint;

    .end local v0           #joint:Lcom/badlogic/gdx/physics/box2d/Joint;
    invoke-direct {v0, p0, v1, v2}, Lcom/badlogic/gdx/physics/box2d/joints/FrictionJoint;-><init>(Lcom/badlogic/gdx/physics/box2d/World;J)V

    .line 185
    .restart local v0       #joint:Lcom/badlogic/gdx/physics/box2d/Joint;
    :cond_1
    iget-object v5, p1, Lcom/badlogic/gdx/physics/box2d/JointDef;->type:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    sget-object v6, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->GearJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    if-ne v5, v6, :cond_2

    .line 186
    new-instance v0, Lcom/badlogic/gdx/physics/box2d/joints/GearJoint;

    .end local v0           #joint:Lcom/badlogic/gdx/physics/box2d/Joint;
    invoke-direct {v0, p0, v1, v2}, Lcom/badlogic/gdx/physics/box2d/joints/GearJoint;-><init>(Lcom/badlogic/gdx/physics/box2d/World;J)V

    .line 187
    .restart local v0       #joint:Lcom/badlogic/gdx/physics/box2d/Joint;
    :cond_2
    iget-object v5, p1, Lcom/badlogic/gdx/physics/box2d/JointDef;->type:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    sget-object v6, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->LineJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    if-ne v5, v6, :cond_3

    .line 188
    new-instance v0, Lcom/badlogic/gdx/physics/box2d/joints/LineJoint;

    .end local v0           #joint:Lcom/badlogic/gdx/physics/box2d/Joint;
    invoke-direct {v0, p0, v1, v2}, Lcom/badlogic/gdx/physics/box2d/joints/LineJoint;-><init>(Lcom/badlogic/gdx/physics/box2d/World;J)V

    .line 189
    .restart local v0       #joint:Lcom/badlogic/gdx/physics/box2d/Joint;
    :cond_3
    iget-object v5, p1, Lcom/badlogic/gdx/physics/box2d/JointDef;->type:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    sget-object v6, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->MouseJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    if-ne v5, v6, :cond_4

    .line 190
    new-instance v0, Lcom/badlogic/gdx/physics/box2d/joints/MouseJoint;

    .end local v0           #joint:Lcom/badlogic/gdx/physics/box2d/Joint;
    invoke-direct {v0, p0, v1, v2}, Lcom/badlogic/gdx/physics/box2d/joints/MouseJoint;-><init>(Lcom/badlogic/gdx/physics/box2d/World;J)V

    .line 191
    .restart local v0       #joint:Lcom/badlogic/gdx/physics/box2d/Joint;
    :cond_4
    iget-object v5, p1, Lcom/badlogic/gdx/physics/box2d/JointDef;->type:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    sget-object v6, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->PrismaticJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    if-ne v5, v6, :cond_5

    .line 192
    new-instance v0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJoint;

    .end local v0           #joint:Lcom/badlogic/gdx/physics/box2d/Joint;
    invoke-direct {v0, p0, v1, v2}, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJoint;-><init>(Lcom/badlogic/gdx/physics/box2d/World;J)V

    .line 193
    .restart local v0       #joint:Lcom/badlogic/gdx/physics/box2d/Joint;
    :cond_5
    iget-object v5, p1, Lcom/badlogic/gdx/physics/box2d/JointDef;->type:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    sget-object v6, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->PulleyJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    if-ne v5, v6, :cond_6

    .line 194
    new-instance v0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJoint;

    .end local v0           #joint:Lcom/badlogic/gdx/physics/box2d/Joint;
    invoke-direct {v0, p0, v1, v2}, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJoint;-><init>(Lcom/badlogic/gdx/physics/box2d/World;J)V

    .line 195
    .restart local v0       #joint:Lcom/badlogic/gdx/physics/box2d/Joint;
    :cond_6
    iget-object v5, p1, Lcom/badlogic/gdx/physics/box2d/JointDef;->type:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    sget-object v6, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->RevoluteJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    if-ne v5, v6, :cond_7

    .line 196
    new-instance v0, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJoint;

    .end local v0           #joint:Lcom/badlogic/gdx/physics/box2d/Joint;
    invoke-direct {v0, p0, v1, v2}, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJoint;-><init>(Lcom/badlogic/gdx/physics/box2d/World;J)V

    .line 197
    .restart local v0       #joint:Lcom/badlogic/gdx/physics/box2d/Joint;
    :cond_7
    iget-object v5, p1, Lcom/badlogic/gdx/physics/box2d/JointDef;->type:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    sget-object v6, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->WeldJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    if-ne v5, v6, :cond_8

    .line 198
    new-instance v0, Lcom/badlogic/gdx/physics/box2d/joints/WeldJoint;

    .end local v0           #joint:Lcom/badlogic/gdx/physics/box2d/Joint;
    invoke-direct {v0, p0, v1, v2}, Lcom/badlogic/gdx/physics/box2d/joints/WeldJoint;-><init>(Lcom/badlogic/gdx/physics/box2d/World;J)V

    .line 199
    .restart local v0       #joint:Lcom/badlogic/gdx/physics/box2d/Joint;
    :cond_8
    if-eqz v0, :cond_9

    .line 200
    iget-object v5, p0, Lcom/badlogic/gdx/physics/box2d/World;->joints:Lcom/badlogic/gdx/utils/LongHashMap;

    iget-wide v6, v0, Lcom/badlogic/gdx/physics/box2d/Joint;->addr:J

    invoke-virtual {v5, v6, v7, v0}, Lcom/badlogic/gdx/utils/LongHashMap;->put(JLjava/lang/Object;)Ljava/lang/Object;

    .line 201
    :cond_9
    new-instance v3, Lcom/badlogic/gdx/physics/box2d/JointEdge;

    iget-object v5, p1, Lcom/badlogic/gdx/physics/box2d/JointDef;->bodyB:Lcom/badlogic/gdx/physics/box2d/Body;

    invoke-direct {v3, v5, v0}, Lcom/badlogic/gdx/physics/box2d/JointEdge;-><init>(Lcom/badlogic/gdx/physics/box2d/Body;Lcom/badlogic/gdx/physics/box2d/Joint;)V

    .line 202
    .local v3, jointEdgeA:Lcom/badlogic/gdx/physics/box2d/JointEdge;
    new-instance v4, Lcom/badlogic/gdx/physics/box2d/JointEdge;

    iget-object v5, p1, Lcom/badlogic/gdx/physics/box2d/JointDef;->bodyA:Lcom/badlogic/gdx/physics/box2d/Body;

    invoke-direct {v4, v5, v0}, Lcom/badlogic/gdx/physics/box2d/JointEdge;-><init>(Lcom/badlogic/gdx/physics/box2d/Body;Lcom/badlogic/gdx/physics/box2d/Joint;)V

    .line 203
    .local v4, jointEdgeB:Lcom/badlogic/gdx/physics/box2d/JointEdge;
    iput-object v3, v0, Lcom/badlogic/gdx/physics/box2d/Joint;->jointEdgeA:Lcom/badlogic/gdx/physics/box2d/JointEdge;

    .line 204
    iput-object v4, v0, Lcom/badlogic/gdx/physics/box2d/Joint;->jointEdgeB:Lcom/badlogic/gdx/physics/box2d/JointEdge;

    .line 205
    iget-object v5, p1, Lcom/badlogic/gdx/physics/box2d/JointDef;->bodyA:Lcom/badlogic/gdx/physics/box2d/Body;

    iget-object v5, v5, Lcom/badlogic/gdx/physics/box2d/Body;->joints:Ljava/util/ArrayList;

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 206
    iget-object v5, p1, Lcom/badlogic/gdx/physics/box2d/JointDef;->bodyB:Lcom/badlogic/gdx/physics/box2d/Body;

    iget-object v5, v5, Lcom/badlogic/gdx/physics/box2d/Body;->joints:Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 207
    return-object v0
.end method

.method public destroyBody(Lcom/badlogic/gdx/physics/box2d/Body;)V
    .locals 5
    .parameter "body"

    .prologue
    .line 162
    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/World;->bodies:Lcom/badlogic/gdx/utils/LongHashMap;

    iget-wide v2, p1, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    invoke-virtual {v1, v2, v3}, Lcom/badlogic/gdx/utils/LongHashMap;->remove(J)Ljava/lang/Object;

    .line 163
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    invoke-virtual {p1}, Lcom/badlogic/gdx/physics/box2d/Body;->getFixtureList()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lt v0, v1, :cond_0

    .line 165
    const/4 v0, 0x0

    :goto_1
    invoke-virtual {p1}, Lcom/badlogic/gdx/physics/box2d/Body;->getJointList()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lt v0, v1, :cond_1

    .line 167
    iget-wide v1, p0, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    iget-wide v3, p1, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    invoke-direct {p0, v1, v2, v3, v4}, Lcom/badlogic/gdx/physics/box2d/World;->jniDestroyBody(JJ)V

    .line 168
    return-void

    .line 164
    :cond_0
    iget-object v2, p0, Lcom/badlogic/gdx/physics/box2d/World;->fixtures:Lcom/badlogic/gdx/utils/LongHashMap;

    invoke-virtual {p1}, Lcom/badlogic/gdx/physics/box2d/Body;->getFixtureList()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/physics/box2d/Fixture;

    iget-wide v3, v1, Lcom/badlogic/gdx/physics/box2d/Fixture;->addr:J

    invoke-virtual {v2, v3, v4}, Lcom/badlogic/gdx/utils/LongHashMap;->remove(J)Ljava/lang/Object;

    .line 163
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 166
    :cond_1
    iget-object v2, p0, Lcom/badlogic/gdx/physics/box2d/World;->joints:Lcom/badlogic/gdx/utils/LongHashMap;

    invoke-virtual {p1}, Lcom/badlogic/gdx/physics/box2d/Body;->getJointList()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/physics/box2d/JointEdge;

    iget-object v1, v1, Lcom/badlogic/gdx/physics/box2d/JointEdge;->joint:Lcom/badlogic/gdx/physics/box2d/Joint;

    iget-wide v3, v1, Lcom/badlogic/gdx/physics/box2d/Joint;->addr:J

    invoke-virtual {v2, v3, v4}, Lcom/badlogic/gdx/utils/LongHashMap;->remove(J)Ljava/lang/Object;

    .line 165
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public destroyJoint(Lcom/badlogic/gdx/physics/box2d/Joint;)V
    .locals 4
    .parameter "joint"

    .prologue
    .line 393
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->joints:Lcom/badlogic/gdx/utils/LongHashMap;

    iget-wide v1, p1, Lcom/badlogic/gdx/physics/box2d/Joint;->addr:J

    invoke-virtual {v0, v1, v2}, Lcom/badlogic/gdx/utils/LongHashMap;->remove(J)Ljava/lang/Object;

    .line 394
    iget-object v0, p1, Lcom/badlogic/gdx/physics/box2d/Joint;->jointEdgeA:Lcom/badlogic/gdx/physics/box2d/JointEdge;

    iget-object v0, v0, Lcom/badlogic/gdx/physics/box2d/JointEdge;->other:Lcom/badlogic/gdx/physics/box2d/Body;

    iget-object v0, v0, Lcom/badlogic/gdx/physics/box2d/Body;->joints:Ljava/util/ArrayList;

    iget-object v1, p1, Lcom/badlogic/gdx/physics/box2d/Joint;->jointEdgeB:Lcom/badlogic/gdx/physics/box2d/JointEdge;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 395
    iget-object v0, p1, Lcom/badlogic/gdx/physics/box2d/Joint;->jointEdgeB:Lcom/badlogic/gdx/physics/box2d/JointEdge;

    iget-object v0, v0, Lcom/badlogic/gdx/physics/box2d/JointEdge;->other:Lcom/badlogic/gdx/physics/box2d/Body;

    iget-object v0, v0, Lcom/badlogic/gdx/physics/box2d/Body;->joints:Ljava/util/ArrayList;

    iget-object v1, p1, Lcom/badlogic/gdx/physics/box2d/Joint;->jointEdgeA:Lcom/badlogic/gdx/physics/box2d/JointEdge;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 396
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    iget-wide v2, p1, Lcom/badlogic/gdx/physics/box2d/Joint;->addr:J

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/badlogic/gdx/physics/box2d/World;->jniDestroyJoint(JJ)V

    .line 397
    return-void
.end method

.method public dispose()V
    .locals 2

    .prologue
    .line 624
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/World;->jniDispose(J)V

    .line 625
    return-void
.end method

.method public getAutoClearForces()Z
    .locals 2

    .prologue
    .line 539
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/World;->jniGetAutoClearForces(J)Z

    move-result v0

    return v0
.end method

.method public getBodies()Ljava/lang/Iterable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Iterable",
            "<",
            "Lcom/badlogic/gdx/physics/box2d/Body;",
            ">;"
        }
    .end annotation

    .prologue
    .line 609
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->bodies:Lcom/badlogic/gdx/utils/LongHashMap;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/LongHashMap;->values()Ljava/lang/Iterable;

    move-result-object v0

    return-object v0
.end method

.method public getBodyCount()I
    .locals 2

    .prologue
    .line 465
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/World;->jniGetBodyCount(J)I

    move-result v0

    return v0
.end method

.method public getContactCount()I
    .locals 2

    .prologue
    .line 485
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/World;->jniGetContactCount(J)I

    move-result v0

    return v0
.end method

.method public getContactList()Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/badlogic/gdx/physics/box2d/Contact;",
            ">;"
        }
    .end annotation

    .prologue
    .line 582
    invoke-virtual {p0}, Lcom/badlogic/gdx/physics/box2d/World;->getContactCount()I

    move-result v3

    .line 583
    .local v3, numContacts:I
    iget-object v4, p0, Lcom/badlogic/gdx/physics/box2d/World;->contactAddrs:[J

    array-length v4, v4

    if-le v3, v4, :cond_0

    .line 584
    new-array v4, v3, [J

    iput-object v4, p0, Lcom/badlogic/gdx/physics/box2d/World;->contactAddrs:[J

    .line 585
    :cond_0
    iget-object v4, p0, Lcom/badlogic/gdx/physics/box2d/World;->freeContacts:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-le v3, v4, :cond_1

    .line 587
    iget-object v4, p0, Lcom/badlogic/gdx/physics/box2d/World;->freeContacts:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 588
    .local v1, freeConts:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    sub-int v4, v3, v1

    if-lt v2, v4, :cond_2

    .line 591
    .end local v1           #freeConts:I
    .end local v2           #i:I
    :cond_1
    iget-wide v4, p0, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    iget-object v6, p0, Lcom/badlogic/gdx/physics/box2d/World;->contactAddrs:[J

    invoke-direct {p0, v4, v5, v6}, Lcom/badlogic/gdx/physics/box2d/World;->jniGetContactList(J[J)V

    .line 593
    iget-object v4, p0, Lcom/badlogic/gdx/physics/box2d/World;->contacts:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->clear()V

    .line 594
    const/4 v2, 0x0

    .restart local v2       #i:I
    :goto_1
    if-lt v2, v3, :cond_3

    .line 601
    iget-object v4, p0, Lcom/badlogic/gdx/physics/box2d/World;->contacts:Ljava/util/ArrayList;

    return-object v4

    .line 589
    .restart local v1       #freeConts:I
    :cond_2
    iget-object v4, p0, Lcom/badlogic/gdx/physics/box2d/World;->freeContacts:Ljava/util/ArrayList;

    new-instance v5, Lcom/badlogic/gdx/physics/box2d/Contact;

    const-wide/16 v6, 0x0

    invoke-direct {v5, p0, v6, v7}, Lcom/badlogic/gdx/physics/box2d/Contact;-><init>(Lcom/badlogic/gdx/physics/box2d/World;J)V

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 588
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 596
    .end local v1           #freeConts:I
    :cond_3
    iget-object v4, p0, Lcom/badlogic/gdx/physics/box2d/World;->freeContacts:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/physics/box2d/Contact;

    .line 597
    .local v0, contact:Lcom/badlogic/gdx/physics/box2d/Contact;
    iget-object v4, p0, Lcom/badlogic/gdx/physics/box2d/World;->contactAddrs:[J

    aget-wide v4, v4, v2

    iput-wide v4, v0, Lcom/badlogic/gdx/physics/box2d/Contact;->addr:J

    .line 598
    iget-object v4, p0, Lcom/badlogic/gdx/physics/box2d/World;->contacts:Ljava/util/ArrayList;

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 594
    add-int/lit8 v2, v2, 0x1

    goto :goto_1
.end method

.method public getGravity()Lcom/badlogic/gdx/math/Vector2;
    .locals 3

    .prologue
    .line 507
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    iget-object v2, p0, Lcom/badlogic/gdx/physics/box2d/World;->tmpGravity:[F

    invoke-direct {p0, v0, v1, v2}, Lcom/badlogic/gdx/physics/box2d/World;->jniGetGravity(J[F)V

    .line 508
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->gravity:Lcom/badlogic/gdx/math/Vector2;

    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/World;->tmpGravity:[F

    const/4 v2, 0x0

    aget v1, v1, v2

    iput v1, v0, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->gravity:Lcom/badlogic/gdx/math/Vector2;

    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/World;->tmpGravity:[F

    const/4 v2, 0x1

    aget v1, v1, v2

    iput v1, v0, Lcom/badlogic/gdx/math/Vector2;->y:F

    .line 509
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->gravity:Lcom/badlogic/gdx/math/Vector2;

    return-object v0
.end method

.method public getJointCount()I
    .locals 2

    .prologue
    .line 475
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/World;->jniGetJointcount(J)I

    move-result v0

    return v0
.end method

.method public getJoints()Ljava/lang/Iterable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Iterable",
            "<",
            "Lcom/badlogic/gdx/physics/box2d/Joint;",
            ">;"
        }
    .end annotation

    .prologue
    .line 617
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->joints:Lcom/badlogic/gdx/utils/LongHashMap;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/LongHashMap;->values()Ljava/lang/Iterable;

    move-result-object v0

    return-object v0
.end method

.method public getProxyCount()I
    .locals 2

    .prologue
    .line 455
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/World;->jniGetProxyCount(J)I

    move-result v0

    return v0
.end method

.method public isLocked()Z
    .locals 2

    .prologue
    .line 519
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/World;->jniIsLocked(J)Z

    move-result v0

    return v0
.end method

.method public setAutoClearForces(Z)V
    .locals 2
    .parameter "flag"

    .prologue
    .line 529
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    invoke-direct {p0, v0, v1, p1}, Lcom/badlogic/gdx/physics/box2d/World;->jniSetAutoClearForces(JZ)V

    .line 530
    return-void
.end method

.method public setContactFilter(Lcom/badlogic/gdx/physics/box2d/ContactFilter;)V
    .locals 0
    .parameter "filter"

    .prologue
    .line 102
    iput-object p1, p0, Lcom/badlogic/gdx/physics/box2d/World;->contactFilter:Lcom/badlogic/gdx/physics/box2d/ContactFilter;

    .line 103
    return-void
.end method

.method public setContactListener(Lcom/badlogic/gdx/physics/box2d/ContactListener;)V
    .locals 0
    .parameter "listener"

    .prologue
    .line 111
    iput-object p1, p0, Lcom/badlogic/gdx/physics/box2d/World;->contactListener:Lcom/badlogic/gdx/physics/box2d/ContactListener;

    .line 112
    return-void
.end method

.method public setContinuousPhysics(Z)V
    .locals 2
    .parameter "flag"

    .prologue
    .line 445
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    invoke-direct {p0, v0, v1, p1}, Lcom/badlogic/gdx/physics/box2d/World;->jniSetContiousPhysics(JZ)V

    .line 446
    return-void
.end method

.method public setDestructionListener(Lcom/badlogic/gdx/physics/box2d/DestructionListener;)V
    .locals 0
    .parameter "listener"

    .prologue
    .line 93
    return-void
.end method

.method public setGravity(Lcom/badlogic/gdx/math/Vector2;)V
    .locals 4
    .parameter "gravity"

    .prologue
    .line 495
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    iget v2, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget v3, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/badlogic/gdx/physics/box2d/World;->jniSetGravity(JFF)V

    .line 496
    return-void
.end method

.method public setWarmStarting(Z)V
    .locals 2
    .parameter "flag"

    .prologue
    .line 435
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    invoke-direct {p0, v0, v1, p1}, Lcom/badlogic/gdx/physics/box2d/World;->jniSetWarmStarting(JZ)V

    .line 436
    return-void
.end method

.method public step(FII)V
    .locals 6
    .parameter "timeStep"
    .parameter "velocityIterations"
    .parameter "positionIterations"

    .prologue
    .line 412
    iget-wide v1, p0, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    move-object v0, p0

    move v3, p1

    move v4, p2

    move v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/badlogic/gdx/physics/box2d/World;->jniStep(JFII)V

    .line 413
    return-void
.end method
