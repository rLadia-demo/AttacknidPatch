.class public Lorg/anddev/andengine/extension/physics/box2d/PhysicsFactory;
.super Ljava/lang/Object;
.source "PhysicsFactory.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createBoxBody(Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;Lorg/anddev/andengine/entity/shape/Shape;Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;Lcom/badlogic/gdx/physics/box2d/FixtureDef;)Lcom/badlogic/gdx/physics/box2d/Body;
    .locals 1
    .parameter "pPhysicsWorld"
    .parameter "pShape"
    .parameter "pBodyType"
    .parameter "pFixtureDef"

    .prologue
    .line 77
    const/high16 v0, 0x4200

    invoke-static {p0, p1, p2, p3, v0}, Lorg/anddev/andengine/extension/physics/box2d/PhysicsFactory;->createBoxBody(Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;Lorg/anddev/andengine/entity/shape/Shape;Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;Lcom/badlogic/gdx/physics/box2d/FixtureDef;F)Lcom/badlogic/gdx/physics/box2d/Body;

    move-result-object v0

    return-object v0
.end method

.method public static createBoxBody(Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;Lorg/anddev/andengine/entity/shape/Shape;Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;Lcom/badlogic/gdx/physics/box2d/FixtureDef;F)Lcom/badlogic/gdx/physics/box2d/Body;
    .locals 10
    .parameter "pPhysicsWorld"
    .parameter "pShape"
    .parameter "pBodyType"
    .parameter "pFixtureDef"
    .parameter "pPixelToMeterRatio"

    .prologue
    const/high16 v9, 0x3f00

    .line 81
    new-instance v1, Lcom/badlogic/gdx/physics/box2d/BodyDef;

    invoke-direct {v1}, Lcom/badlogic/gdx/physics/box2d/BodyDef;-><init>()V

    .line 82
    .local v1, boxBodyDef:Lcom/badlogic/gdx/physics/box2d/BodyDef;
    iput-object p2, v1, Lcom/badlogic/gdx/physics/box2d/BodyDef;->type:Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;

    .line 84
    invoke-virtual {p1}, Lorg/anddev/andengine/entity/shape/Shape;->getSceneCenterCoordinates()[F

    move-result-object v5

    .line 85
    .local v5, sceneCenterCoordinates:[F
    iget-object v6, v1, Lcom/badlogic/gdx/physics/box2d/BodyDef;->position:Lcom/badlogic/gdx/math/Vector2;

    const/4 v7, 0x0

    aget v7, v5, v7

    div-float/2addr v7, p4

    iput v7, v6, Lcom/badlogic/gdx/math/Vector2;->x:F

    .line 86
    iget-object v6, v1, Lcom/badlogic/gdx/physics/box2d/BodyDef;->position:Lcom/badlogic/gdx/math/Vector2;

    const/4 v7, 0x1

    aget v7, v5, v7

    div-float/2addr v7, p4

    iput v7, v6, Lcom/badlogic/gdx/math/Vector2;->y:F

    .line 88
    iget-object v6, v1, Lcom/badlogic/gdx/physics/box2d/BodyDef;->linearVelocity:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {p1}, Lorg/anddev/andengine/entity/shape/Shape;->getVelocityX()F

    move-result v7

    invoke-virtual {p1}, Lorg/anddev/andengine/entity/shape/Shape;->getVelocityY()F

    move-result v8

    invoke-virtual {v6, v7, v8}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    .line 89
    invoke-virtual {p1}, Lorg/anddev/andengine/entity/shape/Shape;->getAngularVelocity()F

    move-result v6

    iput v6, v1, Lcom/badlogic/gdx/physics/box2d/BodyDef;->angularVelocity:F

    .line 91
    invoke-virtual {p0, v1}, Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;->createBody(Lcom/badlogic/gdx/physics/box2d/BodyDef;)Lcom/badlogic/gdx/physics/box2d/Body;

    move-result-object v0

    .line 93
    .local v0, boxBody:Lcom/badlogic/gdx/physics/box2d/Body;
    new-instance v2, Lcom/badlogic/gdx/physics/box2d/PolygonShape;

    invoke-direct {v2}, Lcom/badlogic/gdx/physics/box2d/PolygonShape;-><init>()V

    .line 95
    .local v2, boxPoly:Lcom/badlogic/gdx/physics/box2d/PolygonShape;
    invoke-virtual {p1}, Lorg/anddev/andengine/entity/shape/Shape;->getWidthScaled()F

    move-result v6

    mul-float/2addr v6, v9

    div-float v4, v6, p4

    .line 96
    .local v4, halfWidth:F
    invoke-virtual {p1}, Lorg/anddev/andengine/entity/shape/Shape;->getHeightScaled()F

    move-result v6

    mul-float/2addr v6, v9

    div-float v3, v6, p4

    .line 98
    .local v3, halfHeight:F
    invoke-virtual {v2, v4, v3}, Lcom/badlogic/gdx/physics/box2d/PolygonShape;->setAsBox(FF)V

    .line 99
    iput-object v2, p3, Lcom/badlogic/gdx/physics/box2d/FixtureDef;->shape:Lcom/badlogic/gdx/physics/box2d/Shape;

    .line 101
    invoke-virtual {v0, p3}, Lcom/badlogic/gdx/physics/box2d/Body;->createFixture(Lcom/badlogic/gdx/physics/box2d/FixtureDef;)Lcom/badlogic/gdx/physics/box2d/Fixture;

    .line 103
    invoke-virtual {v2}, Lcom/badlogic/gdx/physics/box2d/PolygonShape;->dispose()V

    .line 105
    invoke-virtual {v0}, Lcom/badlogic/gdx/physics/box2d/Body;->getWorldCenter()Lcom/badlogic/gdx/math/Vector2;

    move-result-object v6

    invoke-virtual {p1}, Lorg/anddev/andengine/entity/shape/Shape;->getRotation()F

    move-result v7

    invoke-static {v7}, Lorg/anddev/andengine/util/MathUtils;->degToRad(F)F

    move-result v7

    invoke-virtual {v0, v6, v7}, Lcom/badlogic/gdx/physics/box2d/Body;->setTransform(Lcom/badlogic/gdx/math/Vector2;F)V

    .line 107
    return-object v0
.end method

.method public static createCircleBody(Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;Lorg/anddev/andengine/entity/shape/Shape;Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;Lcom/badlogic/gdx/physics/box2d/FixtureDef;)Lcom/badlogic/gdx/physics/box2d/Body;
    .locals 1
    .parameter "pPhysicsWorld"
    .parameter "pShape"
    .parameter "pBodyType"
    .parameter "pFixtureDef"

    .prologue
    .line 111
    const/high16 v0, 0x4200

    invoke-static {p0, p1, p2, p3, v0}, Lorg/anddev/andengine/extension/physics/box2d/PhysicsFactory;->createCircleBody(Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;Lorg/anddev/andengine/entity/shape/Shape;Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;Lcom/badlogic/gdx/physics/box2d/FixtureDef;F)Lcom/badlogic/gdx/physics/box2d/Body;

    move-result-object v0

    return-object v0
.end method

.method public static createCircleBody(Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;Lorg/anddev/andengine/entity/shape/Shape;Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;Lcom/badlogic/gdx/physics/box2d/FixtureDef;F)Lcom/badlogic/gdx/physics/box2d/Body;
    .locals 8
    .parameter "pPhysicsWorld"
    .parameter "pShape"
    .parameter "pBodyType"
    .parameter "pFixtureDef"
    .parameter "pPixelToMeterRatio"

    .prologue
    .line 116
    new-instance v1, Lcom/badlogic/gdx/physics/box2d/BodyDef;

    invoke-direct {v1}, Lcom/badlogic/gdx/physics/box2d/BodyDef;-><init>()V

    .line 117
    .local v1, circleBodyDef:Lcom/badlogic/gdx/physics/box2d/BodyDef;
    iput-object p2, v1, Lcom/badlogic/gdx/physics/box2d/BodyDef;->type:Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;

    .line 119
    invoke-virtual {p1}, Lorg/anddev/andengine/entity/shape/Shape;->getSceneCenterCoordinates()[F

    move-result-object v4

    .line 120
    .local v4, sceneCenterCoordinates:[F
    iget-object v5, v1, Lcom/badlogic/gdx/physics/box2d/BodyDef;->position:Lcom/badlogic/gdx/math/Vector2;

    const/4 v6, 0x0

    aget v6, v4, v6

    div-float/2addr v6, p4

    iput v6, v5, Lcom/badlogic/gdx/math/Vector2;->x:F

    .line 121
    iget-object v5, v1, Lcom/badlogic/gdx/physics/box2d/BodyDef;->position:Lcom/badlogic/gdx/math/Vector2;

    const/4 v6, 0x1

    aget v6, v4, v6

    div-float/2addr v6, p4

    iput v6, v5, Lcom/badlogic/gdx/math/Vector2;->y:F

    .line 123
    invoke-virtual {p1}, Lorg/anddev/andengine/entity/shape/Shape;->getRotation()F

    move-result v5

    invoke-static {v5}, Lorg/anddev/andengine/util/MathUtils;->degToRad(F)F

    move-result v5

    iput v5, v1, Lcom/badlogic/gdx/physics/box2d/BodyDef;->angle:F

    .line 124
    iget-object v5, v1, Lcom/badlogic/gdx/physics/box2d/BodyDef;->linearVelocity:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {p1}, Lorg/anddev/andengine/entity/shape/Shape;->getVelocityX()F

    move-result v6

    invoke-virtual {p1}, Lorg/anddev/andengine/entity/shape/Shape;->getVelocityY()F

    move-result v7

    invoke-virtual {v5, v6, v7}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    .line 125
    invoke-virtual {p1}, Lorg/anddev/andengine/entity/shape/Shape;->getAngularVelocity()F

    move-result v5

    iput v5, v1, Lcom/badlogic/gdx/physics/box2d/BodyDef;->angularVelocity:F

    .line 127
    invoke-virtual {p0, v1}, Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;->createBody(Lcom/badlogic/gdx/physics/box2d/BodyDef;)Lcom/badlogic/gdx/physics/box2d/Body;

    move-result-object v0

    .line 129
    .local v0, circleBody:Lcom/badlogic/gdx/physics/box2d/Body;
    new-instance v2, Lcom/badlogic/gdx/physics/box2d/CircleShape;

    invoke-direct {v2}, Lcom/badlogic/gdx/physics/box2d/CircleShape;-><init>()V

    .line 130
    .local v2, circlePoly:Lcom/badlogic/gdx/physics/box2d/CircleShape;
    iput-object v2, p3, Lcom/badlogic/gdx/physics/box2d/FixtureDef;->shape:Lcom/badlogic/gdx/physics/box2d/Shape;

    .line 132
    invoke-virtual {p1}, Lorg/anddev/andengine/entity/shape/Shape;->getWidthScaled()F

    move-result v5

    const/high16 v6, 0x3f00

    mul-float/2addr v5, v6

    div-float v3, v5, p4

    .line 133
    .local v3, radius:F
    invoke-virtual {v2, v3}, Lcom/badlogic/gdx/physics/box2d/CircleShape;->setRadius(F)V

    .line 135
    invoke-virtual {v0, p3}, Lcom/badlogic/gdx/physics/box2d/Body;->createFixture(Lcom/badlogic/gdx/physics/box2d/FixtureDef;)Lcom/badlogic/gdx/physics/box2d/Fixture;

    .line 137
    invoke-virtual {v2}, Lcom/badlogic/gdx/physics/box2d/CircleShape;->dispose()V

    .line 139
    return-object v0
.end method

.method public static createFixtureDef(FFF)Lcom/badlogic/gdx/physics/box2d/FixtureDef;
    .locals 1
    .parameter "pDensity"
    .parameter "pElasticity"
    .parameter "pFriction"

    .prologue
    .line 51
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lorg/anddev/andengine/extension/physics/box2d/PhysicsFactory;->createFixtureDef(FFFZ)Lcom/badlogic/gdx/physics/box2d/FixtureDef;

    move-result-object v0

    return-object v0
.end method

.method public static createFixtureDef(FFFZ)Lcom/badlogic/gdx/physics/box2d/FixtureDef;
    .locals 1
    .parameter "pDensity"
    .parameter "pElasticity"
    .parameter "pFriction"
    .parameter "pSensor"

    .prologue
    .line 55
    new-instance v0, Lcom/badlogic/gdx/physics/box2d/FixtureDef;

    invoke-direct {v0}, Lcom/badlogic/gdx/physics/box2d/FixtureDef;-><init>()V

    .line 56
    .local v0, fixtureDef:Lcom/badlogic/gdx/physics/box2d/FixtureDef;
    iput p0, v0, Lcom/badlogic/gdx/physics/box2d/FixtureDef;->density:F

    .line 57
    iput p1, v0, Lcom/badlogic/gdx/physics/box2d/FixtureDef;->restitution:F

    .line 58
    iput p2, v0, Lcom/badlogic/gdx/physics/box2d/FixtureDef;->friction:F

    .line 59
    iput-boolean p3, v0, Lcom/badlogic/gdx/physics/box2d/FixtureDef;->isSensor:Z

    .line 60
    return-object v0
.end method

.method public static createFixtureDef(FFFZSSS)Lcom/badlogic/gdx/physics/box2d/FixtureDef;
    .locals 2
    .parameter "pDensity"
    .parameter "pElasticity"
    .parameter "pFriction"
    .parameter "pSensor"
    .parameter "pCategoryBits"
    .parameter "pMaskBits"
    .parameter "pGroupIndex"

    .prologue
    .line 64
    new-instance v1, Lcom/badlogic/gdx/physics/box2d/FixtureDef;

    invoke-direct {v1}, Lcom/badlogic/gdx/physics/box2d/FixtureDef;-><init>()V

    .line 65
    .local v1, fixtureDef:Lcom/badlogic/gdx/physics/box2d/FixtureDef;
    iput p0, v1, Lcom/badlogic/gdx/physics/box2d/FixtureDef;->density:F

    .line 66
    iput p1, v1, Lcom/badlogic/gdx/physics/box2d/FixtureDef;->restitution:F

    .line 67
    iput p2, v1, Lcom/badlogic/gdx/physics/box2d/FixtureDef;->friction:F

    .line 68
    iput-boolean p3, v1, Lcom/badlogic/gdx/physics/box2d/FixtureDef;->isSensor:Z

    .line 69
    iget-object v0, v1, Lcom/badlogic/gdx/physics/box2d/FixtureDef;->filter:Lcom/badlogic/gdx/physics/box2d/Filter;

    .line 70
    .local v0, filter:Lcom/badlogic/gdx/physics/box2d/Filter;
    iput-short p4, v0, Lcom/badlogic/gdx/physics/box2d/Filter;->categoryBits:S

    .line 71
    iput-short p5, v0, Lcom/badlogic/gdx/physics/box2d/Filter;->maskBits:S

    .line 72
    iput-short p6, v0, Lcom/badlogic/gdx/physics/box2d/Filter;->groupIndex:S

    .line 73
    return-object v1
.end method

.method public static createLineBody(Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;Lorg/anddev/andengine/entity/primitive/Line;Lcom/badlogic/gdx/physics/box2d/FixtureDef;)Lcom/badlogic/gdx/physics/box2d/Body;
    .locals 1
    .parameter "pPhysicsWorld"
    .parameter "pLine"
    .parameter "pFixtureDef"

    .prologue
    .line 143
    const/high16 v0, 0x4200

    invoke-static {p0, p1, p2, v0}, Lorg/anddev/andengine/extension/physics/box2d/PhysicsFactory;->createLineBody(Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;Lorg/anddev/andengine/entity/primitive/Line;Lcom/badlogic/gdx/physics/box2d/FixtureDef;F)Lcom/badlogic/gdx/physics/box2d/Body;

    move-result-object v0

    return-object v0
.end method

.method public static createLineBody(Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;Lorg/anddev/andengine/entity/primitive/Line;Lcom/badlogic/gdx/physics/box2d/FixtureDef;F)Lcom/badlogic/gdx/physics/box2d/Body;
    .locals 7
    .parameter "pPhysicsWorld"
    .parameter "pLine"
    .parameter "pFixtureDef"
    .parameter "pPixelToMeterRatio"

    .prologue
    .line 147
    new-instance v1, Lcom/badlogic/gdx/physics/box2d/BodyDef;

    invoke-direct {v1}, Lcom/badlogic/gdx/physics/box2d/BodyDef;-><init>()V

    .line 148
    .local v1, lineBodyDef:Lcom/badlogic/gdx/physics/box2d/BodyDef;
    sget-object v3, Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;->StaticBody:Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;

    iput-object v3, v1, Lcom/badlogic/gdx/physics/box2d/BodyDef;->type:Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;

    .line 150
    invoke-virtual {p0, v1}, Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;->createBody(Lcom/badlogic/gdx/physics/box2d/BodyDef;)Lcom/badlogic/gdx/physics/box2d/Body;

    move-result-object v0

    .line 152
    .local v0, boxBody:Lcom/badlogic/gdx/physics/box2d/Body;
    new-instance v2, Lcom/badlogic/gdx/physics/box2d/PolygonShape;

    invoke-direct {v2}, Lcom/badlogic/gdx/physics/box2d/PolygonShape;-><init>()V

    .line 154
    .local v2, linePoly:Lcom/badlogic/gdx/physics/box2d/PolygonShape;
    new-instance v3, Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {p1}, Lorg/anddev/andengine/entity/primitive/Line;->getX1()F

    move-result v4

    div-float/2addr v4, p3

    invoke-virtual {p1}, Lorg/anddev/andengine/entity/primitive/Line;->getY1()F

    move-result v5

    div-float/2addr v5, p3

    invoke-direct {v3, v4, v5}, Lcom/badlogic/gdx/math/Vector2;-><init>(FF)V

    new-instance v4, Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {p1}, Lorg/anddev/andengine/entity/primitive/Line;->getX2()F

    move-result v5

    div-float/2addr v5, p3

    invoke-virtual {p1}, Lorg/anddev/andengine/entity/primitive/Line;->getY2()F

    move-result v6

    div-float/2addr v6, p3

    invoke-direct {v4, v5, v6}, Lcom/badlogic/gdx/math/Vector2;-><init>(FF)V

    invoke-virtual {v2, v3, v4}, Lcom/badlogic/gdx/physics/box2d/PolygonShape;->setAsEdge(Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/math/Vector2;)V

    .line 155
    iput-object v2, p2, Lcom/badlogic/gdx/physics/box2d/FixtureDef;->shape:Lcom/badlogic/gdx/physics/box2d/Shape;

    .line 157
    invoke-virtual {v0, p2}, Lcom/badlogic/gdx/physics/box2d/Body;->createFixture(Lcom/badlogic/gdx/physics/box2d/FixtureDef;)Lcom/badlogic/gdx/physics/box2d/Fixture;

    .line 159
    invoke-virtual {v2}, Lcom/badlogic/gdx/physics/box2d/PolygonShape;->dispose()V

    .line 161
    return-object v0
.end method

.method public static createPolygonBody(Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;Lorg/anddev/andengine/entity/shape/Shape;[Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;Lcom/badlogic/gdx/physics/box2d/FixtureDef;)Lcom/badlogic/gdx/physics/box2d/Body;
    .locals 6
    .parameter "pPhysicsWorld"
    .parameter "pShape"
    .parameter "pVertices"
    .parameter "pBodyType"
    .parameter "pFixtureDef"

    .prologue
    .line 173
    const/high16 v5, 0x4200

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-static/range {v0 .. v5}, Lorg/anddev/andengine/extension/physics/box2d/PhysicsFactory;->createPolygonBody(Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;Lorg/anddev/andengine/entity/shape/Shape;[Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;Lcom/badlogic/gdx/physics/box2d/FixtureDef;F)Lcom/badlogic/gdx/physics/box2d/Body;

    move-result-object v0

    return-object v0
.end method

.method public static createPolygonBody(Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;Lorg/anddev/andengine/entity/shape/Shape;[Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;Lcom/badlogic/gdx/physics/box2d/FixtureDef;F)Lcom/badlogic/gdx/physics/box2d/Body;
    .locals 7
    .parameter "pPhysicsWorld"
    .parameter "pShape"
    .parameter "pVertices"
    .parameter "pBodyType"
    .parameter "pFixtureDef"
    .parameter "pPixelToMeterRatio"

    .prologue
    .line 185
    new-instance v1, Lcom/badlogic/gdx/physics/box2d/BodyDef;

    invoke-direct {v1}, Lcom/badlogic/gdx/physics/box2d/BodyDef;-><init>()V

    .line 186
    .local v1, boxBodyDef:Lcom/badlogic/gdx/physics/box2d/BodyDef;
    iput-object p3, v1, Lcom/badlogic/gdx/physics/box2d/BodyDef;->type:Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;

    .line 188
    invoke-virtual {p1}, Lorg/anddev/andengine/entity/shape/Shape;->getSceneCenterCoordinates()[F

    move-result-object v3

    .line 189
    .local v3, sceneCenterCoordinates:[F
    iget-object v4, v1, Lcom/badlogic/gdx/physics/box2d/BodyDef;->position:Lcom/badlogic/gdx/math/Vector2;

    const/4 v5, 0x0

    aget v5, v3, v5

    div-float/2addr v5, p5

    iput v5, v4, Lcom/badlogic/gdx/math/Vector2;->x:F

    .line 190
    iget-object v4, v1, Lcom/badlogic/gdx/physics/box2d/BodyDef;->position:Lcom/badlogic/gdx/math/Vector2;

    const/4 v5, 0x1

    aget v5, v3, v5

    div-float/2addr v5, p5

    iput v5, v4, Lcom/badlogic/gdx/math/Vector2;->y:F

    .line 192
    iget-object v4, v1, Lcom/badlogic/gdx/physics/box2d/BodyDef;->linearVelocity:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {p1}, Lorg/anddev/andengine/entity/shape/Shape;->getVelocityX()F

    move-result v5

    invoke-virtual {p1}, Lorg/anddev/andengine/entity/shape/Shape;->getVelocityY()F

    move-result v6

    invoke-virtual {v4, v5, v6}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    .line 193
    invoke-virtual {p1}, Lorg/anddev/andengine/entity/shape/Shape;->getAngularVelocity()F

    move-result v4

    iput v4, v1, Lcom/badlogic/gdx/physics/box2d/BodyDef;->angularVelocity:F

    .line 195
    invoke-virtual {p0, v1}, Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;->createBody(Lcom/badlogic/gdx/physics/box2d/BodyDef;)Lcom/badlogic/gdx/physics/box2d/Body;

    move-result-object v0

    .line 197
    .local v0, boxBody:Lcom/badlogic/gdx/physics/box2d/Body;
    new-instance v2, Lcom/badlogic/gdx/physics/box2d/PolygonShape;

    invoke-direct {v2}, Lcom/badlogic/gdx/physics/box2d/PolygonShape;-><init>()V

    .line 199
    .local v2, boxPoly:Lcom/badlogic/gdx/physics/box2d/PolygonShape;
    invoke-virtual {v2, p2}, Lcom/badlogic/gdx/physics/box2d/PolygonShape;->set([Lcom/badlogic/gdx/math/Vector2;)V

    .line 200
    iput-object v2, p4, Lcom/badlogic/gdx/physics/box2d/FixtureDef;->shape:Lcom/badlogic/gdx/physics/box2d/Shape;

    .line 202
    invoke-virtual {v0, p4}, Lcom/badlogic/gdx/physics/box2d/Body;->createFixture(Lcom/badlogic/gdx/physics/box2d/FixtureDef;)Lcom/badlogic/gdx/physics/box2d/Fixture;

    .line 204
    invoke-virtual {v2}, Lcom/badlogic/gdx/physics/box2d/PolygonShape;->dispose()V

    .line 206
    return-object v0
.end method

.method public static createTrianglulatedBody(Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;Lorg/anddev/andengine/entity/shape/Shape;Ljava/util/List;Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;Lcom/badlogic/gdx/physics/box2d/FixtureDef;)Lcom/badlogic/gdx/physics/box2d/Body;
    .locals 6
    .parameter "pPhysicsWorld"
    .parameter "pShape"
    .parameter
    .parameter "pBodyType"
    .parameter "pFixtureDef"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;",
            "Lorg/anddev/andengine/entity/shape/Shape;",
            "Ljava/util/List",
            "<",
            "Lcom/badlogic/gdx/math/Vector2;",
            ">;",
            "Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;",
            "Lcom/badlogic/gdx/physics/box2d/FixtureDef;",
            ")",
            "Lcom/badlogic/gdx/physics/box2d/Body;"
        }
    .end annotation

    .prologue
    .line 219
    .local p2, pTriangleVertices:Ljava/util/List;,"Ljava/util/List<Lcom/badlogic/gdx/math/Vector2;>;"
    const/high16 v5, 0x4200

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-static/range {v0 .. v5}, Lorg/anddev/andengine/extension/physics/box2d/PhysicsFactory;->createTrianglulatedBody(Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;Lorg/anddev/andengine/entity/shape/Shape;Ljava/util/List;Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;Lcom/badlogic/gdx/physics/box2d/FixtureDef;F)Lcom/badlogic/gdx/physics/box2d/Body;

    move-result-object v0

    return-object v0
.end method

.method public static createTrianglulatedBody(Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;Lorg/anddev/andengine/entity/shape/Shape;Ljava/util/List;Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;Lcom/badlogic/gdx/physics/box2d/FixtureDef;F)Lcom/badlogic/gdx/physics/box2d/Body;
    .locals 11
    .parameter "pPhysicsWorld"
    .parameter "pShape"
    .parameter
    .parameter "pBodyType"
    .parameter "pFixtureDef"
    .parameter "pPixelToMeterRatio"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;",
            "Lorg/anddev/andengine/entity/shape/Shape;",
            "Ljava/util/List",
            "<",
            "Lcom/badlogic/gdx/math/Vector2;",
            ">;",
            "Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;",
            "Lcom/badlogic/gdx/physics/box2d/FixtureDef;",
            "F)",
            "Lcom/badlogic/gdx/physics/box2d/Body;"
        }
    .end annotation

    .prologue
    .line 232
    .local p2, pTriangleVertices:Ljava/util/List;,"Ljava/util/List<Lcom/badlogic/gdx/math/Vector2;>;"
    const/4 v8, 0x3

    new-array v0, v8, [Lcom/badlogic/gdx/math/Vector2;

    .line 234
    .local v0, TMP_TRIANGLE:[Lcom/badlogic/gdx/math/Vector2;
    new-instance v2, Lcom/badlogic/gdx/physics/box2d/BodyDef;

    invoke-direct {v2}, Lcom/badlogic/gdx/physics/box2d/BodyDef;-><init>()V

    .line 235
    .local v2, boxBodyDef:Lcom/badlogic/gdx/physics/box2d/BodyDef;
    iput-object p3, v2, Lcom/badlogic/gdx/physics/box2d/BodyDef;->type:Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;

    .line 237
    invoke-virtual {p1}, Lorg/anddev/andengine/entity/shape/Shape;->getSceneCenterCoordinates()[F

    move-result-object v6

    .line 238
    .local v6, sceneCenterCoordinates:[F
    iget-object v8, v2, Lcom/badlogic/gdx/physics/box2d/BodyDef;->position:Lcom/badlogic/gdx/math/Vector2;

    const/4 v9, 0x0

    aget v9, v6, v9

    div-float v9, v9, p5

    iput v9, v8, Lcom/badlogic/gdx/math/Vector2;->x:F

    .line 239
    iget-object v8, v2, Lcom/badlogic/gdx/physics/box2d/BodyDef;->position:Lcom/badlogic/gdx/math/Vector2;

    const/4 v9, 0x1

    aget v9, v6, v9

    div-float v9, v9, p5

    iput v9, v8, Lcom/badlogic/gdx/math/Vector2;->y:F

    .line 241
    iget-object v8, v2, Lcom/badlogic/gdx/physics/box2d/BodyDef;->linearVelocity:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {p1}, Lorg/anddev/andengine/entity/shape/Shape;->getVelocityX()F

    move-result v9

    invoke-virtual {p1}, Lorg/anddev/andengine/entity/shape/Shape;->getVelocityY()F

    move-result v10

    invoke-virtual {v8, v9, v10}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    .line 242
    invoke-virtual {p1}, Lorg/anddev/andengine/entity/shape/Shape;->getAngularVelocity()F

    move-result v8

    iput v8, v2, Lcom/badlogic/gdx/physics/box2d/BodyDef;->angularVelocity:F

    .line 244
    invoke-virtual {p0, v2}, Lorg/anddev/andengine/extension/physics/box2d/PhysicsWorld;->createBody(Lcom/badlogic/gdx/physics/box2d/BodyDef;)Lcom/badlogic/gdx/physics/box2d/Body;

    move-result-object v1

    .line 246
    .local v1, boxBody:Lcom/badlogic/gdx/physics/box2d/Body;
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v7

    .line 247
    .local v7, vertexCount:I
    const/4 v4, 0x0

    .local v4, i:I
    move v5, v4

    .end local v4           #i:I
    .local v5, i:I
    :goto_0
    if-lt v5, v7, :cond_0

    .line 262
    return-object v1

    .line 248
    :cond_0
    new-instance v3, Lcom/badlogic/gdx/physics/box2d/PolygonShape;

    invoke-direct {v3}, Lcom/badlogic/gdx/physics/box2d/PolygonShape;-><init>()V

    .line 250
    .local v3, boxPoly:Lcom/badlogic/gdx/physics/box2d/PolygonShape;
    const/4 v9, 0x2

    add-int/lit8 v4, v5, 0x1

    .end local v5           #i:I
    .restart local v4       #i:I
    invoke-interface {p2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/badlogic/gdx/math/Vector2;

    aput-object v8, v0, v9

    .line 251
    const/4 v9, 0x1

    add-int/lit8 v5, v4, 0x1

    .end local v4           #i:I
    .restart local v5       #i:I
    invoke-interface {p2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/badlogic/gdx/math/Vector2;

    aput-object v8, v0, v9

    .line 252
    const/4 v9, 0x0

    add-int/lit8 v4, v5, 0x1

    .end local v5           #i:I
    .restart local v4       #i:I
    invoke-interface {p2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/badlogic/gdx/math/Vector2;

    aput-object v8, v0, v9

    .line 254
    invoke-virtual {v3, v0}, Lcom/badlogic/gdx/physics/box2d/PolygonShape;->set([Lcom/badlogic/gdx/math/Vector2;)V

    .line 255
    iput-object v3, p4, Lcom/badlogic/gdx/physics/box2d/FixtureDef;->shape:Lcom/badlogic/gdx/physics/box2d/Shape;

    .line 257
    invoke-virtual {v1, p4}, Lcom/badlogic/gdx/physics/box2d/Body;->createFixture(Lcom/badlogic/gdx/physics/box2d/FixtureDef;)Lcom/badlogic/gdx/physics/box2d/Fixture;

    .line 259
    invoke-virtual {v3}, Lcom/badlogic/gdx/physics/box2d/PolygonShape;->dispose()V

    move v5, v4

    .end local v4           #i:I
    .restart local v5       #i:I
    goto :goto_0
.end method
