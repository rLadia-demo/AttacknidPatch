.class public Lorg/anddev/andengine/opengl/texture/TextureOptions;
.super Ljava/lang/Object;
.source "TextureOptions.java"


# static fields
.field public static final BILINEAR:Lorg/anddev/andengine/opengl/texture/TextureOptions;

.field public static final BILINEAR_PREMULTIPLYALPHA:Lorg/anddev/andengine/opengl/texture/TextureOptions;

.field public static final DEFAULT:Lorg/anddev/andengine/opengl/texture/TextureOptions;

.field public static final NEAREST:Lorg/anddev/andengine/opengl/texture/TextureOptions;

.field public static final NEAREST_PREMULTIPLYALPHA:Lorg/anddev/andengine/opengl/texture/TextureOptions;

.field public static final REPEATING:Lorg/anddev/andengine/opengl/texture/TextureOptions;

.field public static final REPEATING_BILINEAR:Lorg/anddev/andengine/opengl/texture/TextureOptions;

.field public static final REPEATING_BILINEAR_PREMULTIPLYALPHA:Lorg/anddev/andengine/opengl/texture/TextureOptions;

.field public static final REPEATING_PREMULTIPLYALPHA:Lorg/anddev/andengine/opengl/texture/TextureOptions;


# instance fields
.field public final mMagFilter:I

.field public final mMinFilter:I

.field public final mPreMultipyAlpha:Z

.field public final mTextureEnvironment:I

.field public final mWrapS:F

.field public final mWrapT:F


