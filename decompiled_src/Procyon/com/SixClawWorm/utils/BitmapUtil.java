package com.SixClawWorm.utils;

import android.content.*;
import android.os.*;
import android.graphics.*;
import java.io.*;

public class BitmapUtil
{
    public static final String DIR = "/sdcard/hypers";
    private static int FREE_SD_SPACE_NEEDED_TO_CACHE;
    private static int MB;
    
    static {
        BitmapUtil.FREE_SD_SPACE_NEEDED_TO_CACHE = 1;
        BitmapUtil.MB = 1048576;
    }
    
    public static boolean Exist(final String s) {
        return new File("/sdcard/hypers" + s).exists();
    }
    
    public static Bitmap GetBitmap(final String p0, final int p1) {
        // 
        // This method could not be decompiled.
        // 
        // Original Bytecode:
        // 
        //     0: aload_0        
        //     1: ifnonnull       6
        //     4: aconst_null    
        //     5: areturn        
        //     6: aload_0        
        //     7: invokestatic    java/net/URLEncoder.encode:(Ljava/lang/String;)Ljava/lang/String;
        //    10: astore_2       
        //    11: new             Ljava/lang/StringBuilder;
        //    14: dup            
        //    15: ldc             "/sdcard/hypers/"
        //    17: invokespecial   java/lang/StringBuilder.<init>:(Ljava/lang/String;)V
        //    20: aload_2        
        //    21: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
        //    24: invokevirtual   java/lang/StringBuilder.toString:()Ljava/lang/String;
        //    27: invokestatic    com/SixClawWorm/utils/BitmapUtil.Exist:(Ljava/lang/String;)Z
        //    30: ifeq            57
        //    33: new             Ljava/lang/StringBuilder;
        //    36: dup            
        //    37: ldc             "/sdcard/hypers/"
        //    39: invokespecial   java/lang/StringBuilder.<init>:(Ljava/lang/String;)V
        //    42: aload_2        
        //    43: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
        //    46: invokevirtual   java/lang/StringBuilder.toString:()Ljava/lang/String;
        //    49: invokestatic    android/graphics/BitmapFactory.decodeFile:(Ljava/lang/String;)Landroid/graphics/Bitmap;
        //    52: astore          6
        //    54: aload           6
        //    56: areturn        
        //    57: new             Ljava/net/URL;
        //    60: dup            
        //    61: aload_0        
        //    62: invokespecial   java/net/URL.<init>:(Ljava/lang/String;)V
        //    65: astore_3       
        //    66: aload_3        
        //    67: invokevirtual   java/net/URL.openStream:()Ljava/io/InputStream;
        //    70: astore          5
        //    72: aload           5
        //    74: invokestatic    android/graphics/BitmapFactory.decodeStream:(Ljava/io/InputStream;)Landroid/graphics/Bitmap;
        //    77: astore          6
        //    79: aload           6
        //    81: ifnull          91
        //    84: aload           6
        //    86: aload_2        
        //    87: iload_1        
        //    88: invokestatic    com/SixClawWorm/utils/BitmapUtil.saveBmpToSd:(Landroid/graphics/Bitmap;Ljava/lang/String;I)V
        //    91: aload           5
        //    93: invokevirtual   java/io/InputStream.close:()V
        //    96: goto            54
        //    99: astore          4
        //   101: aload           4
        //   103: invokevirtual   java/lang/Exception.printStackTrace:()V
        //   106: aconst_null    
        //   107: areturn        
        //   108: astore          4
        //   110: goto            101
        //    Exceptions:
        //  Try           Handler
        //  Start  End    Start  End    Type                 
        //  -----  -----  -----  -----  ---------------------
        //  57     66     99     101    Ljava/lang/Exception;
        //  66     79     108    113    Ljava/lang/Exception;
        //  84     91     108    113    Ljava/lang/Exception;
        //  91     96     108    113    Ljava/lang/Exception;
        // 
        // The error that occurred was:
        // 
        // java.lang.IllegalStateException: Expression is linked from several locations: Label_0091:
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
        //     0: aload_0        
        //     1: ifnonnull       6
        //     4: aconst_null    
        //     5: areturn        
        //     6: aload_0        
        //     7: invokestatic    java/net/URLEncoder.encode:(Ljava/lang/String;)Ljava/lang/String;
        //    10: astore_2       
        //    11: new             Ljava/lang/StringBuilder;
        //    14: dup            
        //    15: ldc             "/sdcard/hypers/"
        //    17: invokespecial   java/lang/StringBuilder.<init>:(Ljava/lang/String;)V
        //    20: aload_2        
        //    21: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
        //    24: invokevirtual   java/lang/StringBuilder.toString:()Ljava/lang/String;
        //    27: invokestatic    com/SixClawWorm/utils/BitmapUtil.Exist:(Ljava/lang/String;)Z
        //    30: ifeq            57
        //    33: new             Ljava/lang/StringBuilder;
        //    36: dup            
        //    37: ldc             "/sdcard/hypers/"
        //    39: invokespecial   java/lang/StringBuilder.<init>:(Ljava/lang/String;)V
        //    42: aload_2        
        //    43: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
        //    46: invokevirtual   java/lang/StringBuilder.toString:()Ljava/lang/String;
        //    49: invokestatic    android/graphics/BitmapFactory.decodeFile:(Ljava/lang/String;)Landroid/graphics/Bitmap;
        //    52: astore          6
        //    54: aload           6
        //    56: areturn        
        //    57: new             Ljava/net/URL;
        //    60: dup            
        //    61: aload_0        
        //    62: invokespecial   java/net/URL.<init>:(Ljava/lang/String;)V
        //    65: astore_3       
        //    66: aload_3        
        //    67: invokevirtual   java/net/URL.openStream:()Ljava/io/InputStream;
        //    70: astore          5
        //    72: aload           5
        //    74: invokestatic    android/graphics/BitmapFactory.decodeStream:(Ljava/io/InputStream;)Landroid/graphics/Bitmap;
        //    77: astore          6
        //    79: aload           6
        //    81: ifnull          91
        //    84: aload           6
        //    86: aload_2        
        //    87: iload_1        
        //    88: invokestatic    com/SixClawWorm/utils/BitmapUtil.saveBmpToSd:(Landroid/graphics/Bitmap;Ljava/lang/String;I)V
        //    91: aload           5
        //    93: invokevirtual   java/io/InputStream.close:()V
        //    96: goto            54
        //    99: astore          4
        //   101: aload           4
        //   103: invokevirtual   java/lang/Exception.printStackTrace:()V
        //   106: aconst_null    
        //   107: areturn        
        //   108: astore          4
        //   110: goto            101
        //    Exceptions:
        //  Try           Handler
        //  Start  End    Start  End    Type                 
        //  -----  -----  -----  -----  ---------------------
        //  57     66     99     101    Ljava/lang/Exception;
        //  66     79     108    113    Ljava/lang/Exception;
        //  84     91     108    113    Ljava/lang/Exception;
        //  91     96     108    113    Ljava/lang/Exception;
        // 
        // The error that occurred was:
        // 
        // java.lang.IllegalStateException: Expression is linked from several locations: Label_0091:
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
    
    public static Bitmap ReadBitmapById(final Context context, final int n) {
        final BitmapFactory$Options bitmapFactory$Options = new BitmapFactory$Options();
        bitmapFactory$Options.inPreferredConfig = Bitmap$Config.RGB_565;
        bitmapFactory$Options.inPurgeable = true;
        bitmapFactory$Options.inInputShareable = true;
        return BitmapFactory.decodeStream(context.getResources().openRawResource(n), (Rect)null, bitmapFactory$Options);
    }
    
    public static Bitmap ReadBitmapById(final Context context, final int n, final int n2, final int n3) {
        final BitmapFactory$Options bitmapFactory$Options = new BitmapFactory$Options();
        bitmapFactory$Options.inPreferredConfig = Bitmap$Config.ARGB_8888;
        bitmapFactory$Options.inInputShareable = true;
        bitmapFactory$Options.inPurgeable = true;
        return getBitmap(BitmapFactory.decodeStream(context.getResources().openRawResource(n), (Rect)null, bitmapFactory$Options), n2, n3);
    }
    
    private static int freeSpaceOnSd() {
        final StatFs statFs = new StatFs(Environment.getExternalStorageDirectory().getPath());
        return statFs.getAvailableBlocks() * statFs.getBlockSize() / BitmapUtil.MB;
    }
    
    public static Bitmap getBitmap(final Bitmap bitmap, final int n, final int n2) {
        final int width = bitmap.getWidth();
        final int height = bitmap.getHeight();
        final Matrix matrix = new Matrix();
        final float n3 = n / width;
        final float n4 = n2 / height;
        matrix.postScale(n3, n3);
        return Bitmap.createBitmap(bitmap, 0, 0, width, height, matrix, true);
    }
    
    public static void saveBmpToSd(final Bitmap bitmap, final String s, final int n) {
        if (BitmapUtil.FREE_SD_SPACE_NEEDED_TO_CACHE > freeSpaceOnSd() || !"mounted".equals(Environment.getExternalStorageState())) {
            return;
        }
        final File file = new File("/sdcard/hypers");
        if (!file.exists()) {
            file.mkdirs();
        }
        final File file2 = new File("/sdcard/hypers/" + s);
        try {
            file2.createNewFile();
            final FileOutputStream fileOutputStream = new FileOutputStream(file2);
            bitmap.compress(Bitmap$CompressFormat.PNG, n, (OutputStream)fileOutputStream);
            fileOutputStream.flush();
            fileOutputStream.close();
        }
        catch (FileNotFoundException ex2) {}
        catch (IOException ex) {
            ex.printStackTrace();
        }
    }
}
