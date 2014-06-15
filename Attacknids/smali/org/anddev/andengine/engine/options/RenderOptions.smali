.class public Lorg/anddev/andengine/engine/options/RenderOptions;
.super Ljava/lang/Object;
.source "RenderOptions.java"


# instance fields
.field private mDisableExtensionVertexBufferObjects:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/anddev/andengine/engine/options/RenderOptions;->mDisableExtensionVertexBufferObjects:Z

    .line 7
    return-void
.end method


# virtual methods
.method public disableExtensionVertexBufferObjects()Lorg/anddev/andengine/engine/options/RenderOptions;
    .locals 1

    .prologue
    .line 31
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/anddev/andengine/engine/options/RenderOptions;->setDisableExtensionVertexBufferObjects(Z)Lorg/anddev/andengine/engine/options/RenderOptions;

    move-result-object v0

    return-object v0
.end method

.method public enableExtensionVertexBufferObjects()Lorg/anddev/andengine/engine/options/RenderOptions;
    .locals 1

    .prologue
    .line 27
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/anddev/andengine/engine/options/RenderOptions;->setDisableExtensionVertexBufferObjects(Z)Lorg/anddev/andengine/engine/options/RenderOptions;

    move-result-object v0

    return-object v0
.end method

.method public isDisableExtensionVertexBufferObjects()Z
    .locals 1

    .prologue
    .line 43
    iget-boolean v0, p0, Lorg/anddev/andengine/engine/options/RenderOptions;->mDisableExtensionVertexBufferObjects:Z

    return v0
.end method

.method public setDisableExtensionVertexBufferObjects(Z)Lorg/anddev/andengine/engine/options/RenderOptions;
    .locals 0
    .parameter "pDisableExtensionVertexBufferObjects"

    .prologue
    .line 35
    iput-boolean p1, p0, Lorg/anddev/andengine/engine/options/RenderOptions;->mDisableExtensionVertexBufferObjects:Z

    .line 36
    return-object p0
.end method
