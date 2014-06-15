.class public Lorg/anddev/andengine/opengl/texture/Texture;
.super Ljava/lang/Object;
.source "Texture.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/anddev/andengine/opengl/texture/Texture$ITextureStateListener;,
        Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;
    }
.end annotation


# static fields
.field private static final HARDWARETEXTUREID_FETCHER:[I


# instance fields
.field private mHardwareTextureID:I

.field private final mHeight:I

.field private mLoadedToHardware:Z

.field private final mTextureOptions:Lorg/anddev/andengine/opengl/texture/TextureOptions;

.field private final mTextureSources:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;",
            ">;"
        }
    .end annotation
.end field

.field private final mTextureStateListener:Lorg/anddev/andengine/opengl/texture/Texture$ITextureStateListener;

.field protected mUpdateOnHardwareNeeded:Z

.field private final mWidth:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 24
    const/4 v0, 0x1

    new-array v0, v0, [I

    sput-object v0, Lorg/anddev/andengine/opengl/texture/Texture;->HARDWARETEXTUREID_FETCHER:[I

    return-void
.end method

.method public constructor <init>(II)V
    .locals 2
    .parameter "pWidth"
    .parameter "pHeight"

    .prologue
    .line 52
    sget-object v0, Lorg/anddev/andengine/opengl/texture/TextureOptions;->DEFAULT:Lorg/anddev/andengine/opengl/texture/TextureOptions;

    const/4 v1, 0x0

    invoke-direct {p0, p1, p2, v0, v1}, Lorg/anddev/andengine/opengl/texture/Texture;-><init>(IILorg/anddev/andengine/opengl/texture/TextureOptions;Lorg/anddev/andengine/opengl/texture/Texture$ITextureStateListener;)V

    .line 53
    return-void
.end method

.method public constructor <init>(IILorg/anddev/andengine/opengl/texture/Texture$ITextureStateListener;)V
    .locals 1
    .parameter "pWidth"
    .parameter "pHeight"
    .parameter "pTextureStateListener"

    .prologue
    .line 61
    sget-object v0, Lorg/anddev/andengine/opengl/texture/TextureOptions;->DEFAULT:Lorg/anddev/andengine/opengl/texture/TextureOptions;

    invoke-direct {p0, p1, p2, v0, p3}, Lorg/anddev/andengine/opengl/texture/Texture;-><init>(IILorg/anddev/andengine/opengl/texture/TextureOptions;Lorg/anddev/andengine/opengl/texture/Texture$ITextureStateListener;)V

    .line 62
    return-void
.end method

.method public constructor <init>(IILorg/anddev/andengine/opengl/texture/TextureOptions;)V
    .locals 1
    .parameter "pWidth"
    .parameter "pHeight"
    .parameter "pTextureOptions"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 70
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lorg/anddev/andengine/opengl/texture/Texture;-><init>(IILorg/anddev/andengine/opengl/texture/TextureOptions;Lorg/anddev/andengine/opengl/texture/Texture$ITextureStateListener;)V

    .line 71
    return-void
.end method

.method public constructor <init>(IILorg/anddev/andengine/opengl/texture/TextureOptions;Lorg/anddev/andengine/opengl/texture/Texture$ITextureStateListener;)V
    .locals 2
    .parameter "pWidth"
    .parameter "pHeight"
    .parameter "pTextureOptions"
    .parameter "pTextureStateListener"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    const/4 v0, -0x1

    iput v0, p0, Lorg/anddev/andengine/opengl/texture/Texture;->mHardwareTextureID:I

    .line 37
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/anddev/andengine/opengl/texture/Texture;->mTextureSources:Ljava/util/ArrayList;

    .line 41
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/anddev/andengine/opengl/texture/Texture;->mUpdateOnHardwareNeeded:Z

    .line 80
    invoke-static {p1}, Lorg/anddev/andengine/util/MathUtils;->isPowerOfTwo(I)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p2}, Lorg/anddev/andengine/util/MathUtils;->isPowerOfTwo(I)Z

    move-result v0

    if-nez v0, :cond_1

    .line 81
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Width and Height of a Texture must be a power of 2!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 84
    :cond_1
    iput p1, p0, Lorg/anddev/andengine/opengl/texture/Texture;->mWidth:I

    .line 85
    iput p2, p0, Lorg/anddev/andengine/opengl/texture/Texture;->mHeight:I

    .line 86
    iput-object p3, p0, Lorg/anddev/andengine/opengl/texture/Texture;->mTextureOptions:Lorg/anddev/andengine/opengl/texture/TextureOptions;

    .line 87
    iput-object p4, p0, Lorg/anddev/andengine/opengl/texture/Texture;->mTextureStateListener:Lorg/anddev/andengine/opengl/texture/Texture$ITextureStateListener;

    .line 88
    return-void
.end method

.method private allocateAndBindTextureOnHardware(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 2
    .parameter "pGL"

    .prologue
    .line 243
    iget v0, p0, Lorg/anddev/andengine/opengl/texture/Texture;->mHardwareTextureID:I

    invoke-static {p1, v0}, Lorg/anddev/andengine/opengl/util/GLHelper;->bindTexture(Ljavax/microedition/khronos/opengles/GL10;I)V

    .line 245
    iget v0, p0, Lorg/anddev/andengine/opengl/texture/Texture;->mWidth:I

    iget v1, p0, Lorg/anddev/andengine/opengl/texture/Texture;->mHeight:I

    invoke-static {v0, v1}, Lorg/anddev/andengine/opengl/texture/Texture;->sendPlaceholderBitmapToHardware(II)V

    .line 246
    return-void
.end method

.method private applyTextureOptions(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 4
    .parameter "pGL"

    .prologue
    const/16 v3, 0xde1

    .line 234
    iget-object v0, p0, Lorg/anddev/andengine/opengl/texture/Texture;->mTextureOptions:Lorg/anddev/andengine/opengl/texture/TextureOptions;

    .line 235
    .local v0, textureOptions:Lorg/anddev/andengine/opengl/texture/TextureOptions;
    const/16 v1, 0x2801

    iget v2, v0, Lorg/anddev/andengine/opengl/texture/TextureOptions;->mMinFilter:I

    int-to-float v2, v2

    invoke-interface {p1, v3, v1, v2}, Ljavax/microedition/khronos/opengles/GL10;->glTexParameterf(IIF)V

    .line 236
    const/16 v1, 0x2800

    iget v2, v0, Lorg/anddev/andengine/opengl/texture/TextureOptions;->mMagFilter:I

    int-to-float v2, v2

    invoke-interface {p1, v3, v1, v2}, Ljavax/microedition/khronos/opengles/GL10;->glTexParameterf(IIF)V

    .line 237
    const/16 v1, 0x2802

    iget v2, v0, Lorg/anddev/andengine/opengl/texture/TextureOptions;->mWrapS:F

    invoke-interface {p1, v3, v1, v2}, Ljavax/microedition/khronos/opengles/GL10;->glTexParameterf(IIF)V

    .line 238
    const/16 v1, 0x2803

    iget v2, v0, Lorg/anddev/andengine/opengl/texture/TextureOptions;->mWrapT:F

    invoke-interface {p1, v3, v1, v2}, Ljavax/microedition/khronos/opengles/GL10;->glTexParameterf(IIF)V

    .line 239
    const/16 v1, 0x2300

    const/16 v2, 0x2200

    iget v3, v0, Lorg/anddev/andengine/opengl/texture/TextureOptions;->mTextureEnvironment:I

    int-to-float v3, v3

    invoke-interface {p1, v1, v2, v3}, Ljavax/microedition/khronos/opengles/GL10;->glTexEnvf(IIF)V

    .line 240
    return-void
.end method

.method private checkTextureSourcePosition(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;II)V
    .locals 3
    .parameter "pTextureSource"
    .parameter "pTexturePositionX"
    .parameter "pTexturePositionY"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 140
    if-gez p2, :cond_0

    .line 141
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Illegal negative pTexturePositionX supplied: \'"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 142
    :cond_0
    if-gez p3, :cond_1

    .line 143
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Illegal negative pTexturePositionY supplied: \'"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 144
    :cond_1
    invoke-interface {p1}, Lorg/anddev/andengine/opengl/texture/source/ITextureSource;->getWidth()I

    move-result v0

    add-int/2addr v0, p2

    iget v1, p0, Lorg/anddev/andengine/opengl/texture/Texture;->mWidth:I

    if-gt v0, v1, :cond_2

    invoke-interface {p1}, Lorg/anddev/andengine/opengl/texture/source/ITextureSource;->getHeight()I

    move-result v0

    add-int/2addr v0, p3

    iget v1, p0, Lorg/anddev/andengine/opengl/texture/Texture;->mHeight:I

    if-le v0, v1, :cond_3

    .line 145
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Supplied TextureSource must not exceed bounds of Texture."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 147
    :cond_3
    return-void
.end method

.method private deleteTextureOnHardware(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 1
    .parameter "pGL"

    .prologue
    .line 249
    iget v0, p0, Lorg/anddev/andengine/opengl/texture/Texture;->mHardwareTextureID:I

    invoke-static {p1, v0}, Lorg/anddev/andengine/opengl/util/GLHelper;->deleteTexture(Ljavax/microedition/khronos/opengles/GL10;I)V

    .line 250
    return-void
.end method

.method private static generateHardwareTextureID(Ljavax/microedition/khronos/opengles/GL10;)I
    .locals 3
    .parameter "pGL"

    .prologue
    const/4 v2, 0x0

    .line 253
    const/4 v0, 0x1

    sget-object v1, Lorg/anddev/andengine/opengl/texture/Texture;->HARDWARETEXTUREID_FETCHER:[I

    invoke-interface {p0, v0, v1, v2}, Ljavax/microedition/khronos/opengles/GL10;->glGenTextures(I[II)V

    .line 255
    sget-object v0, Lorg/anddev/andengine/opengl/texture/Texture;->HARDWARETEXTUREID_FETCHER:[I

    aget v0, v0, v2

    return v0
.end method

.method private static sendPlaceholderBitmapToHardware(II)V
    .locals 3
    .parameter "pWidth"
    .parameter "pHeight"

    .prologue
    const/4 v2, 0x0

    .line 259
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p0, p1, v1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 261
    .local v0, textureBitmap:Landroid/graphics/Bitmap;
    const/16 v1, 0xde1

    invoke-static {v1, v2, v0, v2}, Landroid/opengl/GLUtils;->texImage2D(IILandroid/graphics/Bitmap;I)V

    .line 263
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 264
    return-void
.end method

.method private writeTextureToHardware(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 20
    .parameter "pGL"

    .prologue
    .line 200
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/anddev/andengine/opengl/texture/Texture;->mTextureOptions:Lorg/anddev/andengine/opengl/texture/TextureOptions;

    iget-boolean v0, v1, Lorg/anddev/andengine/opengl/texture/TextureOptions;->mPreMultipyAlpha:Z

    move/from16 v16, v0

    .line 202
    .local v16, preMultipyAlpha:Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/anddev/andengine/opengl/texture/Texture;->mTextureSources:Ljava/util/ArrayList;

    move-object/from16 v19, v0

    .line 203
    .local v19, textureSources:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;>;"
    invoke-virtual/range {v19 .. v19}, Ljava/util/ArrayList;->size()I

    move-result v17

    .line 205
    .local v17, textureSourceCount:I
    const/4 v15, 0x0

    .local v15, j:I
    :goto_0
    move/from16 v0, v17

    if-lt v15, v0, :cond_0

    .line 231
    return-void

    .line 206
    :cond_0
    move-object/from16 v0, v19

    invoke-virtual {v0, v15}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;

    .line 207
    .local v18, textureSourceWithLocation:Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;
    if-eqz v18, :cond_1

    .line 208
    invoke-virtual/range {v18 .. v18}, Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;->onLoadBitmap()Landroid/graphics/Bitmap;

    move-result-object v5

    .line 210
    .local v5, bmp:Landroid/graphics/Bitmap;
    if-nez v5, :cond_2

    .line 211
    :try_start_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "TextureSource: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v18 .. v18}, Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " returned a null Bitmap."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 220
    :catch_0
    move-exception v14

    .line 222
    .local v14, iae:Ljava/lang/IllegalArgumentException;
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Error loading: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v18 .. v18}, Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v14}, Lorg/anddev/andengine/util/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 223
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/anddev/andengine/opengl/texture/Texture;->mTextureStateListener:Lorg/anddev/andengine/opengl/texture/Texture$ITextureStateListener;

    if-eqz v1, :cond_4

    .line 224
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/anddev/andengine/opengl/texture/Texture;->mTextureStateListener:Lorg/anddev/andengine/opengl/texture/Texture$ITextureStateListener;

    #getter for: Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;->mTextureSource:Lorg/anddev/andengine/opengl/texture/source/ITextureSource;
    invoke-static/range {v18 .. v18}, Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;->access$0(Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;)Lorg/anddev/andengine/opengl/texture/source/ITextureSource;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-interface {v1, v0, v2, v14}, Lorg/anddev/andengine/opengl/texture/Texture$ITextureStateListener;->onTextureSourceLoadExeption(Lorg/anddev/andengine/opengl/texture/Texture;Lorg/anddev/andengine/opengl/texture/source/ITextureSource;Ljava/lang/Throwable;)V

    .line 205
    .end local v5           #bmp:Landroid/graphics/Bitmap;
    .end local v14           #iae:Ljava/lang/IllegalArgumentException;
    :cond_1
    :goto_1
    add-int/lit8 v15, v15, 0x1

    goto :goto_0

    .line 213
    .restart local v5       #bmp:Landroid/graphics/Bitmap;
    :cond_2
    if-eqz v16, :cond_3

    .line 214
    const/16 v1, 0xde1

    const/4 v2, 0x0

    :try_start_1
    invoke-virtual/range {v18 .. v18}, Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;->getTexturePositionX()I

    move-result v3

    invoke-virtual/range {v18 .. v18}, Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;->getTexturePositionY()I

    move-result v4

    const/16 v6, 0x1908

    const/16 v7, 0x1401

    invoke-static/range {v1 .. v7}, Landroid/opengl/GLUtils;->texSubImage2D(IIIILandroid/graphics/Bitmap;II)V

    .line 219
    :goto_2
    invoke-virtual {v5}, Landroid/graphics/Bitmap;->recycle()V

    goto :goto_1

    .line 216
    :cond_3
    const/16 v7, 0xde1

    const/4 v8, 0x0

    invoke-virtual/range {v18 .. v18}, Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;->getTexturePositionX()I

    move-result v9

    invoke-virtual/range {v18 .. v18}, Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;->getTexturePositionY()I

    move-result v10

    const/16 v12, 0x1908

    const/16 v13, 0x1401

    move-object/from16 v6, p1

    move-object v11, v5

    invoke-static/range {v6 .. v13}, Lorg/anddev/andengine/opengl/util/GLHelper;->glTexSubImage2D(Ljavax/microedition/khronos/opengles/GL10;IIIILandroid/graphics/Bitmap;II)V
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2

    .line 226
    .restart local v14       #iae:Ljava/lang/IllegalArgumentException;
    :cond_4
    throw v14
.end method


# virtual methods
.method public addTextureSource(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;II)Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;
    .locals 2
    .parameter "pTextureSource"
    .parameter "pTexturePositionX"
    .parameter "pTexturePositionY"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 131
    invoke-direct {p0, p1, p2, p3}, Lorg/anddev/andengine/opengl/texture/Texture;->checkTextureSourcePosition(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;II)V

    .line 133
    new-instance v0, Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;

    invoke-direct {v0, p1, p2, p3}, Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;-><init>(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;II)V

    .line 134
    .local v0, textureSourceWithLocation:Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;
    iget-object v1, p0, Lorg/anddev/andengine/opengl/texture/Texture;->mTextureSources:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 135
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/anddev/andengine/opengl/texture/Texture;->mUpdateOnHardwareNeeded:Z

    .line 136
    return-object v0
.end method

.method public clearTextureSources()V
    .locals 1

    .prologue
    .line 162
    iget-object v0, p0, Lorg/anddev/andengine/opengl/texture/Texture;->mTextureSources:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 163
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/anddev/andengine/opengl/texture/Texture;->mUpdateOnHardwareNeeded:Z

    .line 164
    return-void
.end method

.method public getHardwareTextureID()I
    .locals 1

    .prologue
    .line 95
    iget v0, p0, Lorg/anddev/andengine/opengl/texture/Texture;->mHardwareTextureID:I

    return v0
.end method

.method public getHeight()I
    .locals 1

    .prologue
    .line 115
    iget v0, p0, Lorg/anddev/andengine/opengl/texture/Texture;->mHeight:I

    return v0
.end method

.method public getTextureOptions()Lorg/anddev/andengine/opengl/texture/TextureOptions;
    .locals 1

    .prologue
    .line 119
    iget-object v0, p0, Lorg/anddev/andengine/opengl/texture/Texture;->mTextureOptions:Lorg/anddev/andengine/opengl/texture/TextureOptions;

    return-object v0
.end method

.method public getWidth()I
    .locals 1

    .prologue
    .line 111
    iget v0, p0, Lorg/anddev/andengine/opengl/texture/Texture;->mWidth:I

    return v0
.end method

.method public isLoadedToHardware()Z
    .locals 1

    .prologue
    .line 99
    iget-boolean v0, p0, Lorg/anddev/andengine/opengl/texture/Texture;->mLoadedToHardware:Z

    return v0
.end method

.method public isUpdateOnHardwareNeeded()Z
    .locals 1

    .prologue
    .line 103
    iget-boolean v0, p0, Lorg/anddev/andengine/opengl/texture/Texture;->mUpdateOnHardwareNeeded:Z

    return v0
.end method

.method public loadToHardware(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 1
    .parameter "pGL"

    .prologue
    .line 167
    invoke-static {p1}, Lorg/anddev/andengine/opengl/util/GLHelper;->enableTextures(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 169
    invoke-static {p1}, Lorg/anddev/andengine/opengl/texture/Texture;->generateHardwareTextureID(Ljavax/microedition/khronos/opengles/GL10;)I

    move-result v0

    iput v0, p0, Lorg/anddev/andengine/opengl/texture/Texture;->mHardwareTextureID:I

    .line 171
    invoke-direct {p0, p1}, Lorg/anddev/andengine/opengl/texture/Texture;->allocateAndBindTextureOnHardware(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 173
    invoke-direct {p0, p1}, Lorg/anddev/andengine/opengl/texture/Texture;->applyTextureOptions(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 175
    invoke-direct {p0, p1}, Lorg/anddev/andengine/opengl/texture/Texture;->writeTextureToHardware(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 177
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/anddev/andengine/opengl/texture/Texture;->mUpdateOnHardwareNeeded:Z

    .line 178
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/anddev/andengine/opengl/texture/Texture;->mLoadedToHardware:Z

    .line 180
    iget-object v0, p0, Lorg/anddev/andengine/opengl/texture/Texture;->mTextureStateListener:Lorg/anddev/andengine/opengl/texture/Texture$ITextureStateListener;

    if-eqz v0, :cond_0

    .line 181
    iget-object v0, p0, Lorg/anddev/andengine/opengl/texture/Texture;->mTextureStateListener:Lorg/anddev/andengine/opengl/texture/Texture$ITextureStateListener;

    invoke-interface {v0, p0}, Lorg/anddev/andengine/opengl/texture/Texture$ITextureStateListener;->onLoadedToHardware(Lorg/anddev/andengine/opengl/texture/Texture;)V

    .line 183
    :cond_0
    return-void
.end method

.method public removeTextureSource(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;II)V
    .locals 4
    .parameter "pTextureSource"
    .parameter "pTexturePositionX"
    .parameter "pTexturePositionY"

    .prologue
    .line 150
    iget-object v2, p0, Lorg/anddev/andengine/opengl/texture/Texture;->mTextureSources:Ljava/util/ArrayList;

    .line 151
    .local v2, textureSources:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;>;"
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/lit8 v0, v3, -0x1

    .local v0, i:I
    :goto_0
    if-gez v0, :cond_0

    .line 159
    :goto_1
    return-void

    .line 152
    :cond_0
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;

    .line 153
    .local v1, textureSourceWithLocation:Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;
    #getter for: Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;->mTextureSource:Lorg/anddev/andengine/opengl/texture/source/ITextureSource;
    invoke-static {v1}, Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;->access$0(Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;)Lorg/anddev/andengine/opengl/texture/source/ITextureSource;

    move-result-object v3

    if-ne v3, p1, :cond_1

    #getter for: Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;->mTexturePositionX:I
    invoke-static {v1}, Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;->access$1(Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;)I

    move-result v3

    if-ne v3, p2, :cond_1

    #getter for: Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;->mTexturePositionY:I
    invoke-static {v1}, Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;->access$2(Lorg/anddev/andengine/opengl/texture/Texture$TextureSourceWithLocation;)I

    move-result v3

    if-ne v3, p3, :cond_1

    .line 154
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 155
    const/4 v3, 0x1

    iput-boolean v3, p0, Lorg/anddev/andengine/opengl/texture/Texture;->mUpdateOnHardwareNeeded:Z

    goto :goto_1

    .line 151
    :cond_1
    add-int/lit8 v0, v0, -0x1

    goto :goto_0
.end method

.method setLoadedToHardware(Z)V
    .locals 0
    .parameter "pLoadedToHardware"

    .prologue
    .line 107
    iput-boolean p1, p0, Lorg/anddev/andengine/opengl/texture/Texture;->mLoadedToHardware:Z

    .line 108
    return-void
.end method

.method public unloadFromHardware(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 1
    .parameter "pGL"

    .prologue
    .line 186
    invoke-static {p1}, Lorg/anddev/andengine/opengl/util/GLHelper;->enableTextures(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 188
    invoke-direct {p0, p1}, Lorg/anddev/andengine/opengl/texture/Texture;->deleteTextureOnHardware(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 190
    const/4 v0, -0x1

    iput v0, p0, Lorg/anddev/andengine/opengl/texture/Texture;->mHardwareTextureID:I

    .line 192
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/anddev/andengine/opengl/texture/Texture;->mLoadedToHardware:Z

    .line 194
    iget-object v0, p0, Lorg/anddev/andengine/opengl/texture/Texture;->mTextureStateListener:Lorg/anddev/andengine/opengl/texture/Texture$ITextureStateListener;

    if-eqz v0, :cond_0

    .line 195
    iget-object v0, p0, Lorg/anddev/andengine/opengl/texture/Texture;->mTextureStateListener:Lorg/anddev/andengine/opengl/texture/Texture$ITextureStateListener;

    invoke-interface {v0, p0}, Lorg/anddev/andengine/opengl/texture/Texture$ITextureStateListener;->onUnloadedFromHardware(Lorg/anddev/andengine/opengl/texture/Texture;)V

    .line 197
    :cond_0
    return-void
.end method
