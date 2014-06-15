.class Lorg/anddev/andengine/extension/physics/box2d/util/hull/Vector2Line;
.super Ljava/lang/Object;
.source "Vector2Line.java"


# instance fields
.field mVertexA:Lcom/badlogic/gdx/math/Vector2;

.field mVertexB:Lcom/badlogic/gdx/math/Vector2;


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/math/Vector2;)V
    .locals 0
    .parameter "pVertexA"
    .parameter "pVertexB"

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    iput-object p1, p0, Lorg/anddev/andengine/extension/physics/box2d/util/hull/Vector2Line;->mVertexA:Lcom/badlogic/gdx/math/Vector2;

    .line 27
    iput-object p2, p0, Lorg/anddev/andengine/extension/physics/box2d/util/hull/Vector2Line;->mVertexB:Lcom/badlogic/gdx/math/Vector2;

    .line 28
    return-void
.end method
