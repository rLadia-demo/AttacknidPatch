.class public Lorg/anddev/andengine/opengl/texture/region/TextureRegionLibrary;
.super Lorg/anddev/andengine/util/Library;
.source "TextureRegionLibrary.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/anddev/andengine/util/Library",
        "<",
        "Lorg/anddev/andengine/opengl/texture/region/BaseTextureRegion;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Lorg/anddev/andengine/util/Library;-><init>()V

    .line 24
    return-void
.end method

.method public constructor <init>(I)V
    .locals 0
    .parameter "pInitialCapacity"

    .prologue
    .line 27
    invoke-direct {p0, p1}, Lorg/anddev/andengine/util/Library;-><init>(I)V

    .line 28
    return-void
.end method


# virtual methods
.method public bridge synthetic get(I)Ljava/lang/Object;
    .locals 1
    .parameter

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lorg/anddev/andengine/opengl/texture/region/TextureRegionLibrary;->get(I)Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

    move-result-object v0

    return-object v0
.end method

.method public get(I)Lorg/anddev/andengine/opengl/texture/region/TextureRegion;
    .locals 1
    .parameter "pID"

    .prologue
    .line 36
    invoke-super {p0, p1}, Lorg/anddev/andengine/util/Library;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

    return-object v0
.end method

.method public getTiled(I)Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;
    .locals 1
    .parameter "pID"

    .prologue
    .line 40
    iget-object v0, p0, Lorg/anddev/andengine/opengl/texture/region/TextureRegionLibrary;->mItems:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    return-object v0
.end method
