.class public Lorg/anddev/andengine/opengl/texture/buffer/TextTextureBuffer;
.super Lorg/anddev/andengine/opengl/buffer/BufferObject;
.source "TextTextureBuffer.java"


# direct methods
.method public constructor <init>(II)V
    .locals 0
    .parameter "pCapacity"
    .parameter "pDrawType"

    .prologue
    .line 26
    invoke-direct {p0, p1, p2}, Lorg/anddev/andengine/opengl/buffer/BufferObject;-><init>(II)V

    .line 27
    return-void
.end method


# virtual methods
.method public declared-synchronized update(Lorg/anddev/andengine/opengl/font/Font;[Ljava/lang/String;)V
    .locals 14
    .parameter "pFont"
    .parameter "pLines"

    .prologue
    .line 42
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/buffer/TextTextureBuffer;->getFloatBuffer()Lorg/anddev/andengine/opengl/util/FastFloatBuffer;

    move-result-object v12

    .line 43
    .local v12, textureFloatBuffer:Lorg/anddev/andengine/opengl/util/FastFloatBuffer;
    const/4 v13, 0x0

    invoke-virtual {v12, v13}, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;->position(I)V

    .line 45
    move-object v0, p1

    .line 46
    .local v0, font:Lorg/anddev/andengine/opengl/font/Font;
    move-object/from16 v11, p2

    .line 48
    .local v11, lines:[Ljava/lang/String;
    array-length v9, v11

    .line 49
    .local v9, lineCount:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-lt v1, v9, :cond_0

    .line 80
    const/4 v13, 0x0

    invoke-virtual {v12, v13}, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;->position(I)V

    .line 82
    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/texture/buffer/TextTextureBuffer;->setHardwareBufferNeedsUpdate()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 83
    monitor-exit p0

    return-void

    .line 50
    :cond_0
    :try_start_1
    aget-object v8, v11, v1

    .line 52
    .local v8, line:Ljava/lang/String;
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v10

    .line 53
    .local v10, lineLength:I
    const/4 v2, 0x0

    .local v2, j:I
    :goto_1
    if-lt v2, v10, :cond_1

    .line 49
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 54
    :cond_1
    invoke-virtual {v8, v2}, Ljava/lang/String;->charAt(I)C

    move-result v13

    invoke-virtual {v0, v13}, Lorg/anddev/andengine/opengl/font/Font;->getLetter(C)Lorg/anddev/andengine/opengl/font/Letter;

    move-result-object v3

    .line 56
    .local v3, letter:Lorg/anddev/andengine/opengl/font/Letter;
    iget v4, v3, Lorg/anddev/andengine/opengl/font/Letter;->mTextureX:F

    .line 57
    .local v4, letterTextureX:F
    iget v6, v3, Lorg/anddev/andengine/opengl/font/Letter;->mTextureY:F

    .line 58
    .local v6, letterTextureY:F
    iget v13, v3, Lorg/anddev/andengine/opengl/font/Letter;->mTextureWidth:F

    add-float v5, v4, v13

    .line 59
    .local v5, letterTextureX2:F
    iget v13, v3, Lorg/anddev/andengine/opengl/font/Letter;->mTextureHeight:F

    add-float v7, v6, v13

    .line 61
    .local v7, letterTextureY2:F
    invoke-virtual {v12, v4}, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;->put(F)V

    .line 62
    invoke-virtual {v12, v6}, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;->put(F)V

    .line 64
    invoke-virtual {v12, v4}, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;->put(F)V

    .line 65
    invoke-virtual {v12, v7}, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;->put(F)V

    .line 67
    invoke-virtual {v12, v5}, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;->put(F)V

    .line 68
    invoke-virtual {v12, v7}, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;->put(F)V

    .line 70
    invoke-virtual {v12, v5}, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;->put(F)V

    .line 71
    invoke-virtual {v12, v7}, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;->put(F)V

    .line 73
    invoke-virtual {v12, v5}, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;->put(F)V

    .line 74
    invoke-virtual {v12, v6}, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;->put(F)V

    .line 76
    invoke-virtual {v12, v4}, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;->put(F)V

    .line 77
    invoke-virtual {v12, v6}, Lorg/anddev/andengine/opengl/util/FastFloatBuffer;->put(F)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 53
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 42
    .end local v0           #font:Lorg/anddev/andengine/opengl/font/Font;
    .end local v1           #i:I
    .end local v2           #j:I
    .end local v3           #letter:Lorg/anddev/andengine/opengl/font/Letter;
    .end local v4           #letterTextureX:F
    .end local v5           #letterTextureX2:F
    .end local v6           #letterTextureY:F
    .end local v7           #letterTextureY2:F
    .end local v8           #line:Ljava/lang/String;
    .end local v9           #lineCount:I
    .end local v10           #lineLength:I
    .end local v11           #lines:[Ljava/lang/String;
    .end local v12           #textureFloatBuffer:Lorg/anddev/andengine/opengl/util/FastFloatBuffer;
    :catchall_0
    move-exception v13

    monitor-exit p0

    throw v13
.end method
