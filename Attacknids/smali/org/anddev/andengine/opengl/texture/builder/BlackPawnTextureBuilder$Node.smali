.class public Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;
.super Ljava/lang/Object;
.source "BlackPawnTextureBuilder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "Node"
.end annotation


# instance fields
.field private mChildA:Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;

.field private mChildB:Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;

.field private final mRect:Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;

.field private mTextureSource:Lorg/anddev/andengine/opengl/texture/source/ITextureSource;


# direct methods
.method public constructor <init>(IIII)V
    .locals 1
    .parameter "pLeft"
    .parameter "pTop"
    .parameter "pWidth"
    .parameter "pHeight"

    .prologue
    .line 177
    new-instance v0, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;

    invoke-direct {v0, p1, p2, p3, p4}, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;-><init>(IIII)V

    invoke-direct {p0, v0}, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;-><init>(Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;)V

    .line 178
    return-void
.end method

.method public constructor <init>(Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;)V
    .locals 0
    .parameter "pRect"

    .prologue
    .line 180
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 181
    iput-object p1, p0, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;->mRect:Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;

    .line 182
    return-void
.end method

.method static synthetic access$0(Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;)Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;
    .locals 1
    .parameter

    .prologue
    .line 169
    iget-object v0, p0, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;->mRect:Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;

    return-object v0
.end method

.method private createChildren(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;IIIII)Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;
    .locals 7
    .parameter "pTextureSource"
    .parameter "pTextureWidth"
    .parameter "pTextureHeight"
    .parameter "pTextureSpacing"
    .parameter "pDeltaWidth"
    .parameter "pDeltaHeight"

    .prologue
    .line 283
    iget-object v0, p0, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;->mRect:Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;

    .line 285
    .local v0, rect:Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;
    if-lt p5, p6, :cond_0

    .line 287
    new-instance v1, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;

    .line 288
    invoke-virtual {v0}, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;->getLeft()I

    move-result v2

    .line 289
    invoke-virtual {v0}, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;->getTop()I

    move-result v3

    .line 290
    invoke-interface {p1}, Lorg/anddev/andengine/opengl/texture/source/ITextureSource;->getWidth()I

    move-result v4

    add-int/2addr v4, p4

    .line 291
    invoke-virtual {v0}, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;->getHeight()I

    move-result v5

    invoke-direct {v1, v2, v3, v4, v5}, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;-><init>(IIII)V

    .line 287
    iput-object v1, p0, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;->mChildA:Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;

    .line 294
    new-instance v1, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;

    .line 295
    invoke-virtual {v0}, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;->getLeft()I

    move-result v2

    invoke-interface {p1}, Lorg/anddev/andengine/opengl/texture/source/ITextureSource;->getWidth()I

    move-result v3

    add-int/2addr v3, p4

    add-int/2addr v2, v3

    .line 296
    invoke-virtual {v0}, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;->getTop()I

    move-result v3

    .line 297
    invoke-virtual {v0}, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;->getWidth()I

    move-result v4

    invoke-interface {p1}, Lorg/anddev/andengine/opengl/texture/source/ITextureSource;->getWidth()I

    move-result v5

    add-int/2addr v5, p4

    sub-int/2addr v4, v5

    .line 298
    invoke-virtual {v0}, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;->getHeight()I

    move-result v5

    invoke-direct {v1, v2, v3, v4, v5}, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;-><init>(IIII)V

    .line 294
    iput-object v1, p0, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;->mChildB:Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;

    .line 317
    :goto_0
    iget-object v1, p0, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;->mChildA:Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;

    invoke-virtual {v1, p1, p2, p3, p4}, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;->insert(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;III)Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;

    move-result-object v1

    return-object v1

    .line 302
    :cond_0
    new-instance v1, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;

    .line 303
    invoke-virtual {v0}, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;->getLeft()I

    move-result v2

    .line 304
    invoke-virtual {v0}, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;->getTop()I

    move-result v3

    .line 305
    invoke-virtual {v0}, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;->getWidth()I

    move-result v4

    .line 306
    invoke-interface {p1}, Lorg/anddev/andengine/opengl/texture/source/ITextureSource;->getHeight()I

    move-result v5

    add-int/2addr v5, p4

    invoke-direct {v1, v2, v3, v4, v5}, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;-><init>(IIII)V

    .line 302
    iput-object v1, p0, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;->mChildA:Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;

    .line 309
    new-instance v1, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;

    .line 310
    invoke-virtual {v0}, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;->getLeft()I

    move-result v2

    .line 311
    invoke-virtual {v0}, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;->getTop()I

    move-result v3

    invoke-interface {p1}, Lorg/anddev/andengine/opengl/texture/source/ITextureSource;->getHeight()I

    move-result v4

    add-int/2addr v4, p4

    add-int/2addr v3, v4

    .line 312
    invoke-virtual {v0}, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;->getWidth()I

    move-result v4

    .line 313
    invoke-virtual {v0}, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;->getHeight()I

    move-result v5

    invoke-interface {p1}, Lorg/anddev/andengine/opengl/texture/source/ITextureSource;->getHeight()I

    move-result v6

    add-int/2addr v6, p4

    sub-int/2addr v5, v6

    invoke-direct {v1, v2, v3, v4, v5}, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;-><init>(IIII)V

    .line 309
    iput-object v1, p0, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;->mChildB:Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;

    goto :goto_0
