package org.anddev.andengine.opengl.texture.source;

import java.io.*;
import android.graphics.*;

public class FileTextureSource implements ITextureSource
{
    private final File mFile;
    private final int mHeight;
    private final int mWidth;
    
    public FileTextureSource(final File p0) {
        // 
        // This method could not be decompiled.
        // 
        // Original Bytecode:
        // 
        //     0: aload_0        
        //     1: invokespecial   java/lang/Object.<init>:()V
        //     4: aload_0        
        //     5: aload_1        
        //     6: putfield        org/anddev/andengine/opengl/texture/source/FileTextureSource.mFile:Ljava/io/File;
        //     9: new             Landroid/graphics/BitmapFactory$Options;
        //    12: dup            
        //    13: invokespecial   android/graphics/BitmapFactory$Options.<init>:()V
        //    16: astore_2       
        //    17: aload_2        
        //    18: iconst_1       
        //    19: putfield        android/graphics/BitmapFactory$Options.inJustDecodeBounds:Z
        //    22: aconst_null    
        //    23: astore_3       
        //    24: new             Ljava/io/FileInputStream;
        //    27: dup            
        //    28: aload_1        
        //    29: invokespecial   java/io/FileInputStream.<init>:(Ljava/io/File;)V
        //    32: astore          4
        //    34: aload           4
        //    36: aconst_null    
        //    37: aload_2        
        //    38: invokestatic    android/graphics/BitmapFactory.decodeStream:(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
        //    41: pop            
        //    42: aload           4
        //    44: invokestatic    org/anddev/andengine/util/StreamUtils.closeStream:(Ljava/io/Closeable;)V
        //    47: aload_0        
        //    48: aload_2        
        //    49: getfield        android/graphics/BitmapFactory$Options.outWidth:I
        //    52: putfield        org/anddev/andengine/opengl/texture/source/FileTextureSource.mWidth:I
        //    55: aload_0        
        //    56: aload_2        
        //    57: getfield        android/graphics/BitmapFactory$Options.outHeight:I
        //    60: putfield        org/anddev/andengine/opengl/texture/source/FileTextureSource.mHeight:I
        //    63: return         
        //    64: astore          5
        //    66: new             Ljava/lang/StringBuilder;
        //    69: dup            
        //    70: ldc             "Failed loading Bitmap in FileTextureSource. File: "
        //    72: invokespecial   java/lang/StringBuilder.<init>:(Ljava/lang/String;)V
        //    75: aload_1        
        //    76: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/Object;)Ljava/lang/StringBuilder;
        //    79: invokevirtual   java/lang/StringBuilder.toString:()Ljava/lang/String;
        //    82: aload           5
        //    84: invokestatic    org/anddev/andengine/util/Debug.e:(Ljava/lang/String;Ljava/lang/Throwable;)V
        //    87: aload_3        
        //    88: invokestatic    org/anddev/andengine/util/StreamUtils.closeStream:(Ljava/io/Closeable;)V
        //    91: goto            47
        //    94: astore          6
        //    96: aload_3        
        //    97: invokestatic    org/anddev/andengine/util/StreamUtils.closeStream:(Ljava/io/Closeable;)V
        //   100: aload           6
        //   102: athrow         
        //   103: astore          6
        //   105: aload           4
        //   107: astore_3       
        //   108: goto            96
        //   111: astore          5
        //   113: aload           4
        //   115: astore_3       
        //   116: goto            66
        //    Exceptions:
        //  Try           Handler
        //  Start  End    Start  End    Type                 
        //  -----  -----  -----  -----  ---------------------
        //  24     34     64     66     Ljava/io/IOException;
        //  24     34     94     96     Any
        //  34     42     111    119    Ljava/io/IOException;
        //  34     42     103    111    Any
        //  66     87     94     96     Any
        // 
        // The error that occurred was:
        // 
        // java.lang.IllegalStateException: Expression is linked from several locations: Label_0047:
        //     at com.strobel.decompiler.ast.Error.expressionLinkedFromMultipleLocations(Error.java:27)
        //     at com.strobel.decompiler.ast.AstOptimizer.mergeDisparateObjectInitializations(AstOptimizer.java:2592)
        //     at com.strobel.decompiler.ast.AstOptimizer.optimize(AstOptimizer.java:235)
        //     at com.strobel.decompiler.ast.AstOptimizer.optimize(AstOptimizer.java:42)
        //     at com.strobel.decompiler.languages.java.ast.AstMethodBodyBuilder.createMethodBody(AstMethodBodyBuilder.java:214)
        //     at com.strobel.decompiler.languages.java.ast.AstMethodBodyBuilder.createMethodBody(AstMethodBodyBuilder.java:99)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createMethodBody(AstBuilder.java:756)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createConstructor(AstBuilder.java:691)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.addTypeMembers(AstBuilder.java:528)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createTypeCore(AstBuilder.java:498)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createTypeNoCache(AstBuilder.java:140)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createType(AstBuilder.java:129)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.addType(AstBuilder.java:104)
        //     at com.strobel.decompiler.languages.java.JavaLanguage.decompileType(JavaLanguage.java:59)
        //     at com.strobel.decompiler.DecompilerDriver.decompileType(DecompilerDriver.java:301)
        //     at com.strobel.decompiler.DecompilerDriver.decompileJar(DecompilerDriver.java:224)
        //     at com.strobel.decompiler.DecompilerDriver.main(DecompilerDriver.java:109)
        // 
        // 
        // This method could not be decompiled.
        // 
        // Original Bytecode:
        // 
        //     0: aload_0        
        //     1: invokespecial   java/lang/Object.<init>:()V
        //     4: aload_0        
        //     5: aload_1        
        //     6: putfield        org/anddev/andengine/opengl/texture/source/FileTextureSource.mFile:Ljava/io/File;
        //     9: new             Landroid/graphics/BitmapFactory$Options;
        //    12: dup            
        //    13: invokespecial   android/graphics/BitmapFactory$Options.<init>:()V
        //    16: astore_2       
        //    17: aload_2        
        //    18: iconst_1       
        //    19: putfield        android/graphics/BitmapFactory$Options.inJustDecodeBounds:Z
        //    22: aconst_null    
        //    23: astore_3       
        //    24: new             Ljava/io/FileInputStream;
        //    27: dup            
        //    28: aload_1        
        //    29: invokespecial   java/io/FileInputStream.<init>:(Ljava/io/File;)V
        //    32: astore          4
        //    34: aload           4
        //    36: aconst_null    
        //    37: aload_2        
        //    38: invokestatic    android/graphics/BitmapFactory.decodeStream:(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
        //    41: pop            
        //    42: aload           4
        //    44: invokestatic    org/anddev/andengine/util/StreamUtils.closeStream:(Ljava/io/Closeable;)V
        //    47: aload_0        
        //    48: aload_2        
        //    49: getfield        android/graphics/BitmapFactory$Options.outWidth:I
        //    52: putfield        org/anddev/andengine/opengl/texture/source/FileTextureSource.mWidth:I
        //    55: aload_0        
        //    56: aload_2        
        //    57: getfield        android/graphics/BitmapFactory$Options.outHeight:I
        //    60: putfield        org/anddev/andengine/opengl/texture/source/FileTextureSource.mHeight:I
        //    63: return         
        //    64: astore          5
        //    66: new             Ljava/lang/StringBuilder;
        //    69: dup            
        //    70: ldc             "Failed loading Bitmap in FileTextureSource. File: "
        //    72: invokespecial   java/lang/StringBuilder.<init>:(Ljava/lang/String;)V
        //    75: aload_1        
        //    76: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/Object;)Ljava/lang/StringBuilder;
        //    79: invokevirtual   java/lang/StringBuilder.toString:()Ljava/lang/String;
        //    82: aload           5
        //    84: invokestatic    org/anddev/andengine/util/Debug.e:(Ljava/lang/String;Ljava/lang/Throwable;)V
        //    87: aload_3        
        //    88: invokestatic    org/anddev/andengine/util/StreamUtils.closeStream:(Ljava/io/Closeable;)V
        //    91: goto            47
        //    94: astore          6
        //    96: aload_3        
        //    97: invokestatic    org/anddev/andengine/util/StreamUtils.closeStream:(Ljava/io/Closeable;)V
        //   100: aload           6
        //   102: athrow         
        //   103: astore          6
        //   105: aload           4
        //   107: astore_3       
        //   108: goto            96
        //   111: astore          5
        //   113: aload           4
        //   115: astore_3       
        //   116: goto            66
        //    Exceptions:
        //  Try           Handler
        //  Start  End    Start  End    Type                 
        //  -----  -----  -----  -----  ---------------------
        //  24     34     64     66     Ljava/io/IOException;
        //  24     34     94     96     Any
        //  34     42     111    119    Ljava/io/IOException;
        //  34     42     103    111    Any
        //  66     87     94     96     Any
        // 
        // The error that occurred was:
        // 
        // java.lang.IllegalStateException: Expression is linked from several locations: Label_0047:
        //     at com.strobel.decompiler.ast.Error.expressionLinkedFromMultipleLocations(Error.java:27)
        //     at com.strobel.decompiler.ast.AstOptimizer.mergeDisparateObjectInitializations(AstOptimizer.java:2592)
        //     at com.strobel.decompiler.ast.AstOptimizer.optimize(AstOptimizer.java:235)
        //     at com.strobel.decompiler.ast.AstOptimizer.optimize(AstOptimizer.java:42)
        //     at com.strobel.decompiler.languages.java.ast.AstMethodBodyBuilder.createMethodBody(AstMethodBodyBuilder.java:214)
        //     at com.strobel.decompiler.languages.java.ast.AstMethodBodyBuilder.createMethodBody(AstMethodBodyBuilder.java:99)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createMethodBody(AstBuilder.java:756)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createConstructor(AstBuilder.java:691)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.addTypeMembers(AstBuilder.java:528)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createTypeCore(AstBuilder.java:498)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createTypeNoCache(AstBuilder.java:140)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createType(AstBuilder.java:129)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.addType(AstBuilder.java:104)
        //     at com.strobel.decompiler.languages.java.JavaLanguage.decompileType(JavaLanguage.java:59)
        //     at com.strobel.decompiler.DecompilerDriver.decompileType(DecompilerDriver.java:301)
        //     at com.strobel.decompiler.DecompilerDriver.decompileJar(DecompilerDriver.java:224)
        //     at com.strobel.decompiler.DecompilerDriver.main(DecompilerDriver.java:109)
        // 
        throw new IllegalStateException("An error occurred while decompiling this method.");
    }
    
