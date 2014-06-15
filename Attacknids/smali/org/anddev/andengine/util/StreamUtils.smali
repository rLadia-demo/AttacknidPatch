.class public Lorg/anddev/andengine/util/StreamUtils;
.super Ljava/lang/Object;
.source "StreamUtils.java"


# static fields
.field public static final IO_BUFFER_SIZE:I = 0x2000


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static closeStream(Ljava/io/Closeable;)V
    .locals 1
    .parameter "pStream"

    .prologue
    .line 115
    if-eqz p0, :cond_0

    .line 117
    :try_start_0
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 122
    :cond_0
    :goto_0
    return-void

    .line 118
    :catch_0
    move-exception v0

    .line 119
    .local v0, e:Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method

.method public static copy(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    .locals 2
    .parameter "in"
    .parameter "out"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 62
    const-wide/16 v0, -0x1

    invoke-static {p0, p1, v0, v1}, Lorg/anddev/andengine/util/StreamUtils;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;J)V

    .line 63
    return-void
.end method

.method public static copy(Ljava/io/InputStream;Ljava/io/OutputStream;J)V
    .locals 8
    .parameter "in"
    .parameter "out"
    .parameter "pByteLimit"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, -0x1

    const/4 v6, 0x0

    .line 88
    const/16 v4, 0x2000

    new-array v0, v4, [B

    .line 89
    .local v0, b:[B
    move-wide v1, p2

    .line 91
    .local v1, pBytesLeftToRead:J
    const-wide/16 v4, 0x0

    cmp-long v4, p2, v4

    if-gez v4, :cond_2

    .line 92
    :goto_0
    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I

    move-result v3

    .local v3, read:I
    if-ne v3, v7, :cond_0

    .line 106
    :goto_1
    invoke-virtual {p1}, Ljava/io/OutputStream;->flush()V

    .line 107
    return-void

    .line 93
    :cond_0
    invoke-virtual {p1, v0, v6, v3}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_0

    .line 97
    :cond_1
    int-to-long v4, v3

    cmp-long v4, v1, v4

    if-lez v4, :cond_3

    .line 98
    invoke-virtual {p1, v0, v6, v3}, Ljava/io/OutputStream;->write([BII)V

    .line 99
    int-to-long v4, v3

    sub-long/2addr v1, v4

    .line 96
    .end local v3           #read:I
    :cond_2
    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I

    move-result v3

    .restart local v3       #read:I
    if-ne v3, v7, :cond_1

    goto :goto_1

    .line 101
    :cond_3
    long-to-int v4, v1

    invoke-virtual {p1, v0, v6, v4}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_1
.end method

.method public static copyAndClose(Ljava/io/InputStream;Ljava/io/OutputStream;)Z
    .locals 3
    .parameter "in"
    .parameter "out"

    .prologue
    .line 67
    const-wide/16 v1, -0x1

    :try_start_0
    invoke-static {p0, p1, v1, v2}, Lorg/anddev/andengine/util/StreamUtils;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 72
    invoke-static {p0}, Lorg/anddev/andengine/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 73
    invoke-static {p1}, Lorg/anddev/andengine/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 68
    const/4 v1, 0x1

    .line 70
    :goto_0
    return v1

    .line 69
    :catch_0
    move-exception v0

    .line 72
    .local v0, e:Ljava/io/IOException;
    invoke-static {p0}, Lorg/anddev/andengine/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 73
    invoke-static {p1}, Lorg/anddev/andengine/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 70
    const/4 v1, 0x0

    goto :goto_0

    .line 71
    .end local v0           #e:Ljava/io/IOException;
    :catchall_0
    move-exception v1

    .line 72
    invoke-static {p0}, Lorg/anddev/andengine/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 73
    invoke-static {p1}, Lorg/anddev/andengine/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 74
    throw v1
.end method

.method public static flushCloseStream(Ljava/io/OutputStream;)V
    .locals 1
    .parameter "pStream"

    .prologue
    .line 130
    if-eqz p0, :cond_0

    .line 132
    :try_start_0
    invoke-virtual {p0}, Ljava/io/OutputStream;->flush()V

    .line 133
    invoke-static {p0}, Lorg/anddev/andengine/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 138
    :cond_0
    :goto_0
    return-void

    .line 134
    :catch_0
    move-exception v0

    .line 135
    .local v0, e:Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method

.method public static flushCloseWriter(Ljava/io/Writer;)V
    .locals 1
    .parameter "pWriter"

    .prologue
    .line 146
    if-eqz p0, :cond_0

    .line 148
    :try_start_0
    invoke-virtual {p0}, Ljava/io/Writer;->flush()V

    .line 149
    invoke-static {p0}, Lorg/anddev/andengine/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 154
    :cond_0
    :goto_0
    return-void

    .line 150
    :catch_0
    move-exception v0

    .line 151
    .local v0, e:Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method

.method public static final readFully(Ljava/io/InputStream;)Ljava/lang/String;
    .locals 3
    .parameter "in"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 43
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 44
    .local v0, sb:Ljava/lang/StringBuilder;
    new-instance v1, Ljava/util/Scanner;

    invoke-direct {v1, p0}, Ljava/util/Scanner;-><init>(Ljava/io/InputStream;)V

    .line 45
    .local v1, sc:Ljava/util/Scanner;
    :goto_0
    invoke-virtual {v1}, Ljava/util/Scanner;->hasNextLine()Z

    move-result v2

    if-nez v2, :cond_0

    .line 48
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 46
    :cond_0
    invoke-virtual {v1}, Ljava/util/Scanner;->nextLine()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0
.end method

.method public static streamToBytes(Ljava/io/InputStream;)[B
    .locals 1
    .parameter "in"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 52
    const/4 v0, -0x1

    invoke-static {p0, v0}, Lorg/anddev/andengine/util/StreamUtils;->streamToBytes(Ljava/io/InputStream;I)[B

    move-result-object v0

    return-object v0
.end method

.method public static streamToBytes(Ljava/io/InputStream;I)[B
    .locals 3
    .parameter "in"
    .parameter "pReadLimit"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 56
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    const/16 v1, 0x2000

    invoke-static {p1, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-direct {v0, v1}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 57
    .local v0, os:Ljava/io/ByteArrayOutputStream;
    int-to-long v1, p1

    invoke-static {p0, v0, v1, v2}, Lorg/anddev/andengine/util/StreamUtils;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;J)V

    .line 58
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    return-object v1
.end method
