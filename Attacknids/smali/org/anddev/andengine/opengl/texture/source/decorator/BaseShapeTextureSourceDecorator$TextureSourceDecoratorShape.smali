.class public abstract enum Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;
.super Ljava/lang/Enum;
.source "BaseShapeTextureSourceDecorator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4409
    name = "TextureSourceDecoratorShape"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum CIRCLE:Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;

.field public static final enum ELLIPSE:Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;

.field private static final synthetic ENUM$VALUES:[Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;

.field public static final enum RECTANGLE:Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 65
    new-instance v0, Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape$1;

    const-string v1, "CIRCLE"

    invoke-direct {v0, v1, v2}, Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape$1;-><init>(Ljava/lang/String;I)V

    .line 69
    sput-object v0, Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;->CIRCLE:Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;

    .line 78
    new-instance v0, Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape$2;

    const-string v1, "ELLIPSE"

    invoke-direct {v0, v1, v3}, Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape$2;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;->ELLIPSE:Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;

    .line 87
    new-instance v0, Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape$3;

    const-string v1, "RECTANGLE"

    invoke-direct {v0, v1, v4}, Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape$3;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;->RECTANGLE:Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;

    .line 64
    const/4 v0, 0x3

    new-array v0, v0, [Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;

    sget-object v1, Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;->CIRCLE:Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;

    aput-object v1, v0, v2

    sget-object v1, Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;->ELLIPSE:Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;

    aput-object v1, v0, v3

    sget-object v1, Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;->RECTANGLE:Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;

    aput-object v1, v0, v4

    sput-object v0, Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;->ENUM$VALUES:[Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 64
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;ILorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 64
    invoke-direct {p0, p1, p2}, Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;
    .locals 1
    .parameter

    .prologue
    .line 1
    const-class v0, Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;

    return-object v0
.end method

.method public static values()[Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;->ENUM$VALUES:[Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;

    array-length v1, v0

    new-array v2, v1, [Lorg/anddev/andengine/opengl/texture/source/decorator/BaseShapeTextureSourceDecorator$TextureSourceDecoratorShape;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method


# virtual methods
.method public abstract onDecorateBitmap(Landroid/graphics/Canvas;Landroid/graphics/Paint;)V
.end method