    FileTextureSource(final File mFile, final int mWidth, final int mHeight) {
        super();
        this.mFile = mFile;
        this.mWidth = mWidth;
        this.mHeight = mHeight;
    }
    
    @Override
    public FileTextureSource clone() {
        return new FileTextureSource(this.mFile, this.mWidth, this.mHeight);
    }
    
    @Override
    public int getHeight() {
        return this.mHeight;
    }
    
    @Override
    public int getWidth() {
        return this.mWidth;
    }
    
    @Override
    public Bitmap onLoadBitmap() {
        // 
        // This method could not be decompiled.
        // 
        // Original Bytecode:
        // 
        //     0: new             Landroid/graphics/BitmapFactory$Options;
        //     3: dup            
        //     4: invokespecial   android/graphics/BitmapFactory$Options.<init>:()V
        //     7: astore_1       
        //     8: aload_1        
        //     9: getstatic       android/graphics/Bitmap$Config.ARGB_8888:Landroid/graphics/Bitmap$Config;
        //    12: putfield        android/graphics/BitmapFactory$Options.inPreferredConfig:Landroid/graphics/Bitmap$Config;
        //    15: aconst_null    
        //    16: astore_2       
        //    17: new             Ljava/io/FileInputStream;
        //    20: dup            
        //    21: aload_0        
        //    22: getfield        org/anddev/andengine/opengl/texture/source/FileTextureSource.mFile:Ljava/io/File;
        //    25: invokespecial   java/io/FileInputStream.<init>:(Ljava/io/File;)V
        //    28: astore_3       
        //    29: aload_3        
        //    30: aconst_null    
        //    31: aload_1        
        //    32: invokestatic    android/graphics/BitmapFactory.decodeStream:(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
        //    35: astore          6
        //    37: aload_3        
        //    38: invokestatic    org/anddev/andengine/util/StreamUtils.closeStream:(Ljava/io/Closeable;)V
        //    41: aload           6
        //    43: areturn        
        //    44: astore          4
        //    46: new             Ljava/lang/StringBuilder;
        //    49: dup            
        //    50: ldc             "Failed loading Bitmap in FileTextureSource. File: "
        //    52: invokespecial   java/lang/StringBuilder.<init>:(Ljava/lang/String;)V
        //    55: aload_0        
        //    56: getfield        org/anddev/andengine/opengl/texture/source/FileTextureSource.mFile:Ljava/io/File;
        //    59: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/Object;)Ljava/lang/StringBuilder;
        //    62: invokevirtual   java/lang/StringBuilder.toString:()Ljava/lang/String;
        //    65: aload           4
        //    67: invokestatic    org/anddev/andengine/util/Debug.e:(Ljava/lang/String;Ljava/lang/Throwable;)V
        //    70: aload_2        
        //    71: invokestatic    org/anddev/andengine/util/StreamUtils.closeStream:(Ljava/io/Closeable;)V
        //    74: aconst_null    
        //    75: areturn        
        //    76: astore          5
        //    78: aload_2        
        //    79: invokestatic    org/anddev/andengine/util/StreamUtils.closeStream:(Ljava/io/Closeable;)V
        //    82: aload           5
        //    84: athrow         
        //    85: astore          5
        //    87: aload_3        
        //    88: astore_2       
        //    89: goto            78
        //    92: astore          4
        //    94: aload_3        
        //    95: astore_2       
        //    96: goto            46
        //    Exceptions:
        //  Try           Handler
        //  Start  End    Start  End    Type                 
        //  -----  -----  -----  -----  ---------------------
        //  17     29     44     46     Ljava/io/IOException;
        //  17     29     76     78     Any
        //  29     37     92     99     Ljava/io/IOException;
        //  29     37     85     92     Any
        //  46     70     76     78     Any
        // 
        // The error that occurred was:
        // 
        // java.lang.IllegalStateException: Expression is linked from several locations: Label_0046:
        //     at com.strobel.decompiler.ast.Error.expressionLinkedFromMultipleLocations(Error.java:27)
        //     at com.strobel.decompiler.ast.AstOptimizer.mergeDisparateObjectInitializations(AstOptimizer.java:2592)
        //     at com.strobel.decompiler.ast.AstOptimizer.optimize(AstOptimizer.java:235)
        //     at com.strobel.decompiler.ast.AstOptimizer.optimize(AstOptimizer.java:42)
        //     at com.strobel.decompiler.languages.java.ast.AstMethodBodyBuilder.createMethodBody(AstMethodBodyBuilder.java:214)
        //     at com.strobel.decompiler.languages.java.ast.AstMethodBodyBuilder.createMethodBody(AstMethodBodyBuilder.java:99)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createMethodBody(AstBuilder.java:756)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createMethod(AstBuilder.java:654)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.addTypeMembers(AstBuilder.java:531)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createTypeCore(AstBuilder.java:498)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createTypeNoCache(AstBuilder.java:140)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createType(AstBuilder.java:129)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.addType(AstBuilder.java:104)
        //     at com.strobel.decompiler.languages.java.JavaLanguage.decompileType(JavaLanguage.java:59)
        //     at com.strobel.decompiler.DecompilerDriver.decompileType(DecompilerDriver.java:301)
        //     at com.strobel.decompiler.DecompilerDriver.decompileJar(DecompilerDriver.java:224)
        //     at com.strobel.decompiler.DecompilerDriver.main(DecompilerDriver.java:109)
        // 
        // 
        // This method could not be decompiled.
        // 
        // Original Bytecode:
        // 
        //     0: new             Landroid/graphics/BitmapFactory$Options;
        //     3: dup            
        //     4: invokespecial   android/graphics/BitmapFactory$Options.<init>:()V
        //     7: astore_1       
        //     8: aload_1        
        //     9: getstatic       android/graphics/Bitmap$Config.ARGB_8888:Landroid/graphics/Bitmap$Config;
        //    12: putfield        android/graphics/BitmapFactory$Options.inPreferredConfig:Landroid/graphics/Bitmap$Config;
        //    15: aconst_null    
        //    16: astore_2       
        //    17: new             Ljava/io/FileInputStream;
        //    20: dup            
        //    21: aload_0        
        //    22: getfield        org/anddev/andengine/opengl/texture/source/FileTextureSource.mFile:Ljava/io/File;
        //    25: invokespecial   java/io/FileInputStream.<init>:(Ljava/io/File;)V
        //    28: astore_3       
        //    29: aload_3        
        //    30: aconst_null    
        //    31: aload_1        
        //    32: invokestatic    android/graphics/BitmapFactory.decodeStream:(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
        //    35: astore          6
        //    37: aload_3        
        //    38: invokestatic    org/anddev/andengine/util/StreamUtils.closeStream:(Ljava/io/Closeable;)V
        //    41: aload           6
        //    43: areturn        
        //    44: astore          4
        //    46: new             Ljava/lang/StringBuilder;
        //    49: dup            
        //    50: ldc             "Failed loading Bitmap in FileTextureSource. File: "
        //    52: invokespecial   java/lang/StringBuilder.<init>:(Ljava/lang/String;)V
        //    55: aload_0        
        //    56: getfield        org/anddev/andengine/opengl/texture/source/FileTextureSource.mFile:Ljava/io/File;
        //    59: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/Object;)Ljava/lang/StringBuilder;
        //    62: invokevirtual   java/lang/StringBuilder.toString:()Ljava/lang/String;
        //    65: aload           4
        //    67: invokestatic    org/anddev/andengine/util/Debug.e:(Ljava/lang/String;Ljava/lang/Throwable;)V
        //    70: aload_2        
        //    71: invokestatic    org/anddev/andengine/util/StreamUtils.closeStream:(Ljava/io/Closeable;)V
        //    74: aconst_null    
        //    75: areturn        
        //    76: astore          5
        //    78: aload_2        
        //    79: invokestatic    org/anddev/andengine/util/StreamUtils.closeStream:(Ljava/io/Closeable;)V
        //    82: aload           5
        //    84: athrow         
        //    85: astore          5
        //    87: aload_3        
        //    88: astore_2       
        //    89: goto            78
        //    92: astore          4
        //    94: aload_3        
        //    95: astore_2       
        //    96: goto            46
        //    Exceptions:
        //  Try           Handler
        //  Start  End    Start  End    Type                 
        //  -----  -----  -----  -----  ---------------------
        //  17     29     44     46     Ljava/io/IOException;
        //  17     29     76     78     Any
        //  29     37     92     99     Ljava/io/IOException;
        //  29     37     85     92     Any
        //  46     70     76     78     Any
        // 
        // The error that occurred was:
        // 
        // java.lang.IllegalStateException: Expression is linked from several locations: Label_0046:
        //     at com.strobel.decompiler.ast.Error.expressionLinkedFromMultipleLocations(Error.java:27)
        //     at com.strobel.decompiler.ast.AstOptimizer.mergeDisparateObjectInitializations(AstOptimizer.java:2592)
        //     at com.strobel.decompiler.ast.AstOptimizer.optimize(AstOptimizer.java:235)
        //     at com.strobel.decompiler.ast.AstOptimizer.optimize(AstOptimizer.java:42)
        //     at com.strobel.decompiler.languages.java.ast.AstMethodBodyBuilder.createMethodBody(AstMethodBodyBuilder.java:214)
        //     at com.strobel.decompiler.languages.java.ast.AstMethodBodyBuilder.createMethodBody(AstMethodBodyBuilder.java:99)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createMethodBody(AstBuilder.java:756)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createMethod(AstBuilder.java:654)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.addTypeMembers(AstBuilder.java:531)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createTypeCore(AstBuilder.java:498)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createTypeNoCache(AstBuilder.java:140)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createType(AstBuilder.java:129)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.addType(AstBuilder.java:104)
        //     at com.strobel.decompiler.languages.java.JavaLanguage.decompileType(JavaLanguage.java:59)
        //     at com.strobel.decompiler.DecompilerDriver.decompileType(DecompilerDriver.java:301)
        //     at com.strobel.decompiler.DecompilerDriver.decompileJar(DecompilerDriver.java:224)
        //     at com.strobel.decompiler.DecompilerDriver.main(DecompilerDriver.java:109)
        // 
        throw new IllegalStateException("An error occurred while decompiling this method.");
    }
    
    @Override
    public String toString() {
        return String.valueOf(this.getClass().getSimpleName()) + "(" + this.mFile + ")";
    }
}
