.class public Lorg/anddev/andengine/opengl/buffer/BufferObjectManager;
.super Ljava/lang/Object;
.source "BufferObjectManager.java"


# static fields
.field private static mActiveInstance:Lorg/anddev/andengine/opengl/buffer/BufferObjectManager;

.field private static final mBufferObjectsLoaded:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lorg/anddev/andengine/opengl/buffer/BufferObject;",
            ">;"
        }
    .end annotation
.end field

.field private static final mBufferObjectsManaged:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Lorg/anddev/andengine/opengl/buffer/BufferObject;",
            ">;"
        }
    .end annotation
.end field

.field private static final mBufferObjectsToBeLoaded:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lorg/anddev/andengine/opengl/buffer/BufferObject;",
            ">;"
        }
    .end annotation
.end field

.field private static final mBufferObjectsToBeUnloaded:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lorg/anddev/andengine/opengl/buffer/BufferObject;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 21
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lorg/anddev/andengine/opengl/buffer/BufferObjectManager;->mBufferObjectsManaged:Ljava/util/HashSet;

    .line 23
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lorg/anddev/andengine/opengl/buffer/BufferObjectManager;->mBufferObjectsLoaded:Ljava/util/ArrayList;

    .line 25
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lorg/anddev/andengine/opengl/buffer/BufferObjectManager;->mBufferObjectsToBeLoaded:Ljava/util/ArrayList;

    .line 26
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lorg/anddev/andengine/opengl/buffer/BufferObjectManager;->mBufferObjectsToBeUnloaded:Ljava/util/ArrayList;

    .line 28
    const/4 v0, 0x0

    sput-object v0, Lorg/anddev/andengine/opengl/buffer/BufferObjectManager;->mActiveInstance:Lorg/anddev/andengine/opengl/buffer/BufferObjectManager;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getActiveInstance()Lorg/anddev/andengine/opengl/buffer/BufferObjectManager;
    .locals 1

    .prologue
    .line 35
    sget-object v0, Lorg/anddev/andengine/opengl/buffer/BufferObjectManager;->mActiveInstance:Lorg/anddev/andengine/opengl/buffer/BufferObjectManager;

    return-object v0
.end method

.method public static setActiveInstance(Lorg/anddev/andengine/opengl/buffer/BufferObjectManager;)V
    .locals 0
    .parameter "pActiveInstance"

    .prologue
    .line 39
    sput-object p0, Lorg/anddev/andengine/opengl/buffer/BufferObjectManager;->mActiveInstance:Lorg/anddev/andengine/opengl/buffer/BufferObjectManager;

    .line 40
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .prologue
    .line 55
    sget-object v0, Lorg/anddev/andengine/opengl/buffer/BufferObjectManager;->mBufferObjectsToBeLoaded:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 56
    sget-object v0, Lorg/anddev/andengine/opengl/buffer/BufferObjectManager;->mBufferObjectsLoaded:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 57
    sget-object v0, Lorg/anddev/andengine/opengl/buffer/BufferObjectManager;->mBufferObjectsManaged:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->clear()V

    .line 58
    return-void
.end method