.end method


# virtual methods
.method public getChildA()Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;
    .locals 1

    .prologue
    .line 193
    iget-object v0, p0, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;->mChildA:Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;

    return-object v0
.end method

.method public getChildB()Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;
    .locals 1

    .prologue
    .line 197
    iget-object v0, p0, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;->mChildB:Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;

    return-object v0
.end method

.method public getRect()Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;
    .locals 1

    .prologue
    .line 189
    iget-object v0, p0, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;->mRect:Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;

    return-object v0
.end method

.method public insert(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;III)Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;
    .locals 22
    .parameter "pTextureSource"
    .parameter "pTextureWidth"
    .parameter "pTextureHeight"
    .parameter "pTextureSpacing"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 209
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;->mChildA:Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;

    if-eqz v4, :cond_1

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;->mChildB:Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;

    if-eqz v4, :cond_1

    .line 210
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;->mChildA:Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;

    move-object/from16 v0, p1

    move/from16 v1, p2

    move/from16 v2, p3

    move/from16 v3, p4

    invoke-virtual {v4, v0, v1, v2, v3}, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;->insert(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;III)Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;

    move-result-object v13

    .line 211
    .local v13, newNode:Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;
    if-eqz v13, :cond_0

    move-object/from16 p0, v13

    .line 277
    .end local v13           #newNode:Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;
    .end local p0
    :goto_0
    return-object p0

    .line 214
    .restart local v13       #newNode:Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;
    .restart local p0
    :cond_0
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;->mChildB:Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;

    move-object/from16 v0, p1

    move/from16 v1, p2

    move/from16 v2, p3

    move/from16 v3, p4

    invoke-virtual {v4, v0, v1, v2, v3}, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;->insert(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;III)Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;

    move-result-object p0

    goto :goto_0

    .line 217
    .end local v13           #newNode:Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;
    :cond_1
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;->mTextureSource:Lorg/anddev/andengine/opengl/texture/source/ITextureSource;

    if-eqz v4, :cond_2

    .line 218
    const/16 p0, 0x0

    goto :goto_0

    .line 221
    :cond_2
    invoke-interface/range {p1 .. p1}, Lorg/anddev/andengine/opengl/texture/source/ITextureSource;->getWidth()I

    move-result v20

    .line 222
    .local v20, textureSourceWidth:I
    invoke-interface/range {p1 .. p1}, Lorg/anddev/andengine/opengl/texture/source/ITextureSource;->getHeight()I

    move-result v18

    .line 224
    .local v18, textureSourceHeight:I
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;->mRect:Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;

    invoke-virtual {v4}, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;->getWidth()I

    move-result v17

    .line 225
    .local v17, rectWidth:I
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;->mRect:Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;

    invoke-virtual {v4}, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;->getHeight()I

    move-result v14

    .line 227
    .local v14, rectHeight:I
    move/from16 v0, v20

    move/from16 v1, v17

    if-gt v0, v1, :cond_3

    move/from16 v0, v18

    if-le v0, v14, :cond_4

    .line 228
    :cond_3
    const/16 p0, 0x0

    goto :goto_0

    .line 231
    :cond_4
    add-int v21, v20, p4

    .line 232
    .local v21, textureSourceWidthWithSpacing:I
    add-int v19, v18, p4

    .line 234
    .local v19, textureSourceHeightWithSpacing:I
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;->mRect:Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;

    invoke-virtual {v4}, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;->getLeft()I

    move-result v15

    .line 235
    .local v15, rectLeft:I
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;->mRect:Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;

    invoke-virtual {v4}, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Rect;->getTop()I

    move-result v16

    .line 237
    .local v16, rectTop:I
    move/from16 v0, v18

    if-ne v0, v14, :cond_5

    add-int v4, v16, v18

    move/from16 v0, p3

    if-ne v4, v0, :cond_5

    const/4 v11, 0x1

    .line 238
    .local v11, fitToBottomWithoutSpacing:Z
    :goto_1
    move/from16 v0, v20

    move/from16 v1, v17

    if-ne v0, v1, :cond_6

    add-int v4, v15, v20

    move/from16 v0, p2

    if-ne v4, v0, :cond_6

    const/4 v12, 0x1

    .line 240
    .local v12, fitToRightWithoutSpacing:Z
    :goto_2
    move/from16 v0, v21

    move/from16 v1, v17

    if-ne v0, v1, :cond_8

    .line 241
    move/from16 v0, v19

    if-ne v0, v14, :cond_7

    .line 242
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;->mTextureSource:Lorg/anddev/andengine/opengl/texture/source/ITextureSource;

    goto :goto_0

    .line 237
    .end local v11           #fitToBottomWithoutSpacing:Z
    .end local v12           #fitToRightWithoutSpacing:Z
    :cond_5
    const/4 v11, 0x0

    goto :goto_1

    .line 238
    .restart local v11       #fitToBottomWithoutSpacing:Z
    :cond_6
    const/4 v12, 0x0

    goto :goto_2

    .line 244
    .restart local v12       #fitToRightWithoutSpacing:Z
    :cond_7
    if-eqz v11, :cond_8

    .line 245
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;->mTextureSource:Lorg/anddev/andengine/opengl/texture/source/ITextureSource;

    goto/16 :goto_0

    .line 250
    :cond_8
    if-eqz v12, :cond_c

    .line 251
    move/from16 v0, v19

    if-ne v0, v14, :cond_9

    .line 252
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;->mTextureSource:Lorg/anddev/andengine/opengl/texture/source/ITextureSource;

    goto/16 :goto_0

    .line 254
    :cond_9
    if-eqz v11, :cond_a

    .line 255
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;->mTextureSource:Lorg/anddev/andengine/opengl/texture/source/ITextureSource;

    goto/16 :goto_0

    .line 257
    :cond_a
    move/from16 v0, v19

    if-le v0, v14, :cond_b

    .line 258
    const/16 p0, 0x0

    goto/16 :goto_0

    .line 261
    :cond_b
    sub-int v9, v17, v20

    sub-int v10, v14, v19

    move-object/from16 v4, p0

    move-object/from16 v5, p1

    move/from16 v6, p2

    move/from16 v7, p3

    move/from16 v8, p4

    invoke-direct/range {v4 .. v10}, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;->createChildren(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;IIIII)Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;

    move-result-object p0

    goto/16 :goto_0

    .line 265
    :cond_c
    if-eqz v11, :cond_f

    .line 266
    move/from16 v0, v21

    move/from16 v1, v17

    if-ne v0, v1, :cond_d

    .line 267
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;->mTextureSource:Lorg/anddev/andengine/opengl/texture/source/ITextureSource;

    goto/16 :goto_0

    .line 269
    :cond_d
    move/from16 v0, v21

    move/from16 v1, v17

    if-le v0, v1, :cond_e

    .line 270
    const/16 p0, 0x0

    goto/16 :goto_0

    .line 272
    :cond_e
    sub-int v9, v17, v21

    sub-int v10, v14, v18

    move-object/from16 v4, p0

    move-object/from16 v5, p1

    move/from16 v6, p2

    move/from16 v7, p3

    move/from16 v8, p4

    invoke-direct/range {v4 .. v10}, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;->createChildren(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;IIIII)Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;

    move-result-object p0

    goto/16 :goto_0

    .line 274
    :cond_f
    move/from16 v0, v21

    move/from16 v1, v17

    if-gt v0, v1, :cond_10

    move/from16 v0, v19

    if-le v0, v14, :cond_11

    .line 275
    :cond_10
    const/16 p0, 0x0

    goto/16 :goto_0

    .line 277
    :cond_11
    sub-int v9, v17, v21

    sub-int v10, v14, v19

    move-object/from16 v4, p0

    move-object/from16 v5, p1

    move/from16 v6, p2

    move/from16 v7, p3

    move/from16 v8, p4

    invoke-direct/range {v4 .. v10}, Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;->createChildren(Lorg/anddev/andengine/opengl/texture/source/ITextureSource;IIIII)Lorg/anddev/andengine/opengl/texture/builder/BlackPawnTextureBuilder$Node;

    move-result-object p0

    goto/16 :goto_0
.end method
