.class public Lorg/anddev/andengine/opengl/vertex/TextVertexBuffer;
.super Lorg/anddev/andengine/opengl/vertex/VertexBuffer;
.source "TextVertexBuffer.java"


# static fields
.field private static synthetic $SWITCH_TABLE$org$anddev$andengine$util$HorizontalAlign:[I = null

.field public static final VERTICES_PER_CHARACTER:I = 0x6


# instance fields
.field private final mHorizontalAlign:Lorg/anddev/andengine/util/HorizontalAlign;


# direct methods
.method static synthetic $SWITCH_TABLE$org$anddev$andengine$util$HorizontalAlign()[I
    .locals 3

    .prologue
    .line 12
    sget-object v0, Lorg/anddev/andengine/opengl/vertex/TextVertexBuffer;->$SWITCH_TABLE$org$anddev$andengine$util$HorizontalAlign:[I

    if-eqz v0, :cond_0

    :goto_0
    return-object v0

    :cond_0
    invoke-static {}, Lorg/anddev/andengine/util/HorizontalAlign;->values()[Lorg/anddev/andengine/util/HorizontalAlign;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lorg/anddev/andengine/util/HorizontalAlign;->CENTER:Lorg/anddev/andengine/util/HorizontalAlign;

    invoke-virtual {v1}, Lorg/anddev/andengine/util/HorizontalAlign;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_2

    :goto_1
    :try_start_1
    sget-object v1, Lorg/anddev/andengine/util/HorizontalAlign;->LEFT:Lorg/anddev/andengine/util/HorizontalAlign;

    invoke-virtual {v1}, Lorg/anddev/andengine/util/HorizontalAlign;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :goto_2
    :try_start_2
    sget-object v1, Lorg/anddev/andengine/util/HorizontalAlign;->RIGHT:Lorg/anddev/andengine/util/HorizontalAlign;

    invoke-virtual {v1}, Lorg/anddev/andengine/util/HorizontalAlign;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_0

    :goto_3
    sput-object v0, Lorg/anddev/andengine/opengl/vertex/TextVertexBuffer;->$SWITCH_TABLE$org$anddev$andengine$util$HorizontalAlign:[I

    goto :goto_0

    :catch_0
    move-exception v1

    goto :goto_3

    :catch_1
    move-exception v1

    goto :goto_2

    :catch_2
    move-exception v1

    goto :goto_1
.end method

.method public constructor <init>(ILorg/anddev/andengine/util/HorizontalAlign;I)V
    .locals 1
    .parameter "pCharacterCount"
    .parameter "pHorizontalAlign"
    .parameter "pDrawType"

    .prologue
    .line 30
    mul-int/lit8 v0, p1, 0xc

    invoke-direct {p0, v0, p3}, Lorg/anddev/andengine/opengl/vertex/VertexBuffer;-><init>(II)V

    .line 32
    iput-object p2, p0, Lorg/anddev/andengine/opengl/vertex/TextVertexBuffer;->mHorizontalAlign:Lorg/anddev/andengine/util/HorizontalAlign;

    .line 33
    return-void
.end method


# virtual methods
.method public declared-synchronized update(Lorg/anddev/andengine/opengl/font/Font;I[I[Ljava/lang/String;)V
    .locals 23
    .parameter "font"
    .parameter "pMaximumLineWidth"
    .parameter "pWidths"
    .parameter "pLines"

    .prologue
    .line 48
    monitor-enter p0

    :try_start_0
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/anddev/andengine/opengl/vertex/TextVertexBuffer;->mBufferData:[I

    .line 49
    .local v2, bufferData:[I
    const/4 v3, 0x0

    .line 51
    .local v3, i:I
    invoke-virtual/range {p1 .. p1}, Lorg/anddev/andengine/opengl/font/Font;->getLineHeight()I

    move-result v9

    .line 53
    .local v9, lineHeight:I
    move-object/from16 v0, p4

    array-length v8, v0

    .line 54
    .local v8, lineCount:I
    const/4 v10, 0x0

    .local v10, lineIndex:I
    :goto_0
    if-lt v10, v8, :cond_0

    .line 106
    invoke-virtual/range {p0 .. p0}, Lorg/anddev/andengine/opengl/vertex/TextVertexBuffer;->getFloatBuffer()Lorg/anddev/andengine/opengl/util/FastFloatBuffer;

    move-result-object v20

    .line 107
    .local v20, vertexFloatBuffer:Lorg/anddev/andengine/opengl/util/FastFloatBuffer;
    const/16 v21, 0x0

    invoke-virtual/range {v20 .. v21}, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;->position(I)V

    .line 108
    move-object/from16 v0, v20

    invoke-virtual {v0, v2}, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;->put([I)V

    .line 109
    const/16 v21, 0x0

    invoke-virtual/range {v20 .. v21}, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;->position(I)V

    .line 111
    invoke-super/range {p0 .. p0}, Lorg/anddev/andengine/opengl/vertex/VertexBuffer;->setHardwareBufferNeedsUpdate()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 112
    monitor-exit p0

    return-void

    .line 55
    .end local v20           #vertexFloatBuffer:Lorg/anddev/andengine/opengl/util/FastFloatBuffer;
    :cond_0
    :try_start_1
    aget-object v7, p4, v10

    .line 58
    .local v7, line:Ljava/lang/String;
    invoke-static {}, Lorg/anddev/andengine/opengl/vertex/TextVertexBuffer;->$SWITCH_TABLE$org$anddev$andengine$util$HorizontalAlign()[I

    move-result-object v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/anddev/andengine/opengl/vertex/TextVertexBuffer;->mHorizontalAlign:Lorg/anddev/andengine/util/HorizontalAlign;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lorg/anddev/andengine/util/HorizontalAlign;->ordinal()I

    move-result v22

    aget v21, v21, v22

    packed-switch v21, :pswitch_data_0

    .line 67
    const/4 v12, 0x0

    .line 70
    .local v12, lineX:I
    :goto_1
    invoke-virtual/range {p1 .. p1}, Lorg/anddev/andengine/opengl/font/Font;->getLineHeight()I

    move-result v21

    invoke-virtual/range {p1 .. p1}, Lorg/anddev/andengine/opengl/font/Font;->getLineGap()I

    move-result v22

    add-int v21, v21, v22

    mul-int v16, v10, v21

    .line 71
    .local v16, lineY:I
    move/from16 v0, v16

    int-to-float v0, v0

    move/from16 v21, v0

    invoke-static/range {v21 .. v21}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v19

    .line 73
    .local v19, lineYBits:I
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v11

    .line 74
    .local v11, lineLength:I
    const/4 v6, 0x0

    .local v6, letterIndex:I
    move v4, v3

    .end local v3           #i:I
    .local v4, i:I
    :goto_2
    if-lt v6, v11, :cond_1

    .line 54
    add-int/lit8 v10, v10, 0x1

    move v3, v4

    .end local v4           #i:I
    .restart local v3       #i:I
    goto :goto_0

    .line 60
    .end local v6           #letterIndex:I
    .end local v11           #lineLength:I
    .end local v12           #lineX:I
    .end local v16           #lineY:I
    .end local v19           #lineYBits:I
    :pswitch_0
    aget v21, p3, v10

    sub-int v12, p2, v21

    .line 61
    .restart local v12       #lineX:I
    goto :goto_1

    .line 63
    .end local v12           #lineX:I
    :pswitch_1
    aget v21, p3, v10

    sub-int v21, p2, v21

    shr-int/lit8 v12, v21, 0x1

    .line 64
    .restart local v12       #lineX:I
    goto :goto_1

    .line 75
    .end local v3           #i:I
    .restart local v4       #i:I
    .restart local v6       #letterIndex:I
    .restart local v11       #lineLength:I
    .restart local v16       #lineY:I
    .restart local v19       #lineYBits:I
    :cond_1
    invoke-virtual {v7, v6}, Ljava/lang/String;->charAt(I)C

    move-result v21

    move-object/from16 v0, p1

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lorg/anddev/andengine/opengl/font/Font;->getLetter(C)Lorg/anddev/andengine/opengl/font/Letter;

    move-result-object v5

    .line 77
    .local v5, letter:Lorg/anddev/andengine/opengl/font/Letter;
    add-int v17, v16, v9

    .line 78
    .local v17, lineY2:I
    iget v0, v5, Lorg/anddev/andengine/opengl/font/Letter;->mWidth:I

    move/from16 v21, v0

    add-int v13, v12, v21

    .line 80
    .local v13, lineX2:I
    int-to-float v0, v12

    move/from16 v21, v0

    invoke-static/range {v21 .. v21}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v15

    .line 81
    .local v15, lineXBits:I
    int-to-float v0, v13

    move/from16 v21, v0

    invoke-static/range {v21 .. v21}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v14

    .line 82
    .local v14, lineX2Bits:I
    move/from16 v0, v17

    int-to-float v0, v0

    move/from16 v21, v0

    invoke-static/range {v21 .. v21}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v18

    .line 84
    .local v18, lineY2Bits:I
    add-int/lit8 v3, v4, 0x1

    .end local v4           #i:I
    .restart local v3       #i:I
    aput v15, v2, v4

    .line 85
    add-int/lit8 v4, v3, 0x1

    .end local v3           #i:I
    .restart local v4       #i:I
    aput v19, v2, v3

    .line 87
    add-int/lit8 v3, v4, 0x1

    .end local v4           #i:I
    .restart local v3       #i:I
    aput v15, v2, v4

    .line 88
    add-int/lit8 v4, v3, 0x1

    .end local v3           #i:I
    .restart local v4       #i:I
    aput v18, v2, v3

    .line 90
    add-int/lit8 v3, v4, 0x1

    .end local v4           #i:I
    .restart local v3       #i:I
    aput v14, v2, v4

    .line 91
    add-int/lit8 v4, v3, 0x1

    .end local v3           #i:I
    .restart local v4       #i:I
    aput v18, v2, v3

    .line 93
    add-int/lit8 v3, v4, 0x1

    .end local v4           #i:I
    .restart local v3       #i:I
    aput v14, v2, v4

    .line 94
    add-int/lit8 v4, v3, 0x1

    .end local v3           #i:I
    .restart local v4       #i:I
    aput v18, v2, v3

    .line 96
    add-int/lit8 v3, v4, 0x1

    .end local v4           #i:I
    .restart local v3       #i:I
    aput v14, v2, v4

    .line 97
    add-int/lit8 v4, v3, 0x1

    .end local v3           #i:I
    .restart local v4       #i:I
    aput v19, v2, v3

    .line 99
    add-int/lit8 v3, v4, 0x1

    .end local v4           #i:I
    .restart local v3       #i:I
    aput v15, v2, v4

    .line 100
    add-int/lit8 v4, v3, 0x1

    .end local v3           #i:I
    .restart local v4       #i:I
    aput v19, v2, v3

    .line 102
    iget v0, v5, Lorg/anddev/andengine/opengl/font/Letter;->mAdvance:I

    move/from16 v21, v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    add-int v12, v12, v21

    .line 74
    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    .line 48
    .end local v2           #bufferData:[I
    .end local v4           #i:I
    .end local v5           #letter:Lorg/anddev/andengine/opengl/font/Letter;
    .end local v6           #letterIndex:I
    .end local v7           #line:Ljava/lang/String;
    .end local v8           #lineCount:I
    .end local v9           #lineHeight:I
    .end local v10           #lineIndex:I
    .end local v11           #lineLength:I
    .end local v12           #lineX:I
    .end local v13           #lineX2:I
    .end local v14           #lineX2Bits:I
    .end local v15           #lineXBits:I
    .end local v16           #lineY:I
    .end local v17           #lineY2:I
    .end local v18           #lineY2Bits:I
    .end local v19           #lineYBits:I
    :catchall_0
    move-exception v21

    monitor-exit p0

    throw v21

    .line 58
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