.method public loadBufferObject(Lorg/anddev/andengine/opengl/buffer/BufferObject;)V
    .locals 1
    .parameter "pBufferObject"

    .prologue
    .line 61
    if-nez p1, :cond_0

    .line 72
    :goto_0
    return-void

    .line 65
    :cond_0
    sget-object v0, Lorg/anddev/andengine/opengl/buffer/BufferObjectManager;->mBufferObjectsManaged:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 67
    sget-object v0, Lorg/anddev/andengine/opengl/buffer/BufferObjectManager;->mBufferObjectsToBeUnloaded:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_0

    .line 69
    :cond_1
    sget-object v0, Lorg/anddev/andengine/opengl/buffer/BufferObjectManager;->mBufferObjectsManaged:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 70
    sget-object v0, Lorg/anddev/andengine/opengl/buffer/BufferObjectManager;->mBufferObjectsToBeLoaded:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public varargs loadBufferObjects([Lorg/anddev/andengine/opengl/buffer/BufferObject;)V
    .locals 2
    .parameter "pBufferObjects"

    .prologue
    .line 88
    array-length v1, p1

    add-int/lit8 v0, v1, -0x1

    .local v0, i:I
    :goto_0
    if-gez v0, :cond_0

    .line 91
    return-void

    .line 89
    :cond_0
    aget-object v1, p1, v0

    invoke-virtual {p0, v1}, Lorg/anddev/andengine/opengl/buffer/BufferObjectManager;->loadBufferObject(Lorg/anddev/andengine/opengl/buffer/BufferObject;)V

    .line 88
    add-int/lit8 v0, v0, -0x1

    goto :goto_0
.end method

.method public reloadBufferObjects()V
    .locals 4

    .prologue
    .line 100
    sget-object v1, Lorg/anddev/andengine/opengl/buffer/BufferObjectManager;->mBufferObjectsLoaded:Ljava/util/ArrayList;

    .line 101
    .local v1, loadedBufferObjects:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/opengl/buffer/BufferObject;>;"
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v0, v2, -0x1

    .local v0, i:I
    :goto_0
    if-gez v0, :cond_0

    .line 105
    sget-object v2, Lorg/anddev/andengine/opengl/buffer/BufferObjectManager;->mBufferObjectsToBeLoaded:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 107
    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 108
    return-void

    .line 102
    :cond_0
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/anddev/andengine/opengl/buffer/BufferObject;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lorg/anddev/andengine/opengl/buffer/BufferObject;->setLoadedToHardware(Z)V

    .line 101
    add-int/lit8 v0, v0, -0x1

    goto :goto_0
.end method

.method public unloadBufferObject(Lorg/anddev/andengine/opengl/buffer/BufferObject;)V
    .locals 1
    .parameter "pBufferObject"

    .prologue
    .line 75
    if-nez p1, :cond_1

    .line 85
    :cond_0
    :goto_0
    return-void

    .line 78
    :cond_1
    sget-object v0, Lorg/anddev/andengine/opengl/buffer/BufferObjectManager;->mBufferObjectsManaged:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 79
    sget-object v0, Lorg/anddev/andengine/opengl/buffer/BufferObjectManager;->mBufferObjectsLoaded:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 80
    sget-object v0, Lorg/anddev/andengine/opengl/buffer/BufferObjectManager;->mBufferObjectsToBeUnloaded:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 81
    :cond_2
    sget-object v0, Lorg/anddev/andengine/opengl/buffer/BufferObjectManager;->mBufferObjectsToBeLoaded:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 82
    sget-object v0, Lorg/anddev/andengine/opengl/buffer/BufferObjectManager;->mBufferObjectsManaged:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public varargs unloadBufferObjects([Lorg/anddev/andengine/opengl/buffer/BufferObject;)V
    .locals 2
    .parameter "pBufferObjects"

    .prologue
    .line 94
    array-length v1, p1

    add-int/lit8 v0, v1, -0x1

    .local v0, i:I
    :goto_0
    if-gez v0, :cond_0

    .line 97
    return-void

    .line 95
    :cond_0
    aget-object v1, p1, v0

    invoke-virtual {p0, v1}, Lorg/anddev/andengine/opengl/buffer/BufferObjectManager;->unloadBufferObject(Lorg/anddev/andengine/opengl/buffer/BufferObject;)V

    .line 94
    add-int/lit8 v0, v0, -0x1

    goto :goto_0
.end method

.method public updateBufferObjects(Ljavax/microedition/khronos/opengles/GL11;)V
    .locals 10
    .parameter "pGL11"

    .prologue
    .line 111
    sget-object v4, Lorg/anddev/andengine/opengl/buffer/BufferObjectManager;->mBufferObjectsManaged:Ljava/util/HashSet;

    .line 112
    .local v4, bufferObjectsManaged:Ljava/util/HashSet;,"Ljava/util/HashSet<Lorg/anddev/andengine/opengl/buffer/BufferObject;>;"
    sget-object v3, Lorg/anddev/andengine/opengl/buffer/BufferObjectManager;->mBufferObjectsLoaded:Ljava/util/ArrayList;

    .line 113
    .local v3, bufferObjectsLoaded:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/opengl/buffer/BufferObject;>;"
    sget-object v5, Lorg/anddev/andengine/opengl/buffer/BufferObjectManager;->mBufferObjectsToBeLoaded:Ljava/util/ArrayList;

    .line 114
    .local v5, bufferObjectsToBeLoaded:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/opengl/buffer/BufferObject;>;"
    sget-object v6, Lorg/anddev/andengine/opengl/buffer/BufferObjectManager;->mBufferObjectsToBeUnloaded:Ljava/util/ArrayList;

    .line 117
    .local v6, bufferObjectsToBeUnloaded:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/opengl/buffer/BufferObject;>;"
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 119
    .local v1, bufferObjectToBeLoadedCount:I
    if-lez v1, :cond_0

    .line 120
    add-int/lit8 v8, v1, -0x1

    .local v8, i:I
    :goto_0
    if-gez v8, :cond_2

    .line 129
    invoke-virtual {v5}, Ljava/util/ArrayList;->clear()V

    .line 133
    .end local v8           #i:I
    :cond_0
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v7

    .line 135
    .local v7, bufferObjectsToBeUnloadedCount:I
    if-lez v7, :cond_1

    .line 136
    add-int/lit8 v8, v7, -0x1

    .restart local v8       #i:I
    :goto_1
    if-gez v8, :cond_4

    .line 146
    .end local v8           #i:I
    :cond_1
    return-void

    .line 121
    .end local v7           #bufferObjectsToBeUnloadedCount:I
    .restart local v8       #i:I
    :cond_2
    invoke-virtual {v5, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/anddev/andengine/opengl/buffer/BufferObject;

    .line 122
    .local v0, bufferObjectToBeLoaded:Lorg/anddev/andengine/opengl/buffer/BufferObject;
    invoke-virtual {v0}, Lorg/anddev/andengine/opengl/buffer/BufferObject;->isLoadedToHardware()Z

    move-result v9

    if-nez v9, :cond_3

    .line 123
    invoke-virtual {v0, p1}, Lorg/anddev/andengine/opengl/buffer/BufferObject;->loadToHardware(Ljavax/microedition/khronos/opengles/GL11;)V

    .line 124
    invoke-virtual {v0}, Lorg/anddev/andengine/opengl/buffer/BufferObject;->setHardwareBufferNeedsUpdate()V

    .line 126
    :cond_3
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 120
    add-int/lit8 v8, v8, -0x1

    goto :goto_0

    .line 137
    .end local v0           #bufferObjectToBeLoaded:Lorg/anddev/andengine/opengl/buffer/BufferObject;
    .restart local v7       #bufferObjectsToBeUnloadedCount:I
    :cond_4
    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/anddev/andengine/opengl/buffer/BufferObject;

    .line 138
    .local v2, bufferObjectToBeUnloaded:Lorg/anddev/andengine/opengl/buffer/BufferObject;
    invoke-virtual {v2}, Lorg/anddev/andengine/opengl/buffer/BufferObject;->isLoadedToHardware()Z

    move-result v9

    if-eqz v9, :cond_5

    .line 139
    invoke-virtual {v2, p1}, Lorg/anddev/andengine/opengl/buffer/BufferObject;->unloadFromHardware(Ljavax/microedition/khronos/opengles/GL11;)V

    .line 141
    :cond_5
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 142
    invoke-virtual {v4, v2}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 136
    add-int/lit8 v8, v8, -0x1

    goto :goto_1
.end method
