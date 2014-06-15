.class public Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;
.super Ljava/lang/Object;
.source "BlackPawnTextureBuilder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "Rect"
.end annotation


# instance fields
.field private final mHeight:I

.field private final mLeft:I

.field private final mTop:I

.field private final mWidth:I


# direct methods
.method public constructor <init>(IIII)V
    .locals 0
    .parameter "pLeft"
    .parameter "pTop"
    .parameter "pWidth"
    .parameter "pHeight"

    .prologue
    .line 105
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 106
    iput p1, p0, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;->mLeft:I

    .line 107
    iput p2, p0, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;->mTop:I

    .line 108
    iput p3, p0, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;->mWidth:I

    .line 109
    iput p4, p0, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;->mHeight:I

    .line 110
    return-void
.end method

.method static synthetic access$0(Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;)I
    .locals 1
    .parameter

    .prologue
    .line 96
    iget v0, p0, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;->mLeft:I

    return v0
.end method

.method static synthetic access$1(Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;)I
    .locals 1
    .parameter

    .prologue
    .line 97
    iget v0, p0, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;->mTop:I

    return v0
.end method


# virtual methods
.method public getBottom()I
    .locals 2

    .prologue
    .line 137
    iget v0, p0, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;->mTop:I

    iget v1, p0, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;->mHeight:I

    add-int/2addr v0, v1

    return v0
.end method

.method public getHeight()I
    .locals 1

    .prologue
    .line 121
    iget v0, p0, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;->mHeight:I

    return v0
.end method

.method public getLeft()I
    .locals 1

    .prologue
    .line 125
    iget v0, p0, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;->mLeft:I

    return v0
.end method

.method public getRight()I
    .locals 2

    .prologue
    .line 133
    iget v0, p0, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;->mLeft:I

    iget v1, p0, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;->mWidth:I

    add-int/2addr v0, v1

    return v0
.end method

.method public getTop()I
    .locals 1

    .prologue
    .line 129
    iget v0, p0, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;->mTop:I

    return v0
.end method

.method public getWidth()I
    .locals 1

    .prologue
    .line 117
    iget v0, p0, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;->mWidth:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 146
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "@: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;->mLeft:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;->mTop:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " * "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;->mWidth:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "x"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;->mHeight:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
