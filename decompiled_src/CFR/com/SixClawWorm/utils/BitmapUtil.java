/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.content.Context
 *  android.content.res.Resources
 *  android.graphics.Bitmap
 *  android.graphics.Bitmap$CompressFormat
 *  android.graphics.Bitmap$Config
 *  android.graphics.BitmapFactory
 *  android.graphics.BitmapFactory$Options
 *  android.graphics.Matrix
 *  android.graphics.Rect
 *  android.os.Environment
 *  android.os.StatFs
 */
package com.SixClawWorm.utils;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Matrix;
import android.graphics.Rect;
import android.os.Environment;
import android.os.StatFs;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLEncoder;

public class BitmapUtil {
    public static final String DIR = "/sdcard/hypers";
    private static int FREE_SD_SPACE_NEEDED_TO_CACHE = 1;
    private static int MB = 1048576;

    public static boolean Exist(String string) {
        return new File("/sdcard/hypers" + string).exists();
    }

    /*
     * Unable to fully structure code
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     */
    public static Bitmap GetBitmap(String var0, int var1_1) {
        if (var0 == null) {
            return null;
        }
        if (BitmapUtil.Exist("/sdcard/hypers/" + (var2_2 = URLEncoder.encode(var0)))) {
            return BitmapFactory.decodeFile((String)("/sdcard/hypers/" + var2_2));
        }
        var3_4 = new URL(var0);
        try {
            var5_5 = var3_4.openStream();
            var6_3 = BitmapFactory.decodeStream((InputStream)var5_5);
            if (var6_3 != null) {
                BitmapUtil.saveBmpToSd(var6_3, var2_2, var1_1);
            }
            var5_5.close();
        }
        catch (Exception var4_6) {}
        return var6_3;
        catch (Exception var4_6) {}
        ** GOTO lbl-1000
lbl-1000: // 2 sources:
        {
            var4_6.printStackTrace();
            return null;
        }
    }

    public static Bitmap ReadBitmapById(Context context, int n) {
        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inPreferredConfig = Bitmap.Config.RGB_565;
        options.inPurgeable = true;
        options.inInputShareable = true;
        return BitmapFactory.decodeStream((InputStream)context.getResources().openRawResource(n), (Rect)null, (BitmapFactory.Options)options);
    }

    public static Bitmap ReadBitmapById(Context context, int n, int n2, int n3) {
        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inPreferredConfig = Bitmap.Config.ARGB_8888;
        options.inInputShareable = true;
        options.inPurgeable = true;
        return BitmapUtil.getBitmap(BitmapFactory.decodeStream((InputStream)context.getResources().openRawResource(n), (Rect)null, (BitmapFactory.Options)options), n2, n3);
    }

    private static int freeSpaceOnSd() {
        StatFs statFs = new StatFs(Environment.getExternalStorageDirectory().getPath());
        return (int)((double)statFs.getAvailableBlocks() * (double)statFs.getBlockSize() / (double)BitmapUtil.MB);
    }

    public static Bitmap getBitmap(Bitmap bitmap, int n, int n2) {
        int n3 = bitmap.getWidth();
        int n4 = bitmap.getHeight();
        Matrix matrix = new Matrix();
        float f = (float)n / (float)n3;
        (float)n2 / (float)n4;
        matrix.postScale(f, f);
        return Bitmap.createBitmap((Bitmap)bitmap, (int)0, (int)0, (int)n3, (int)n4, (Matrix)matrix, (boolean)true);
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     */
    public static void saveBmpToSd(Bitmap bitmap, String string, int n) {
        if (BitmapUtil.FREE_SD_SPACE_NEEDED_TO_CACHE > BitmapUtil.freeSpaceOnSd()) {
            return;
        }
        if (!"mounted".equals(Environment.getExternalStorageState())) return;
        File file = new File("/sdcard/hypers");
        if (!file.exists()) {
            file.mkdirs();
        }
        File file2 = new File("/sdcard/hypers/" + string);
        try {
            file2.createNewFile();
            FileOutputStream fileOutputStream = new FileOutputStream(file2);
            bitmap.compress(Bitmap.CompressFormat.PNG, n, (OutputStream)fileOutputStream);
            fileOutputStream.flush();
            fileOutputStream.close();
            return;
        }
        catch (FileNotFoundException var6_6) {
            return;
        }
        catch (IOException var5_7) {
            var5_7.printStackTrace();
            return;
        }
    }
}

