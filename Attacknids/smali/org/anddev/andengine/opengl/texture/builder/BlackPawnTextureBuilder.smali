.class public Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder;
.super Ljava/lang/Object;
.source "BlackPawnTextureBuilder.java"

# interfaces
.implements Lorg/anddev/andengine/opengl/texture/builder/ITextureBuilder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;,
        Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;
    }
.end annotation


# static fields
.field private static final TEXTURESOURCE_COMPARATOR:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Lorg/anddev/andengine/opengl/texture/source/ITextureSource;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final mTextureSourceSpacing:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 22
    new-instance v0, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$1;

    invoke-direct {v0}, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$1;-><init>()V

    sput-object v0, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder;->TEXTURESOURCE_COMPARATOR:Ljava/util/Comparator;

    .line 32
    return-void
.end method

.method public constructor <init>(I)V
    .locals 0
    .parameter "pTextureSourceSpacing"

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput p1, p0, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder;->mTextureSourceSpacing:I

    .line 46
    return-void
.end method


# virtual methods
.method public pack(Lorg/anddev/andengine/opengl/texture/BuildableTexture;Ljava/util/ArrayList;)V
    .locals 11
    .parameter "pBuildableTexture"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/anddev/andengine/opengl/texture/BuildableTexture;",
            "Ljava/util/ArrayList",
            "<",
            "Lorg/anddev/andengine/opengl/texture/BuildableTexture$TextureSourceWithWithLocationCallback;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .local p2, pTextureSourcesWithLocationCallback:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/opengl/texture/BuildableTexture$TextureSourceWithWithLocationCallback;>;"
    const/4 v10, 0x0

    .line 59
    sget-object v7, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder;->TEXTURESOURCE_COMPARATOR:Ljava/util/Comparator;

    invoke-static {p2, v7}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 61
    new-instance v2, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;

    new-instance v7, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;

    invoke-virtual {p1}, Lorg/anddev/andengine/opengl/texture/BuildableTexture;->getWidth()I

    move-result v8

    invoke-virtual {p1}, Lorg/anddev/andengine/opengl/texture/BuildableTexture;->getHeight()I

    move-result v9

    invoke-direct {v7, v10, v10, v8, v9}, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;-><init>(IIII)V

    invoke-direct {v2, v7}, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;-><init>(Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;)V

    .line 63
    .local v2, root:Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v4

    .line 65
    .local v4, textureSourceCount:I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    if-lt v0, v4, :cond_0

    .line 77
    return-void

    .line 66
    :cond_0
    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/anddev/andengine/opengl/texture/BuildableTexture$TextureSourceWithWithLocationCallback;

    .line 67
    .local v6, textureSourceWithLocationCallback:Lorg/anddev/andengine/opengl/texture/BuildableTexture$TextureSourceWithWithLocationCallback;
    invoke-virtual {v6}, Lorg/anddev/andengine/opengl/texture/BuildableTexture$TextureSourceWithWithLocationCallback;->getTextureSource()Lorg/anddev/andengine/opengl/texture/source/ITextureSource;

    move-result-object v3

    .line 69
    .local v3, textureSource:Lorg/anddev/andengine/opengl/texture/source/ITextureSource;
    invoke-virtual {p1}, Lorg/anddev/andengine/opengl/texture/BuildableTexture;->getWidth()I

    move-result v7

    invoke-virtual {p1}, Lorg/anddev/andengine/opengl/texture/BuildableTexture;->getHeight()I

    move-result v8

    iget v9, p0, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder;->mTextureSourceSpacing:I

    invoke-virtual {v2, v3, v7, v8, v9}, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;->insert(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;III)Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;

    move-result-object v1

    .line 71
    .local v1, inserted:Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;
    if-nez v1, :cond_1

    .line 72
    new-instance v7, Ljava/lang/IllegalArgumentException;

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "Could not pack: "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 74
    :cond_1
    #getter for: Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;->mRect:Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;
    invoke-static {v1}, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;->access$0(Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;)Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;

    move-result-object v7

    #getter for: Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;->mLeft:I
    invoke-static {v7}, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;->access$0(Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;)I

    move-result v7

    #getter for: Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;->mRect:Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;
    invoke-static {v1}, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;->access$0(Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;)Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;

    move-result-object v8

    #getter for: Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;->mTop:I
    invoke-static {v8}, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;->access$1(Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;)I

    move-result v8

    invoke-virtual {p1, v3, v7, v8}, Lorg/anddev/andengine/opengl/texture/BuildableTexture;->addTextureSource(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;II)Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;

    move-result-object v5

    .line 75
    .local v5, textureSourceWithLocation:Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;
    invoke-virtual {v6}, Lorg/anddev/andengine/opengl/texture/BuildableTexture$TextureSourceWithWithLocationCallback;->getCallback()Lorg/anddev/andengine/util/Callback;

    move-result-object v7

    invoke-interface {v7, v5}, Lorg/anddev/andengine/util/Callback;->onCallback(Ljava/lang/Object;)V

    .line 65
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method
