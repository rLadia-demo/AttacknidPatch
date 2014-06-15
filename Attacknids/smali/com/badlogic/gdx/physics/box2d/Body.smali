.class public Lcom/badlogic/gdx/physics/box2d/Body;
.super Ljava/lang/Object;
.source "Body.java"


# instance fields
.field protected final addr:J

.field private fixtures:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/badlogic/gdx/physics/box2d/Fixture;",
            ">;"
        }
    .end annotation
.end field

.field protected joints:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/badlogic/gdx/physics/box2d/JointEdge;",
            ">;"
        }
    .end annotation
.end field

.field public final linVelLoc:Lcom/badlogic/gdx/math/Vector2;

.field public final linVelWorld:Lcom/badlogic/gdx/math/Vector2;

.field private final linearVelocity:Lcom/badlogic/gdx/math/Vector2;

.field private final localCenter:Lcom/badlogic/gdx/math/Vector2;

.field private final localPoint:Lcom/badlogic/gdx/math/Vector2;

.field public final localPoint2:Lcom/badlogic/gdx/math/Vector2;

.field public final localVector:Lcom/badlogic/gdx/math/Vector2;

.field private final massData:Lcom/badlogic/gdx/physics/box2d/MassData;

.field private final position:Lcom/badlogic/gdx/math/Vector2;