# direct methods
.method static constructor <clinit>()V
    .locals 16

    .prologue
    const v3, 0x812f

    const/16 v15, 0x2901

    const/16 v7, 0x2601

    const/16 v1, 0x2600

    const/16 v5, 0x2100

    .line 14
    new-instance v0, Lorg/anddev/andengine/opengl/texture/TextureOptions;

    const/4 v6, 0x0

    move v2, v1

    move v4, v3

    invoke-direct/range {v0 .. v6}, Lorg/anddev/andengine/opengl/texture/TextureOptions;-><init>(IIIIIZ)V

    sput-object v0, Lorg/anddev/andengine/opengl/texture/TextureOptions;->NEAREST:Lorg/anddev/andengine/opengl/texture/TextureOptions;

    .line 15
    new-instance v6, Lorg/anddev/andengine/opengl/texture/TextureOptions;

    const/4 v12, 0x0

    move v8, v7

    move v9, v3

    move v10, v3

    move v11, v5

    invoke-direct/range {v6 .. v12}, Lorg/anddev/andengine/opengl/texture/TextureOptions;-><init>(IIIIIZ)V

    sput-object v6, Lorg/anddev/andengine/opengl/texture/TextureOptions;->BILINEAR:Lorg/anddev/andengine/opengl/texture/TextureOptions;

    .line 16
    new-instance v8, Lorg/anddev/andengine/opengl/texture/TextureOptions;

    const/4 v14, 0x0

    move v9, v1

    move v10, v1

    move v11, v15

    move v12, v15

    move v13, v5

    invoke-direct/range {v8 .. v14}, Lorg/anddev/andengine/opengl/texture/TextureOptions;-><init>(IIIIIZ)V

    sput-object v8, Lorg/anddev/andengine/opengl/texture/TextureOptions;->REPEATING:Lorg/anddev/andengine/opengl/texture/TextureOptions;

    .line 17
    new-instance v6, Lorg/anddev/andengine/opengl/texture/TextureOptions;

    const/4 v12, 0x0

    move v8, v7

    move v9, v15

    move v10, v15

    move v11, v5

    invoke-direct/range {v6 .. v12}, Lorg/anddev/andengine/opengl/texture/TextureOptions;-><init>(IIIIIZ)V

    sput-object v6, Lorg/anddev/andengine/opengl/texture/TextureOptions;->REPEATING_BILINEAR:Lorg/anddev/andengine/opengl/texture/TextureOptions;

    .line 19
    new-instance v0, Lorg/anddev/andengine/opengl/texture/TextureOptions;

    const/4 v6, 0x1

    move v2, v1

    move v4, v3

    invoke-direct/range {v0 .. v6}, Lorg/anddev/andengine/opengl/texture/TextureOptions;-><init>(IIIIIZ)V

    sput-object v0, Lorg/anddev/andengine/opengl/texture/TextureOptions;->NEAREST_PREMULTIPLYALPHA:Lorg/anddev/andengine/opengl/texture/TextureOptions;

    .line 20
    new-instance v6, Lorg/anddev/andengine/opengl/texture/TextureOptions;

    const/4 v12, 0x1

    move v8, v7

    move v9, v3

    move v10, v3

    move v11, v5

    invoke-direct/range {v6 .. v12}, Lorg/anddev/andengine/opengl/texture/TextureOptions;-><init>(IIIIIZ)V

    sput-object v6, Lorg/anddev/andengine/opengl/texture/TextureOptions;->BILINEAR_PREMULTIPLYALPHA:Lorg/anddev/andengine/opengl/texture/TextureOptions;

    .line 21
    new-instance v0, Lorg/anddev/andengine/opengl/texture/TextureOptions;

    const/4 v6, 0x1

    move v2, v1

    move v3, v15

    move v4, v15

    invoke-direct/range {v0 .. v6}, Lorg/anddev/andengine/opengl/texture/TextureOptions;-><init>(IIIIIZ)V

    sput-object v0, Lorg/anddev/andengine/opengl/texture/TextureOptions;->REPEATING_PREMULTIPLYALPHA:Lorg/anddev/andengine/opengl/texture/TextureOptions;

    .line 22
    new-instance v6, Lorg/anddev/andengine/opengl/texture/TextureOptions;

    const/4 v12, 0x1

    move v8, v7

    move v9, v15

    move v10, v15

    move v11, v5

    invoke-direct/range {v6 .. v12}, Lorg/anddev/andengine/opengl/texture/TextureOptions;-><init>(IIIIIZ)V

    sput-object v6, Lorg/anddev/andengine/opengl/texture/TextureOptions;->REPEATING_BILINEAR_PREMULTIPLYALPHA:Lorg/anddev/andengine/opengl/texture/TextureOptions;

    .line 24
    sget-object v0, Lorg/anddev/andengine/opengl/texture/TextureOptions;->NEAREST_PREMULTIPLYALPHA:Lorg/anddev/andengine/opengl/texture/TextureOptions;

    sput-object v0, Lorg/anddev/andengine/opengl/texture/TextureOptions;->DEFAULT:Lorg/anddev/andengine/opengl/texture/TextureOptions;

    return-void
.end method

.method public constructor <init>(IIIIIZ)V
    .locals 1
    .parameter "pMinFilter"
    .parameter "pMagFilter"
    .parameter "pWrapT"
    .parameter "pWrapS"
    .parameter "pTextureEnvironment"
    .parameter "pPreMultiplyAlpha"

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput p1, p0, Lorg/anddev/andengine/opengl/texture/TextureOptions;->mMinFilter:I

    .line 43
    iput p2, p0, Lorg/anddev/andengine/opengl/texture/TextureOptions;->mMagFilter:I

    .line 44
    int-to-float v0, p3

    iput v0, p0, Lorg/anddev/andengine/opengl/texture/TextureOptions;->mWrapT:F

    .line 45
    int-to-float v0, p4

    iput v0, p0, Lorg/anddev/andengine/opengl/texture/TextureOptions;->mWrapS:F

    .line 46
    iput p5, p0, Lorg/anddev/andengine/opengl/texture/TextureOptions;->mTextureEnvironment:I

    .line 47
    iput-boolean p6, p0, Lorg/anddev/andengine/opengl/texture/TextureOptions;->mPreMultipyAlpha:Z

    .line 48
    return-void
.end method
