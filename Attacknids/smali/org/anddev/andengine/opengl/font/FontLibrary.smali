.class public Lorg/anddev/andengine/opengl/font/FontLibrary;
.super Lorg/anddev/andengine/util/Library;
.source "FontLibrary.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/anddev/andengine/util/Library",
        "<",
        "Lorg/anddev/andengine/opengl/font/Font;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Lorg/anddev/andengine/util/Library;-><init>()V

    .line 26
    return-void
.end method

.method public constructor <init>(I)V
    .locals 0
    .parameter "pInitialCapacity"

    .prologue
    .line 29
    invoke-direct {p0, p1}, Lorg/anddev/andengine/util/Library;-><init>(I)V

    .line 30
    return-void
.end method


# virtual methods
.method loadFonts(Lorg/anddev/andengine/opengl/font/FontManager;)V
    .locals 3
    .parameter "pFontManager"

    .prologue
    .line 45
    iget-object v1, p0, Lorg/anddev/andengine/opengl/font/FontLibrary;->mItems:Landroid/util/SparseArray;

    .line 46
    .local v1, items:Landroid/util/SparseArray;,"Landroid/util/SparseArray<Lorg/anddev/andengine/opengl/font/Font;>;"
    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    move-result v2

    add-int/lit8 v0, v2, -0x1

    .local v0, i:I
    :goto_0
    if-gez v0, :cond_0

    .line 49
    return-void

    .line 47
    :cond_0
    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/anddev/andengine/opengl/font/Font;

    invoke-virtual {p1, v2}, Lorg/anddev/andengine/opengl/font/FontManager;->loadFont(Lorg/anddev/andengine/opengl/font/Font;)V

    .line 46
    add-int/lit8 v0, v0, -0x1

    goto :goto_0
.end method