.field private final tmp:[F

.field private final transform:Lcom/badlogic/gdx/physics/box2d/Transform;

.field private userData:Ljava/lang/Object;

.field private final world:Lcom/badlogic/gdx/physics/box2d/World;

.field private final worldCenter:Lcom/badlogic/gdx/math/Vector2;

.field private final worldVector:Lcom/badlogic/gdx/math/Vector2;


# direct methods
.method protected constructor <init>(Lcom/badlogic/gdx/physics/box2d/World;J)V
    .locals 2
    .parameter "world"
    .parameter "addr"

    .prologue
    const/4 v1, 0x2

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    const/4 v0, 0x4

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->tmp:[F

    .line 40
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->fixtures:Ljava/util/ArrayList;

    .line 43
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->joints:Ljava/util/ArrayList;

    .line 132
    new-instance v0, Lcom/badlogic/gdx/physics/box2d/Transform;

    invoke-direct {v0}, Lcom/badlogic/gdx/physics/box2d/Transform;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->transform:Lcom/badlogic/gdx/physics/box2d/Transform;

    .line 145
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->position:Lcom/badlogic/gdx/math/Vector2;

    .line 169
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->worldCenter:Lcom/badlogic/gdx/math/Vector2;

    .line 182
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->localCenter:Lcom/badlogic/gdx/math/Vector2;

    .line 205
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->linearVelocity:Lcom/badlogic/gdx/math/Vector2;

    .line 313
    new-instance v0, Lcom/badlogic/gdx/physics/box2d/MassData;

    invoke-direct {v0}, Lcom/badlogic/gdx/physics/box2d/MassData;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->massData:Lcom/badlogic/gdx/physics/box2d/MassData;

    .line 357
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->localPoint:Lcom/badlogic/gdx/math/Vector2;

    .line 372
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->worldVector:Lcom/badlogic/gdx/math/Vector2;

    .line 387
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->localPoint2:Lcom/badlogic/gdx/math/Vector2;

    .line 402
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->localVector:Lcom/badlogic/gdx/math/Vector2;

    .line 417
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->linVelWorld:Lcom/badlogic/gdx/math/Vector2;

    .line 432
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->linVelLoc:Lcom/badlogic/gdx/math/Vector2;

    .line 55
    iput-object p1, p0, Lcom/badlogic/gdx/physics/box2d/Body;->world:Lcom/badlogic/gdx/physics/box2d/World;

    .line 56
    iput-wide p2, p0, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    .line 57
    return-void
.end method

.method private native jniApplyAngularImpulse(JF)V
.end method

.method private native jniApplyForce(JFFFF)V
.end method

.method private native jniApplyLinearImpulse(JFFFF)V
.end method

.method private native jniApplyTorque(JF)V
.end method

.method private native jniCreateFixture(JJF)J
.end method

.method private native jniCreateFixture(JJFFFZSSS)J
.end method

.method private native jniDestroyFixture(JJ)V
.end method

.method private native jniGetAngle(J)F
.end method

.method private native jniGetAngularDamping(J)F
.end method

.method private native jniGetAngularVelocity(J)F
.end method

.method private native jniGetInertia(J)F
.end method

.method private native jniGetLinearDamping(J)F
.end method

.method private native jniGetLinearVelocity(J[F)V
.end method

.method private native jniGetLinearVelocityFromLocalPoint(JFF[F)V
.end method

.method private native jniGetLinearVelocityFromWorldPoint(JFF[F)V
.end method

.method private native jniGetLocalCenter(J[F)V
.end method

.method private native jniGetLocalPoint(JFF[F)V
.end method

.method private native jniGetLocalVector(JFF[F)V
.end method

.method private native jniGetMass(J)F
.end method

.method private native jniGetMassData(J[F)V
.end method

.method private native jniGetPosition(J[F)V
.end method

.method private native jniGetTransform(J[F)V
.end method

.method private native jniGetType(J)I
.end method

.method private native jniGetWorldCenter(J[F)V
.end method

.method private native jniGetWorldPoint(JFF[F)V
.end method

.method private native jniGetWorldVector(JFF[F)V
.end method

.method private native jniIsActive(J)Z
.end method

.method private native jniIsAwake(J)Z
.end method

.method private native jniIsBullet(J)Z
.end method

.method private native jniIsFixedRotation(J)Z
.end method

.method private native jniIsSleepingAllowed(J)Z
.end method

.method private native jniResetMassData(J)V
.end method

.method private native jniSetActive(JZ)V
.end method

.method private native jniSetAngularDamping(JF)V
.end method

.method private native jniSetAngularVelocity(JF)V
.end method

.method private native jniSetAwake(JZ)V
.end method

.method private native jniSetBullet(JZ)V
.end method

.method private native jniSetFixedRotation(JZ)V
.end method

.method private native jniSetLinearDamping(JF)V
.end method

.method private native jniSetLinearVelocity(JFF)V
.end method

.method private native jniSetMassData(JFFFF)V
.end method

.method private native jniSetSleepingAllowed(JZ)V
.end method

.method private native jniSetTransform(JFFF)V
.end method

.method private native jniSetType(JI)V
.end method


# virtual methods
.method public applyAngularImpulse(F)V
    .locals 2
    .parameter "impulse"

    .prologue
    .line 282
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    invoke-direct {p0, v0, v1, p1}, Lcom/badlogic/gdx/physics/box2d/Body;->jniApplyAngularImpulse(JF)V

    .line 283
    return-void
.end method

.method public applyForce(Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/math/Vector2;)V
    .locals 7
    .parameter "force"
    .parameter "point"

    .prologue
    .line 244
    iget-wide v1, p0, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    iget v3, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget v4, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    iget v5, p2, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget v6, p2, Lcom/badlogic/gdx/math/Vector2;->y:F

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/badlogic/gdx/physics/box2d/Body;->jniApplyForce(JFFFF)V

    .line 245
    return-void
.end method

.method public applyLinearImpulse(Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/math/Vector2;)V
    .locals 7
    .parameter "impulse"
    .parameter "point"

    .prologue
    .line 271
    iget-wide v1, p0, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    iget v3, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget v4, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    iget v5, p2, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget v6, p2, Lcom/badlogic/gdx/math/Vector2;->y:F

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/badlogic/gdx/physics/box2d/Body;->jniApplyLinearImpulse(JFFFF)V

    .line 272
    return-void
.end method

.method public applyTorque(F)V
    .locals 2
    .parameter "torque"

    .prologue
    .line 257
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    invoke-direct {p0, v0, v1, p1}, Lcom/badlogic/gdx/physics/box2d/Body;->jniApplyTorque(JF)V

    .line 258
    return-void
.end method

.method public createFixture(Lcom/badlogic/gdx/physics/box2d/FixtureDef;)Lcom/badlogic/gdx/physics/box2d/Fixture;
    .locals 14
    .parameter "def"

    .prologue
    .line 70
    new-instance v12, Lcom/badlogic/gdx/physics/box2d/Fixture;

    iget-object v13, p0, Lcom/badlogic/gdx/physics/box2d/Body;->world:Lcom/badlogic/gdx/physics/box2d/World;

    iget-wide v1, p0, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    iget-object v0, p1, Lcom/badlogic/gdx/physics/box2d/FixtureDef;->shape:Lcom/badlogic/gdx/physics/box2d/Shape;

    iget-wide v3, v0, Lcom/badlogic/gdx/physics/box2d/Shape;->addr:J

    iget v5, p1, Lcom/badlogic/gdx/physics/box2d/FixtureDef;->friction:F

    iget v6, p1, Lcom/badlogic/gdx/physics/box2d/FixtureDef;->restitution:F

    iget v7, p1, Lcom/badlogic/gdx/physics/box2d/FixtureDef;->density:F

    iget-boolean v8, p1, Lcom/badlogic/gdx/physics/box2d/FixtureDef;->isSensor:Z

    iget-object v0, p1, Lcom/badlogic/gdx/physics/box2d/FixtureDef;->filter:Lcom/badlogic/gdx/physics/box2d/Filter;

    iget-short v9, v0, Lcom/badlogic/gdx/physics/box2d/Filter;->categoryBits:S

    iget-object v0, p1, Lcom/badlogic/gdx/physics/box2d/FixtureDef;->filter:Lcom/badlogic/gdx/physics/box2d/Filter;

    iget-short v10, v0, Lcom/badlogic/gdx/physics/box2d/Filter;->maskBits:S

    iget-object v0, p1, Lcom/badlogic/gdx/physics/box2d/FixtureDef;->filter:Lcom/badlogic/gdx/physics/box2d/Filter;

    iget-short v11, v0, Lcom/badlogic/gdx/physics/box2d/Filter;->groupIndex:S

    move-object v0, p0

    invoke-direct/range {v0 .. v11}, Lcom/badlogic/gdx/physics/box2d/Body;->jniCreateFixture(JJFFFZSSS)J

    move-result-wide v0

    invoke-direct {v12, v13, p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/Fixture;-><init>(Lcom/badlogic/gdx/physics/box2d/World;Lcom/badlogic/gdx/physics/box2d/Body;J)V

    .line 71
    .local v12, fixture:Lcom/badlogic/gdx/physics/box2d/Fixture;
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->world:Lcom/badlogic/gdx/physics/box2d/World;

    iget-object v0, v0, Lcom/badlogic/gdx/physics/box2d/World;->fixtures:Lcom/badlogic/gdx/utils/LongHashMap;

    iget-wide v1, v12, Lcom/badlogic/gdx/physics/box2d/Fixture;->addr:J

    invoke-virtual {v0, v1, v2, v12}, Lcom/badlogic/gdx/utils/LongHashMap;->put(JLjava/lang/Object;)Ljava/lang/Object;

    .line 72
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->fixtures:Ljava/util/ArrayList;

    invoke-virtual {v0, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 73
    return-object v12
.end method

.method public createFixture(Lcom/badlogic/gdx/physics/box2d/Shape;F)Lcom/badlogic/gdx/physics/box2d/Fixture;
    .locals 8
    .parameter "shape"
    .parameter "density"

    .prologue
    .line 89
    new-instance v6, Lcom/badlogic/gdx/physics/box2d/Fixture;

    iget-object v7, p0, Lcom/badlogic/gdx/physics/box2d/Body;->world:Lcom/badlogic/gdx/physics/box2d/World;

    iget-wide v1, p0, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    iget-wide v3, p1, Lcom/badlogic/gdx/physics/box2d/Shape;->addr:J

    move-object v0, p0

    move v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/badlogic/gdx/physics/box2d/Body;->jniCreateFixture(JJF)J

    move-result-wide v0

    invoke-direct {v6, v7, p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/Fixture;-><init>(Lcom/badlogic/gdx/physics/box2d/World;Lcom/badlogic/gdx/physics/box2d/Body;J)V

    .line 90
    .local v6, fixture:Lcom/badlogic/gdx/physics/box2d/Fixture;
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->world:Lcom/badlogic/gdx/physics/box2d/World;

    iget-object v0, v0, Lcom/badlogic/gdx/physics/box2d/World;->fixtures:Lcom/badlogic/gdx/utils/LongHashMap;

    iget-wide v1, v6, Lcom/badlogic/gdx/physics/box2d/Fixture;->addr:J

    invoke-virtual {v0, v1, v2, v6}, Lcom/badlogic/gdx/utils/LongHashMap;->put(JLjava/lang/Object;)Ljava/lang/Object;

    .line 91
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->fixtures:Ljava/util/ArrayList;

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 92
    return-object v6
.end method

.method public destroyFixture(Lcom/badlogic/gdx/physics/box2d/Fixture;)V
    .locals 4
    .parameter "fixture"

    .prologue
    .line 108
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    iget-wide v2, p1, Lcom/badlogic/gdx/physics/box2d/Fixture;->addr:J

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/badlogic/gdx/physics/box2d/Body;->jniDestroyFixture(JJ)V

    .line 109
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->world:Lcom/badlogic/gdx/physics/box2d/World;

    iget-object v0, v0, Lcom/badlogic/gdx/physics/box2d/World;->fixtures:Lcom/badlogic/gdx/utils/LongHashMap;

    iget-wide v1, p1, Lcom/badlogic/gdx/physics/box2d/Fixture;->addr:J

    invoke-virtual {v0, v1, v2}, Lcom/badlogic/gdx/utils/LongHashMap;->remove(J)Ljava/lang/Object;

    .line 110
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->fixtures:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 111
    return-void
.end method

.method public getAngle()F
    .locals 2

    .prologue
    .line 161
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/Body;->jniGetAngle(J)F

    move-result v0

    return v0
.end method

.method public getAngularDamping()F
    .locals 2

    .prologue
    .line 468
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/Body;->jniGetAngularDamping(J)F

    move-result v0

    return v0
.end method

.method public getAngularVelocity()F
    .locals 2

    .prologue
    .line 230
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/Body;->jniGetAngularVelocity(J)F

    move-result v0

    return v0
.end method

.method public getFixtureList()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/badlogic/gdx/physics/box2d/Fixture;",
            ">;"
        }
    .end annotation

    .prologue
    .line 632
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->fixtures:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getInertia()F
    .locals 2

    .prologue
    .line 304
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/Body;->jniGetInertia(J)F

    move-result v0

    return v0
.end method

.method public getJointList()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/badlogic/gdx/physics/box2d/JointEdge;",
            ">;"
        }
    .end annotation

    .prologue
    .line 641
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->joints:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getLinearDamping()F
    .locals 2

    .prologue
    .line 448
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/Body;->jniGetLinearDamping(J)F

    move-result v0

    return v0
.end method

.method public getLinearVelocity()Lcom/badlogic/gdx/math/Vector2;
    .locals 3

    .prologue
    .line 208
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    iget-object v2, p0, Lcom/badlogic/gdx/physics/box2d/Body;->tmp:[F

    invoke-direct {p0, v0, v1, v2}, Lcom/badlogic/gdx/physics/box2d/Body;->jniGetLinearVelocity(J[F)V

    .line 209
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->linearVelocity:Lcom/badlogic/gdx/math/Vector2;

    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/Body;->tmp:[F

    const/4 v2, 0x0

    aget v1, v1, v2

    iput v1, v0, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->linearVelocity:Lcom/badlogic/gdx/math/Vector2;

    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/Body;->tmp:[F

    const/4 v2, 0x1

    aget v1, v1, v2

    iput v1, v0, Lcom/badlogic/gdx/math/Vector2;->y:F

    .line 210
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->linearVelocity:Lcom/badlogic/gdx/math/Vector2;

    return-object v0
.end method

.method public getLinearVelocityFromLocalPoint(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;
    .locals 6
    .parameter "localPoint"

    .prologue
    .line 436
    iget-wide v1, p0, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    iget v3, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget v4, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    iget-object v5, p0, Lcom/badlogic/gdx/physics/box2d/Body;->tmp:[F

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/badlogic/gdx/physics/box2d/Body;->jniGetLinearVelocityFromLocalPoint(JFF[F)V

    .line 437
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->linVelLoc:Lcom/badlogic/gdx/math/Vector2;

    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/Body;->tmp:[F

    const/4 v2, 0x0

    aget v1, v1, v2

    iput v1, v0, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->linVelLoc:Lcom/badlogic/gdx/math/Vector2;

    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/Body;->tmp:[F

    const/4 v2, 0x1

    aget v1, v1, v2

    iput v1, v0, Lcom/badlogic/gdx/math/Vector2;->y:F

    .line 438
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->linVelLoc:Lcom/badlogic/gdx/math/Vector2;

    return-object v0
.end method

.method public getLinearVelocityFromWorldPoint(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;
    .locals 6
    .parameter "worldPoint"

    .prologue
    .line 420
    iget-wide v1, p0, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    iget v3, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget v4, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    iget-object v5, p0, Lcom/badlogic/gdx/physics/box2d/Body;->tmp:[F

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/badlogic/gdx/physics/box2d/Body;->jniGetLinearVelocityFromWorldPoint(JFF[F)V

    .line 421
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->linVelWorld:Lcom/badlogic/gdx/math/Vector2;

    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/Body;->tmp:[F

    const/4 v2, 0x0

    aget v1, v1, v2

    iput v1, v0, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->linVelWorld:Lcom/badlogic/gdx/math/Vector2;

    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/Body;->tmp:[F

    const/4 v2, 0x1

    aget v1, v1, v2

    iput v1, v0, Lcom/badlogic/gdx/math/Vector2;->y:F

    .line 422
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->linVelWorld:Lcom/badlogic/gdx/math/Vector2;

    return-object v0
.end method

.method public getLocalCenter()Lcom/badlogic/gdx/math/Vector2;
    .locals 3

    .prologue
    .line 185
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    iget-object v2, p0, Lcom/badlogic/gdx/physics/box2d/Body;->tmp:[F

    invoke-direct {p0, v0, v1, v2}, Lcom/badlogic/gdx/physics/box2d/Body;->jniGetLocalCenter(J[F)V

    .line 186
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->localCenter:Lcom/badlogic/gdx/math/Vector2;

    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/Body;->tmp:[F

    const/4 v2, 0x0

    aget v1, v1, v2

    iput v1, v0, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->localCenter:Lcom/badlogic/gdx/math/Vector2;

    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/Body;->tmp:[F

    const/4 v2, 0x1

    aget v1, v1, v2

    iput v1, v0, Lcom/badlogic/gdx/math/Vector2;->y:F

    .line 187
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->localCenter:Lcom/badlogic/gdx/math/Vector2;

    return-object v0
.end method

.method public getLocalPoint(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;
    .locals 6
    .parameter "worldPoint"

    .prologue
    .line 390
    iget-wide v1, p0, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    iget v3, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget v4, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    iget-object v5, p0, Lcom/badlogic/gdx/physics/box2d/Body;->tmp:[F

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/badlogic/gdx/physics/box2d/Body;->jniGetLocalPoint(JFF[F)V

    .line 391
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->localPoint2:Lcom/badlogic/gdx/math/Vector2;

    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/Body;->tmp:[F

    const/4 v2, 0x0

    aget v1, v1, v2

    iput v1, v0, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->localPoint2:Lcom/badlogic/gdx/math/Vector2;

    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/Body;->tmp:[F

    const/4 v2, 0x1

    aget v1, v1, v2

    iput v1, v0, Lcom/badlogic/gdx/math/Vector2;->y:F

    .line 392
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->localPoint2:Lcom/badlogic/gdx/math/Vector2;

    return-object v0
.end method

.method public getLocalVector(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;
    .locals 6
    .parameter "worldVector"

    .prologue
    .line 405
    iget-wide v1, p0, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    iget v3, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget v4, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    iget-object v5, p0, Lcom/badlogic/gdx/physics/box2d/Body;->tmp:[F

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/badlogic/gdx/physics/box2d/Body;->jniGetLocalVector(JFF[F)V

    .line 406
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->localVector:Lcom/badlogic/gdx/math/Vector2;

    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/Body;->tmp:[F

    const/4 v2, 0x0

    aget v1, v1, v2

    iput v1, v0, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->localVector:Lcom/badlogic/gdx/math/Vector2;

    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/Body;->tmp:[F

    const/4 v2, 0x1

    aget v1, v1, v2

    iput v1, v0, Lcom/badlogic/gdx/math/Vector2;->y:F

    .line 407
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->localVector:Lcom/badlogic/gdx/math/Vector2;

    return-object v0
.end method

.method public getMass()F
    .locals 2

    .prologue
    .line 293
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/Body;->jniGetMass(J)F

    move-result v0

    return v0
.end method

.method public getMassData()Lcom/badlogic/gdx/physics/box2d/MassData;
    .locals 3

    .prologue
    .line 316
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    iget-object v2, p0, Lcom/badlogic/gdx/physics/box2d/Body;->tmp:[F

    invoke-direct {p0, v0, v1, v2}, Lcom/badlogic/gdx/physics/box2d/Body;->jniGetMassData(J[F)V

    .line 317
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->massData:Lcom/badlogic/gdx/physics/box2d/MassData;

    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/Body;->tmp:[F

    const/4 v2, 0x0

    aget v1, v1, v2

    iput v1, v0, Lcom/badlogic/gdx/physics/box2d/MassData;->mass:F

    .line 318
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->massData:Lcom/badlogic/gdx/physics/box2d/MassData;

    iget-object v0, v0, Lcom/badlogic/gdx/physics/box2d/MassData;->center:Lcom/badlogic/gdx/math/Vector2;

    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/Body;->tmp:[F

    const/4 v2, 0x1

    aget v1, v1, v2

    iput v1, v0, Lcom/badlogic/gdx/math/Vector2;->x:F

    .line 319
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->massData:Lcom/badlogic/gdx/physics/box2d/MassData;

    iget-object v0, v0, Lcom/badlogic/gdx/physics/box2d/MassData;->center:Lcom/badlogic/gdx/math/Vector2;

    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/Body;->tmp:[F

    const/4 v2, 0x2

    aget v1, v1, v2

    iput v1, v0, Lcom/badlogic/gdx/math/Vector2;->y:F

    .line 320
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->massData:Lcom/badlogic/gdx/physics/box2d/MassData;

    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/Body;->tmp:[F

    const/4 v2, 0x3

    aget v1, v1, v2

    iput v1, v0, Lcom/badlogic/gdx/physics/box2d/MassData;->I:F

    .line 321
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->massData:Lcom/badlogic/gdx/physics/box2d/MassData;

    return-object v0
.end method

.method public getPosition()Lcom/badlogic/gdx/math/Vector2;
    .locals 3

    .prologue
    .line 148
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    iget-object v2, p0, Lcom/badlogic/gdx/physics/box2d/Body;->tmp:[F

    invoke-direct {p0, v0, v1, v2}, Lcom/badlogic/gdx/physics/box2d/Body;->jniGetPosition(J[F)V

    .line 149
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->position:Lcom/badlogic/gdx/math/Vector2;

    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/Body;->tmp:[F

    const/4 v2, 0x0

    aget v1, v1, v2

    iput v1, v0, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->position:Lcom/badlogic/gdx/math/Vector2;

    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/Body;->tmp:[F

    const/4 v2, 0x1

    aget v1, v1, v2

    iput v1, v0, Lcom/badlogic/gdx/math/Vector2;->y:F

    .line 150
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->position:Lcom/badlogic/gdx/math/Vector2;

    return-object v0
.end method

.method public getTransform()Lcom/badlogic/gdx/physics/box2d/Transform;
    .locals 3

    .prologue
    .line 135
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    iget-object v2, p0, Lcom/badlogic/gdx/physics/box2d/Body;->transform:Lcom/badlogic/gdx/physics/box2d/Transform;

    iget-object v2, v2, Lcom/badlogic/gdx/physics/box2d/Transform;->vals:[F

    invoke-direct {p0, v0, v1, v2}, Lcom/badlogic/gdx/physics/box2d/Body;->jniGetTransform(J[F)V

    .line 136
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->transform:Lcom/badlogic/gdx/physics/box2d/Transform;

    return-object v0
.end method

.method public getType()Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;
    .locals 3

    .prologue
    .line 498
    iget-wide v1, p0, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    invoke-direct {p0, v1, v2}, Lcom/badlogic/gdx/physics/box2d/Body;->jniGetType(J)I

    move-result v0

    .line 499
    .local v0, type:I
    if-nez v0, :cond_0

    .line 500
    sget-object v1, Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;->StaticBody:Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;

    .line 505
    :goto_0
    return-object v1

    .line 501
    :cond_0
    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 502
    sget-object v1, Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;->KinematicBody:Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;

    goto :goto_0

    .line 503
    :cond_1
    const/4 v1, 0x2

    if-ne v0, v1, :cond_2

    .line 504
    sget-object v1, Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;->DynamicBody:Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;

    goto :goto_0

    .line 505
    :cond_2
    sget-object v1, Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;->StaticBody:Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;

    goto :goto_0
.end method

.method public getUserData()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 668
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->userData:Ljava/lang/Object;

    return-object v0
.end method

.method public getWorld()Lcom/badlogic/gdx/physics/box2d/World;
    .locals 1

    .prologue
    .line 660
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->world:Lcom/badlogic/gdx/physics/box2d/World;

    return-object v0
.end method

.method public getWorldCenter()Lcom/badlogic/gdx/math/Vector2;
    .locals 3

    .prologue
    .line 172
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    iget-object v2, p0, Lcom/badlogic/gdx/physics/box2d/Body;->tmp:[F

    invoke-direct {p0, v0, v1, v2}, Lcom/badlogic/gdx/physics/box2d/Body;->jniGetWorldCenter(J[F)V

    .line 173
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->worldCenter:Lcom/badlogic/gdx/math/Vector2;

    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/Body;->tmp:[F

    const/4 v2, 0x0

    aget v1, v1, v2

    iput v1, v0, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->worldCenter:Lcom/badlogic/gdx/math/Vector2;

    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/Body;->tmp:[F

    const/4 v2, 0x1

    aget v1, v1, v2

    iput v1, v0, Lcom/badlogic/gdx/math/Vector2;->y:F

    .line 174
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->worldCenter:Lcom/badlogic/gdx/math/Vector2;

    return-object v0
.end method

.method public getWorldPoint(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;
    .locals 6
    .parameter "localPoint"

    .prologue
    .line 360
    iget-wide v1, p0, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    iget v3, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget v4, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    iget-object v5, p0, Lcom/badlogic/gdx/physics/box2d/Body;->tmp:[F

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/badlogic/gdx/physics/box2d/Body;->jniGetWorldPoint(JFF[F)V

    .line 361
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->localPoint:Lcom/badlogic/gdx/math/Vector2;

    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/Body;->tmp:[F

    const/4 v2, 0x0

    aget v1, v1, v2

    iput v1, v0, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->localPoint:Lcom/badlogic/gdx/math/Vector2;

    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/Body;->tmp:[F

    const/4 v2, 0x1

    aget v1, v1, v2

    iput v1, v0, Lcom/badlogic/gdx/math/Vector2;->y:F

    .line 362
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->localPoint:Lcom/badlogic/gdx/math/Vector2;

    return-object v0
.end method

.method public getWorldVector(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;
    .locals 6
    .parameter "localVector"

    .prologue
    .line 375
    iget-wide v1, p0, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    iget v3, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget v4, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    iget-object v5, p0, Lcom/badlogic/gdx/physics/box2d/Body;->tmp:[F

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/badlogic/gdx/physics/box2d/Body;->jniGetWorldVector(JFF[F)V

    .line 376
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->worldVector:Lcom/badlogic/gdx/math/Vector2;

    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/Body;->tmp:[F

    const/4 v2, 0x0

    aget v1, v1, v2

    iput v1, v0, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->worldVector:Lcom/badlogic/gdx/math/Vector2;

    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/Body;->tmp:[F

    const/4 v2, 0x1

    aget v1, v1, v2

    iput v1, v0, Lcom/badlogic/gdx/math/Vector2;->y:F

    .line 377
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->worldVector:Lcom/badlogic/gdx/math/Vector2;

    return-object v0
.end method

.method public isActive()Z
    .locals 2

    .prologue
    .line 600
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/Body;->jniIsActive(J)Z

    move-result v0

    return v0
.end method

.method public isAwake()Z
    .locals 2

    .prologue
    .line 568
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/Body;->jniIsAwake(J)Z

    move-result v0

    return v0
.end method

.method public isBullet()Z
    .locals 2

    .prologue
    .line 525
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/Body;->jniIsBullet(J)Z

    move-result v0

    return v0
.end method

.method public isFixedRotation()Z
    .locals 2

    .prologue
    .line 621
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/Body;->jniIsFixedRotation(J)Z

    move-result v0

    return v0
.end method

.method public isSleepingAllowed()Z
    .locals 2

    .prologue
    .line 545
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/Body;->jniIsSleepingAllowed(J)Z

    move-result v0

    return v0
.end method

.method public resetMassData()V
    .locals 2

    .prologue
    .line 347
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/Body;->jniResetMassData(J)V

    .line 348
    return-void
.end method

.method public setActive(Z)V
    .locals 2
    .parameter "flag"

    .prologue
    .line 590
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    invoke-direct {p0, v0, v1, p1}, Lcom/badlogic/gdx/physics/box2d/Body;->jniSetActive(JZ)V

    .line 591
    return-void
.end method

.method public setAngularDamping(F)V
    .locals 2
    .parameter "angularDamping"

    .prologue
    .line 478
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    invoke-direct {p0, v0, v1, p1}, Lcom/badlogic/gdx/physics/box2d/Body;->jniSetAngularDamping(JF)V

    .line 479
    return-void
.end method

.method public setAngularVelocity(F)V
    .locals 2
    .parameter "omega"

    .prologue
    .line 220
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    invoke-direct {p0, v0, v1, p1}, Lcom/badlogic/gdx/physics/box2d/Body;->jniSetAngularVelocity(JF)V

    .line 221
    return-void
.end method

.method public setAwake(Z)V
    .locals 2
    .parameter "flag"

    .prologue
    .line 557
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    invoke-direct {p0, v0, v1, p1}, Lcom/badlogic/gdx/physics/box2d/Body;->jniSetAwake(JZ)V

    .line 558
    return-void
.end method

.method public setBullet(Z)V
    .locals 2
    .parameter "flag"

    .prologue
    .line 515
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    invoke-direct {p0, v0, v1, p1}, Lcom/badlogic/gdx/physics/box2d/Body;->jniSetBullet(JZ)V

    .line 516
    return-void
.end method

.method public setFixedRotation(Z)V
    .locals 2
    .parameter "flag"

    .prologue
    .line 611
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    invoke-direct {p0, v0, v1, p1}, Lcom/badlogic/gdx/physics/box2d/Body;->jniSetFixedRotation(JZ)V

    .line 612
    return-void
.end method

.method public setLinearDamping(F)V
    .locals 2
    .parameter "linearDamping"

    .prologue
    .line 458
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    invoke-direct {p0, v0, v1, p1}, Lcom/badlogic/gdx/physics/box2d/Body;->jniSetLinearDamping(JF)V

    .line 459
    return-void
.end method

.method public setLinearVelocity(Lcom/badlogic/gdx/math/Vector2;)V
    .locals 4
    .parameter "v"

    .prologue
    .line 197
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    iget v2, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget v3, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/badlogic/gdx/physics/box2d/Body;->jniSetLinearVelocity(JFF)V

    .line 198
    return-void
.end method

.method public setMassData(Lcom/badlogic/gdx/physics/box2d/MassData;)V
    .locals 7
    .parameter "data"

    .prologue
    .line 335
    iget-wide v1, p0, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    iget v3, p1, Lcom/badlogic/gdx/physics/box2d/MassData;->mass:F

    iget-object v0, p1, Lcom/badlogic/gdx/physics/box2d/MassData;->center:Lcom/badlogic/gdx/math/Vector2;

    iget v4, v0, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget-object v0, p1, Lcom/badlogic/gdx/physics/box2d/MassData;->center:Lcom/badlogic/gdx/math/Vector2;

    iget v5, v0, Lcom/badlogic/gdx/math/Vector2;->y:F

    iget v6, p1, Lcom/badlogic/gdx/physics/box2d/MassData;->I:F

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/badlogic/gdx/physics/box2d/Body;->jniSetMassData(JFFFF)V

    .line 336
    return-void
.end method

.method public setSleepingAllowed(Z)V
    .locals 2
    .parameter "flag"

    .prologue
    .line 535
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    invoke-direct {p0, v0, v1, p1}, Lcom/badlogic/gdx/physics/box2d/Body;->jniSetSleepingAllowed(JZ)V

    .line 536
    return-void
.end method

.method public setTransform(Lcom/badlogic/gdx/math/Vector2;F)V
    .locals 6
    .parameter "position"
    .parameter "angle"

    .prologue
    .line 124
    iget-wide v1, p0, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    iget v3, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget v4, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    move-object v0, p0

    move v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/badlogic/gdx/physics/box2d/Body;->jniSetTransform(JFFF)V

    .line 125
    return-void
.end method

.method public setType(Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;)V
    .locals 3
    .parameter "type"

    .prologue
    .line 488
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    invoke-virtual {p1}, Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;->getValue()I

    move-result v2

    invoke-direct {p0, v0, v1, v2}, Lcom/badlogic/gdx/physics/box2d/Body;->jniSetType(JI)V

    .line 489
    return-void
.end method

.method public setUserData(Ljava/lang/Object;)V
    .locals 0
    .parameter "userData"

    .prologue
    .line 676
    iput-object p1, p0, Lcom/badlogic/gdx/physics/box2d/Body;->userData:Ljava/lang/Object;

    .line 677
    return-void
.end method
