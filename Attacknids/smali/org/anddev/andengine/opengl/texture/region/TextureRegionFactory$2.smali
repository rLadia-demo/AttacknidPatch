.class Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory$2;
.super Ljava/lang/Object;
.source "TextureRegionFactory.java"

# interfaces
.implements Lorg/anddev/andengine/util/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory;->createTiledFromSource(Lorg/anddev/andengine/opengl/texture/BuildableTexture;Lorg/anddev/andengine/opengl/texture/source/ITextureSource;II)Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lorg/anddev/andengine/util/Callback",
        "<",
        "Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;",
        ">;"
    }
.end annotation


# instance fields
.field private final synthetic val$tiledTextureRegion:Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;


# direct methods
.method constructor <init>(Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory$2;->val$tiledTextureRegion:Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    .line 138
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onCallback(Ljava/lang/Object;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    check-cast p1, Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;

    invoke-virtual {p0, p1}, Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory$2;->onCallback(Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;)V

    return-void
.end method

.method public onCallback(Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;)V
    .locals 3
    .parameter "pCallbackValue"

    .prologue
    .line 141
    iget-object v0, p0, Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory$2;->val$tiledTextureRegion:Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    invoke-virtual {p1}, Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;->getTexturePositionX()I

    move-result v1

    invoke-virtual {p1}, Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;->getTexturePositionY()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;->setTexturePosition(II)V

    .line 142
    return-void
.end method
