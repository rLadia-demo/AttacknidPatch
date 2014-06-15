.class public Lorg/anddev/andengine/extension/physics/box2d/util/Vector2Pool;
.super Ljava/lang/Object;
.source "Vector2Pool.java"


# static fields
.field private static final POOL:Lorg/anddev/andengine/util/pool/GenericPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/anddev/andengine/util/pool/GenericPool",
            "<",
            "Lcom/badlogic/gdx/math/Vector2;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 20
    new-instance v0, Lorg/anddev/andengine/extension/physics/box2d/util/Vector2Pool$1;

    invoke-direct {v0}, Lorg/anddev/andengine/extension/physics/box2d/util/Vector2Pool$1;-><init>()V

    sput-object v0, Lorg/anddev/andengine/extension/physics/box2d/util/Vector2Pool;->POOL:Lorg/anddev/andengine/util/pool/GenericPool;

    .line 11
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static obtain()Lcom/badlogic/gdx/math/Vector2;
    .locals 1

    .prologue
    .line 40
    sget-object v0, Lorg/anddev/andengine/extension/physics/box2d/util/Vector2Pool;->POOL:Lorg/anddev/andengine/util/pool/GenericPool;

    invoke-virtual {v0}, Lorg/anddev/andengine/util/pool/GenericPool;->obtainPoolItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/math/Vector2;

    return-object v0
.end method

.method public static obtain(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;
    .locals 1
    .parameter "pCopyFrom"

    .prologue
    .line 44
    sget-object v0, Lorg/anddev/andengine/extension/physics/box2d/util/Vector2Pool;->POOL:Lorg/anddev/andengine/util/pool/GenericPool;

    invoke-virtual {v0}, Lorg/anddev/andengine/util/pool/GenericPool;->obtainPoolItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {v0, p0}, Lcom/badlogic/gdx/math/Vector2;->set(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    move-result-object v0

    return-object v0
.end method

.method public static recycle(Lcom/badlogic/gdx/math/Vector2;)V
    .locals 1
    .parameter "pVector2"

    .prologue
    .line 48
    sget-object v0, Lorg/anddev/andengine/extension/physics/box2d/util/Vector2Pool;->POOL:Lorg/anddev/andengine/util/pool/GenericPool;

    invoke-virtual {v0, p0}, Lorg/anddev/andengine/util/pool/GenericPool;->recylePoolItem(Ljava/lang/Object;)V

    .line 49
    return-void
.end method
