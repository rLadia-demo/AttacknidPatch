.class public Lcom/badlogic/gdx/physics/box2d/FixtureDef;
.super Ljava/lang/Object;
.source "FixtureDef.java"


# instance fields
.field public density:F

.field public final filter:Lcom/badlogic/gdx/physics/box2d/Filter;

.field public friction:F

.field public isSensor:Z

.field public restitution:F

.field public shape:Lcom/badlogic/gdx/physics/box2d/Shape;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    const v0, 0x3e4ccccd

    iput v0, p0, Lcom/badlogic/gdx/physics/box2d/FixtureDef;->friction:F

    .line 36
    iput v1, p0, Lcom/badlogic/gdx/physics/box2d/FixtureDef;->restitution:F

    .line 39
    iput v1, p0, Lcom/badlogic/gdx/physics/box2d/FixtureDef;->density:F

    .line 45
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/badlogic/gdx/physics/box2d/FixtureDef;->isSensor:Z

    .line 48
    new-instance v0, Lcom/badlogic/gdx/physics/box2d/Filter;

    invoke-direct {v0}, Lcom/badlogic/gdx/physics/box2d/Filter;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/FixtureDef;->filter:Lcom/badlogic/gdx/physics/box2d/Filter;

    .line 24
    return-void
.end method
