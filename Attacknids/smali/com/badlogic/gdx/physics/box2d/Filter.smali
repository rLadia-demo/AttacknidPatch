.class public Lcom/badlogic/gdx/physics/box2d/Filter;
.super Ljava/lang/Object;
.source "Filter.java"


# instance fields
.field public categoryBits:S

.field public groupIndex:S

.field public maskBits:S


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    const/4 v0, 0x1

    iput-short v0, p0, Lcom/badlogic/gdx/physics/box2d/Filter;->categoryBits:S

    .line 34
    const/4 v0, -0x1

    iput-short v0, p0, Lcom/badlogic/gdx/physics/box2d/Filter;->maskBits:S

    .line 41
    const/4 v0, 0x0

    iput-short v0, p0, Lcom/badlogic/gdx/physics/box2d/Filter;->groupIndex:S

    .line 23
    return-void
.end method
