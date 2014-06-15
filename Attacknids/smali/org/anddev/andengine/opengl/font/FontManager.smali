.class public Lorg/anddev/andengine/opengl/font/FontManager;
.super Ljava/lang/Object;
.source "FontManager.java"


# instance fields
.field private final mFontsManaged:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lorg/anddev/andengine/opengl/font/Font;",
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
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/anddev/andengine/opengl/font/FontManager;->mFontsManaged:Ljava/util/ArrayList;

    .line 12
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .prologue
    .line 40
    iget-object v0, p0, Lorg/anddev/andengine/opengl/font/FontManager;->mFontsManaged:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 41
    return-void
.end method

.method public loadFont(Lorg/anddev/andengine/opengl/font/Font;)V
    .locals 1
    .parameter "pFont"

    .prologue
    .line 44
    iget-object v0, p0, Lorg/anddev/andengine/opengl/font/FontManager;->mFontsManaged:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 45
    return-void
.end method

.method public loadFonts(Lorg/anddev/andengine/opengl/font/FontLibrary;)V
    .locals 0
    .parameter "pFontLibrary"

    .prologue
    .line 48
    invoke-virtual {p1, p0}, Lorg/anddev/andengine/opengl/font/FontLibrary;->loadFonts(Lorg/anddev/andengine/opengl/font/FontManager;)V

    .line 49
    return-void
.end method

.method public varargs loadFonts([Lorg/anddev/andengine/opengl/font/Font;)V
    .locals 2
    .parameter "pFonts"

    .prologue
    .line 52
    array-length v1, p1

    add-int/lit8 v0, v1, -0x1

    .local v0, i:I
    :goto_0
    if-gez v0, :cond_0

    .line 55
    return-void

    .line 53
    :cond_0
    aget-object v1, p1, v0

    invoke-virtual {p0, v1}, Lorg/anddev/andengine/opengl/font/FontManager;->loadFont(Lorg/anddev/andengine/opengl/font/Font;)V

    .line 52
    add-int/lit8 v0, v0, -0x1

    goto :goto_0
.end method

.method public reloadFonts()V
    .locals 3

    .prologue
    .line 68
    iget-object v1, p0, Lorg/anddev/andengine/opengl/font/FontManager;->mFontsManaged:Ljava/util/ArrayList;

    .line 69
    .local v1, managedFonts:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/opengl/font/Font;>;"
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v0, v2, -0x1

    .local v0, i:I
    :goto_0
    if-gez v0, :cond_0

    .line 72
    return-void

    .line 70
    :cond_0
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/anddev/andengine/opengl/font/Font;

    invoke-virtual {v2}, Lorg/anddev/andengine/opengl/font/Font;->reload()V

    .line 69
    add-int/lit8 v0, v0, -0x1

    goto :goto_0
.end method

.method public updateFonts(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 4
    .parameter "pGL"

    .prologue
    .line 58
    iget-object v1, p0, Lorg/anddev/andengine/opengl/font/FontManager;->mFontsManaged:Ljava/util/ArrayList;

    .line 59
    .local v1, fonts:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/opengl/font/Font;>;"
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 60
    .local v0, fontCount:I
    if-lez v0, :cond_0

    .line 61
    add-int/lit8 v2, v0, -0x1

    .local v2, i:I
    :goto_0
    if-gez v2, :cond_1

    .line 65
    .end local v2           #i:I
    :cond_0
    return-void

    .line 62
    .restart local v2       #i:I
    :cond_1
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/anddev/andengine/opengl/font/Font;

    invoke-virtual {v3, p1}, Lorg/anddev/andengine/opengl/font/Font;->update(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 61
    add-int/lit8 v2, v2, -0x1

    goto :goto_0
.end method
