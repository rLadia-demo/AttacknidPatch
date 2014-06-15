.class Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$1;
.super Ljava/lang/Object;
.source "BlackPawnTextureBuilder.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lorg/anddev/andengine/opengl/texture/source/ITextureSource;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 1
    check-cast p1, Lorg/anddev/andengine/opengl/texture/source/ITextureSource;

    check-cast p2, Lorg/anddev/andengine/opengl/texture/source/ITextureSource;

    invoke-virtual {p0, p1, p2}, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$1;->compare(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;Lorg/anddev/andengine/opengl/texture/source/ITextureSource;)I

    move-result v0

    return v0
.end method

.method public compare(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;Lorg/anddev/andengine/opengl/texture/source/ITextureSource;)I
    .locals 3
    .parameter "pTextureSourceA"
    .parameter "pTextureSourceB"

    .prologue
    .line 25
    invoke-interface {p2}, Lorg/anddev/andengine/opengl/texture/source/ITextureSource;->getWidth()I

    move-result v1

    invoke-interface {p1}, Lorg/anddev/andengine/opengl/texture/source/ITextureSource;->getWidth()I

    move-result v2

    sub-int v0, v1, v2

    .line 26
    .local v0, deltaWidth:I
    if-eqz v0, :cond_0

    .line 29
    .end local v0           #deltaWidth:I
    :goto_0
    return v0

    .restart local v0       #deltaWidth:I
    :cond_0
    invoke-interface {p2}, Lorg/anddev/andengine/opengl/texture/source/ITextureSource;->getHeight()I

    move-result v1

    invoke-interface {p1}, Lorg/anddev/andengine/opengl/texture/source/ITextureSource;->getHeight()I

    move-result v2

    sub-int v0, v1, v2

    goto :goto_0
.end method
