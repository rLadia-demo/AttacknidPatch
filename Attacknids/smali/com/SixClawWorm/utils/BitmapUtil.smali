.class public Lcom/SixClawWorm/utils/BitmapUtil;
.super Ljava/lang/Object;
.source "BitmapUtil.java"


# static fields
.field public static final DIR:Ljava/lang/String; = "/sdcard/hypers"

.field private static FREE_SD_SPACE_NEEDED_TO_CACHE:I

.field private static MB:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 89
    const/4 v0, 0x1

    sput v0, Lcom/SixClawWorm/utils/BitmapUtil;->FREE_SD_SPACE_NEEDED_TO_CACHE:I

    .line 90
    const/high16 v0, 0x10

    sput v0, Lcom/SixClawWorm/utils/BitmapUtil;->MB:I

    .line 91
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static Exist(Ljava/lang/String;)Z
    .locals 3
    .parameter "url"

    .prologue
    .line 172
    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "/sdcard/hypers"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 173
    .local v0, file:Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    return v1
.end method

.method public static GetBitmap(Ljava/lang/String;I)Landroid/graphics/Bitmap;
    .locals 10
    .parameter "url"
    .parameter "quantity"

    .prologue
    const/4 v7, 0x0

    .line 132
    const/4 v3, 0x0

    .line 133
    .local v3, inputStream:Ljava/io/InputStream;
    const-string v2, ""

    .line 134
    .local v2, filename:Ljava/lang/String;
    const/4 v4, 0x0

    .line 135
    .local v4, map:Landroid/graphics/Bitmap;
    const/4 v5, 0x0

    .line 136
    .local v5, url_Image:Ljava/net/URL;
    const-string v0, ""

    .line 137
    .local v0, LOCALURL:Ljava/lang/String;
    if-nez p0, :cond_0

    .line 162
    :goto_0
    return-object v7

    .line 140
    :cond_0
    move-object v2, p0

    .line 144
    invoke-static {v2}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 145
    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "/sdcard/hypers/"

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/SixClawWorm/utils/BitmapUtil;->Exist(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 146
    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "/sdcard/hypers/"

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v4

    :goto_1
    move-object v7, v4

    .line 162
    goto :goto_0

    .line 149
    :cond_1
    :try_start_0
    new-instance v6, Ljava/net/URL;

    invoke-direct {v6, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 150
    .end local v5           #url_Image:Ljava/net/URL;
    .local v6, url_Image:Ljava/net/URL;
    :try_start_1
    invoke-virtual {v6}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v3

    .line 151
    invoke-static {v3}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v4

    .line 153
    if-eqz v4, :cond_2

    .line 154
    invoke-static {v4, v0, p1}, Lcom/SixClawWorm/utils/BitmapUtil;->saveBmpToSd(Landroid/graphics/Bitmap;Ljava/lang/String;I)V

    .line 156
    :cond_2
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-object v5, v6

    .line 157
    .end local v6           #url_Image:Ljava/net/URL;
    .restart local v5       #url_Image:Ljava/net/URL;
    goto :goto_1

    :catch_0
    move-exception v1

    .line 158
    .local v1, e:Ljava/lang/Exception;
    :goto_2
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 157
    .end local v1           #e:Ljava/lang/Exception;
    .end local v5           #url_Image:Ljava/net/URL;
    .restart local v6       #url_Image:Ljava/net/URL;
    :catch_1
    move-exception v1

    move-object v5, v6

    .end local v6           #url_Image:Ljava/net/URL;
    .restart local v5       #url_Image:Ljava/net/URL;
    goto :goto_2
.end method

.method public static ReadBitmapById(Landroid/content/Context;I)Landroid/graphics/Bitmap;
    .locals 4
    .parameter "context"
    .parameter "resId"

    .prologue
    const/4 v3, 0x1

    .line 30
    new-instance v1, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v1}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 31
    .local v1, opt:Landroid/graphics/BitmapFactory$Options;
    sget-object v2, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    iput-object v2, v1, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    .line 32
    iput-boolean v3, v1, Landroid/graphics/BitmapFactory$Options;->inPurgeable:Z

    .line 33
    iput-boolean v3, v1, Landroid/graphics/BitmapFactory$Options;->inInputShareable:Z

    .line 35
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, p1}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v0

    .line 36
    .local v0, is:Ljava/io/InputStream;
    const/4 v2, 0x0

    invoke-static {v0, v2, v1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v2

    return-object v2
.end method

.method public static ReadBitmapById(Landroid/content/Context;III)Landroid/graphics/Bitmap;
    .locals 5
    .parameter "context"
    .parameter "drawableId"
    .parameter "screenWidth"
    .parameter "screenHight"

    .prologue
    const/4 v4, 0x1

    .line 48
    new-instance v1, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v1}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 49
    .local v1, options:Landroid/graphics/BitmapFactory$Options;
    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    iput-object v3, v1, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    .line 50
    iput-boolean v4, v1, Landroid/graphics/BitmapFactory$Options;->inInputShareable:Z

    .line 51
    iput-boolean v4, v1, Landroid/graphics/BitmapFactory$Options;->inPurgeable:Z

    .line 52
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, p1}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v2

    .line 53
    .local v2, stream:Ljava/io/InputStream;
    const/4 v3, 0x0

    invoke-static {v2, v3, v1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 54
    .local v0, bitmap:Landroid/graphics/Bitmap;
    invoke-static {v0, p2, p3}, Lcom/SixClawWorm/utils/BitmapUtil;->getBitmap(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;

    move-result-object v3

    return-object v3
.end method

.method private static freeSpaceOnSd()I
    .locals 7

    .prologue
    .line 178
    new-instance v2, Landroid/os/StatFs;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v3

    .line 179
    invoke-virtual {v3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v3

    .line 178
    invoke-direct {v2, v3}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 180
    .local v2, stat:Landroid/os/StatFs;
    invoke-virtual {v2}, Landroid/os/StatFs;->getAvailableBlocks()I

    move-result v3

    int-to-double v3, v3

    .line 181
    invoke-virtual {v2}, Landroid/os/StatFs;->getBlockSize()I

    move-result v5

    int-to-double v5, v5

    .line 180
    mul-double/2addr v3, v5

    .line 181
    sget v5, Lcom/SixClawWorm/utils/BitmapUtil;->MB:I

    int-to-double v5, v5

    .line 180
    div-double v0, v3, v5

    .line 183
    .local v0, sdFreeMB:D
    double-to-int v3, v0

    return v3
.end method

.method public static getBitmap(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    .locals 9
    .parameter "bitmap"
    .parameter "screenWidth"
    .parameter "screenHight"

    .prologue
    const/4 v1, 0x0

    .line 67
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    .line 68
    .local v3, w:I
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    .line 70
    .local v4, h:I
    new-instance v5, Landroid/graphics/Matrix;

    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    .line 71
    .local v5, matrix:Landroid/graphics/Matrix;
    int-to-float v0, p1

    int-to-float v2, v3

    div-float v7, v0, v2

    .line 72
    .local v7, scale:F
    int-to-float v0, p2

    int-to-float v2, v4

    div-float v8, v0, v2

    .line 77
    .local v8, scale2:F
    invoke-virtual {v5, v7, v7}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 79
    const/4 v6, 0x1

    move-object v0, p0

    move v2, v1

    invoke-static/range {v0 .. v6}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public static saveBmpToSd(Landroid/graphics/Bitmap;Ljava/lang/String;I)V
    .locals 7
    .parameter "bm"
    .parameter "url"
    .parameter "quantity"

    .prologue
    .line 95
    sget v5, Lcom/SixClawWorm/utils/BitmapUtil;->FREE_SD_SPACE_NEEDED_TO_CACHE:I

    invoke-static {}, Lcom/SixClawWorm/utils/BitmapUtil;->freeSpaceOnSd()I

    move-result v6

    if-le v5, v6, :cond_1

    .line 122
    :cond_0
    :goto_0
    return-void

    .line 98
    :cond_1
    const-string v5, "mounted"

    .line 99
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v6

    .line 98
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    .line 99
    if-eqz v5, :cond_0

    .line 101
    move-object v3, p1

    .line 103
    .local v3, filename:Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    const-string v5, "/sdcard/hypers"

    invoke-direct {v0, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 104
    .local v0, dirPath:Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_2

    .line 105
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 108
    :cond_2
    new-instance v2, Ljava/io/File;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "/sdcard/hypers/"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 110
    .local v2, file:Ljava/io/File;
    :try_start_0
    invoke-virtual {v2}, Ljava/io/File;->createNewFile()Z

    .line 111
    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 112
    .local v4, outStream:Ljava/io/OutputStream;
    sget-object v5, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    invoke-virtual {p0, v5, p2, v4}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 113
    invoke-virtual {v4}, Ljava/io/OutputStream;->flush()V

    .line 114
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 116
    .end local v4           #outStream:Ljava/io/OutputStream;
    :catch_0
    move-exception v5

    goto :goto_0

    .line 118
    :catch_1
    move-exception v1

    .line 119
    .local v1, e:Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method
