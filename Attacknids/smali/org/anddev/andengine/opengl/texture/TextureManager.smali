.class public Lorg/anddev/andengine/opengl/texture/TextureManager;
.super Ljava/lang/Object;
.source "TextureManager.java"


# instance fields
.field private final mTexturesLoaded:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lorg/anddev/andengine/opengl/texture/Texture;",
            ">;"
        }
    .end annotation
.end field

.field private final mTexturesManaged:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Lorg/anddev/andengine/opengl/texture/Texture;",
            ">;"
        }
    .end annotation
.end field

.field private final mTexturesToBeLoaded:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lorg/anddev/andengine/opengl/texture/Texture;",
            ">;"
        }
    .end annotation
.end field

.field private final mTexturesToBeUnloaded:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lorg/anddev/andengine/opengl/texture/Texture;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/anddev/andengine/opengl/texture/TextureManager;->mTexturesManaged:Ljava/util/HashSet;

    .line 23
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/anddev/andengine/opengl/texture/TextureManager;->mTexturesLoaded:Ljava/util/ArrayList;

    .line 25
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/anddev/andengine/opengl/texture/TextureManager;->mTexturesToBeLoaded:Ljava/util/ArrayList;

    .line 26
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/anddev/andengine/opengl/texture/TextureManager;->mTexturesToBeUnloaded:Ljava/util/ArrayList;

    .line 12
    return-void
.end method


# virtual methods
.method protected clear()V
    .locals 1

    .prologue
    .line 45
    iget-object v0, p0, Lorg/anddev/andengine/opengl/texture/TextureManager;->mTexturesToBeLoaded:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 46
    iget-object v0, p0, Lorg/anddev/andengine/opengl/texture/TextureManager;->mTexturesLoaded:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 47
    iget-object v0, p0, Lorg/anddev/andengine/opengl/texture/TextureManager;->mTexturesManaged:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->clear()V

    .line 48
    return-void
.end method

.method public loadTexture(Lorg/anddev/andengine/opengl/texture/Texture;)Z
    .locals 1
    .parameter "pTexture"

    .prologue
    .line 55
    iget-object v0, p0, Lorg/anddev/andengine/opengl/texture/TextureManager;->mTexturesManaged:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 57
    iget-object v0, p0, Lorg/anddev/andengine/opengl/texture/TextureManager;->mTexturesToBeUnloaded:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 58
    const/4 v0, 0x0

    .line 62
    :goto_0
    return v0

    .line 60
    :cond_0
    iget-object v0, p0, Lorg/anddev/andengine/opengl/texture/TextureManager;->mTexturesManaged:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 61
    iget-object v0, p0, Lorg/anddev/andengine/opengl/texture/TextureManager;->mTexturesToBeLoaded:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 62
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public varargs loadTextures([Lorg/anddev/andengine/opengl/texture/Texture;)V
    .locals 2
    .parameter "pTextures"

    .prologue
    .line 86
    array-length v1, p1

    add-int/lit8 v0, v1, -0x1

    .local v0, i:I
    :goto_0
    if-gez v0, :cond_0

    .line 89
    return-void

    .line 87
    :cond_0
    aget-object v1, p1, v0

    invoke-virtual {p0, v1}, Lorg/anddev/andengine/opengl/texture/TextureManager;->loadTexture(Lorg/anddev/andengine/opengl/texture/Texture;)Z

    .line 86
    add-int/lit8 v0, v0, -0x1

    goto :goto_0
.end method

.method public reloadTextures()V
    .locals 4

    .prologue
    .line 98
    iget-object v0, p0, Lorg/anddev/andengine/opengl/texture/TextureManager;->mTexturesManaged:Ljava/util/HashSet;

    .line 99
    .local v0, managedTextures:Ljava/util/HashSet;,"Ljava/util/HashSet<Lorg/anddev/andengine/opengl/texture/Texture;>;"
    invoke-virtual {v0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_0

    .line 103
    iget-object v2, p0, Lorg/anddev/andengine/opengl/texture/TextureManager;->mTexturesToBeLoaded:Ljava/util/ArrayList;

    iget-object v3, p0, Lorg/anddev/andengine/opengl/texture/TextureManager;->mTexturesLoaded:Ljava/util/ArrayList;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 104
    iget-object v2, p0, Lorg/anddev/andengine/opengl/texture/TextureManager;->mTexturesLoaded:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 106
    iget-object v2, p0, Lorg/anddev/andengine/opengl/texture/TextureManager;->mTexturesManaged:Ljava/util/HashSet;

    iget-object v3, p0, Lorg/anddev/andengine/opengl/texture/TextureManager;->mTexturesToBeUnloaded:Ljava/util/ArrayList;

    invoke-virtual {v2, v3}, Ljava/util/HashSet;->removeAll(Ljava/util/Collection;)Z

    .line 107
    iget-object v2, p0, Lorg/anddev/andengine/opengl/texture/TextureManager;->mTexturesToBeUnloaded:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 108
    return-void

    .line 99
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/anddev/andengine/opengl/texture/Texture;

    .line 100
    .local v1, texture:Lorg/anddev/andengine/opengl/texture/Texture;
    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Lorg/anddev/andengine/opengl/texture/Texture;->setLoadedToHardware(Z)V

    goto :goto_0
.end method

.method public unloadTexture(Lorg/anddev/andengine/opengl/texture/Texture;)Z
    .locals 1
    .parameter "pTexture"

    .prologue
    .line 71
    iget-object v0, p0, Lorg/anddev/andengine/opengl/texture/TextureManager;->mTexturesManaged:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 74
    iget-object v0, p0, Lorg/anddev/andengine/opengl/texture/TextureManager;->mTexturesLoaded:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 75
    iget-object v0, p0, Lorg/anddev/andengine/opengl/texture/TextureManager;->mTexturesToBeUnloaded:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 79
    :cond_0
    :goto_0
    const/4 v0, 0x1

    .line 81
    :goto_1
    return v0

    .line 76
    :cond_1
    iget-object v0, p0, Lorg/anddev/andengine/opengl/texture/TextureManager;->mTexturesToBeLoaded:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 77
    iget-object v0, p0, Lorg/anddev/andengine/opengl/texture/TextureManager;->mTexturesManaged:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    goto :goto_0

    .line 81
    :cond_2
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public varargs unloadTextures([Lorg/anddev/andengine/opengl/texture/Texture;)V
    .locals 2
    .parameter "pTextures"

    .prologue
    .line 92
    array-length v1, p1

    add-int/lit8 v0, v1, -0x1

    .local v0, i:I
    :goto_0
    if-gez v0, :cond_0

    .line 95
    return-void

    .line 93
    :cond_0
    aget-object v1, p1, v0

    invoke-virtual {p0, v1}, Lorg/anddev/andengine/opengl/texture/TextureManager;->unloadTexture(Lorg/anddev/andengine/opengl/texture/Texture;)Z

    .line 92
    add-int/lit8 v0, v0, -0x1

    goto :goto_0
.end method

.method public updateTextures(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 12
    .parameter "pGL"

    .prologue
    .line 111
    iget-object v5, p0, Lorg/anddev/andengine/opengl/texture/TextureManager;->mTexturesManaged:Ljava/util/HashSet;

    .line 112
    .local v5, texturesManaged:Ljava/util/HashSet;,"Ljava/util/HashSet<Lorg/anddev/andengine/opengl/texture/Texture;>;"
    iget-object v4, p0, Lorg/anddev/andengine/opengl/texture/TextureManager;->mTexturesLoaded:Ljava/util/ArrayList;

    .line 113
    .local v4, texturesLoaded:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/opengl/texture/Texture;>;"
    iget-object v6, p0, Lorg/anddev/andengine/opengl/texture/TextureManager;->mTexturesToBeLoaded:Ljava/util/ArrayList;

    .line 114
    .local v6, texturesToBeLoaded:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/opengl/texture/Texture;>;"
    iget-object v8, p0, Lorg/anddev/andengine/opengl/texture/TextureManager;->mTexturesToBeUnloaded:Ljava/util/ArrayList;

    .line 117
    .local v8, texturesToBeUnloaded:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/opengl/texture/Texture;>;"
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v10

    .line 119
    .local v10, textursLoadedCount:I
    if-lez v10, :cond_0

    .line 120
    add-int/lit8 v0, v10, -0x1

    .local v0, i:I
    :goto_0
    if-gez v0, :cond_5

    .line 130
    .end local v0           #i:I
    :cond_0
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v7

    .line 132
    .local v7, texturesToBeLoadedCount:I
    if-lez v7, :cond_1

    .line 133
    add-int/lit8 v0, v7, -0x1

    .restart local v0       #i:I
    :goto_1
    if-gez v0, :cond_7

    .line 143
    .end local v0           #i:I
    :cond_1
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v9

    .line 145
    .local v9, texturesToBeUnloadedCount:I
    if-lez v9, :cond_2

    .line 146
    add-int/lit8 v0, v9, -0x1

    .restart local v0       #i:I
    :goto_2
    if-gez v0, :cond_9

    .line 157
    .end local v0           #i:I
    :cond_2
    if-gtz v7, :cond_3

    if-lez v9, :cond_4

    .line 158
    :cond_3
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 160
    :cond_4
    return-void

    .line 121
    .end local v7           #texturesToBeLoadedCount:I
    .end local v9           #texturesToBeUnloadedCount:I
    .restart local v0       #i:I
    :cond_5
    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/anddev/andengine/opengl/texture/Texture;

    .line 122
    .local v3, textureToBeUpdated:Lorg/anddev/andengine/opengl/texture/Texture;
    invoke-virtual {v3}, Lorg/anddev/andengine/opengl/texture/Texture;->isUpdateOnHardwareNeeded()Z

    move-result v11

    if-eqz v11, :cond_6

    .line 123
    invoke-virtual {v3, p1}, Lorg/anddev/andengine/opengl/texture/Texture;->unloadFromHardware(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 124
    invoke-virtual {v3, p1}, Lorg/anddev/andengine/opengl/texture/Texture;->loadToHardware(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 120
    :cond_6
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 134
    .end local v3           #textureToBeUpdated:Lorg/anddev/andengine/opengl/texture/Texture;
    .restart local v7       #texturesToBeLoadedCount:I
    :cond_7
    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/anddev/andengine/opengl/texture/Texture;

    .line 135
    .local v1, textureToBeLoaded:Lorg/anddev/andengine/opengl/texture/Texture;
    invoke-virtual {v1}, Lorg/anddev/andengine/opengl/texture/Texture;->isLoadedToHardware()Z

    move-result v11

    if-nez v11, :cond_8

    .line 136
    invoke-virtual {v1, p1}, Lorg/anddev/andengine/opengl/texture/Texture;->loadToHardware(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 138
    :cond_8
    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 133
    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    .line 147
    .end local v1           #textureToBeLoaded:Lorg/anddev/andengine/opengl/texture/Texture;
    .restart local v9       #texturesToBeUnloadedCount:I
    :cond_9
    invoke-virtual {v8, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/anddev/andengine/opengl/texture/Texture;

    .line 148
    .local v2, textureToBeUnloaded:Lorg/anddev/andengine/opengl/texture/Texture;
    invoke-virtual {v2}, Lorg/anddev/andengine/opengl/texture/Texture;->isLoadedToHardware()Z

    move-result v11

    if-eqz v11, :cond_a

    .line 149
    invoke-virtual {v2, p1}, Lorg/anddev/andengine/opengl/texture/Texture;->unloadFromHardware(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 151
    :cond_a
    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 152
    invoke-virtual {v5, v2}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 146
    add-int/lit8 v0, v0, -0x1

    goto :goto_2
.end method
