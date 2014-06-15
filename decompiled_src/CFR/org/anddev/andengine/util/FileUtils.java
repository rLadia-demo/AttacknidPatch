/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.content.Context
 *  android.content.res.AssetManager
 *  android.content.res.Resources
 *  android.os.Environment
 */
package org.anddev.andengine.util;

import android.content.Context;
import android.content.res.AssetManager;
import android.content.res.Resources;
import android.os.Environment;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.InputStream;
import org.anddev.andengine.util.StreamUtils;

public class FileUtils {
    public static void copyFile(File file, File file2) throws IOException {
        FileInputStream fileInputStream = new FileInputStream(file);
        FileOutputStream fileOutputStream = new FileOutputStream(file2);
        try {
            StreamUtils.copy(fileInputStream, fileOutputStream);
            return;
        }
        finally {
            StreamUtils.closeStream(fileInputStream);
            StreamUtils.closeStream(fileOutputStream);
        }
    }

    public static void copyToExternalStorage(Context context, int n, String string) throws FileNotFoundException {
        FileUtils.copyToExternalStorage(context, context.getResources().openRawResource(n), string);
    }

    public static void copyToExternalStorage(Context context, InputStream inputStream, String string) throws FileNotFoundException {
        if (!FileUtils.isExternalStorageWriteable()) throw new IllegalStateException("External Storage is not writeable.");
        StreamUtils.copyAndClose(inputStream, new FileOutputStream(FileUtils.getAbsolutePathOnExternalStorage(context, string)));
    }

    public static void copyToExternalStorage(Context context, String string, String string2) throws IOException {
        FileUtils.copyToExternalStorage(context, context.getAssets().open(string), string2);
    }

    public static boolean deleteDirectory(File file) {
        if (!file.isDirectory()) return file.delete();
        String[] arrstring = file.list();
        int n = arrstring.length;
        int n2 = 0;
        while (n2 < n) {
            if (!FileUtils.deleteDirectory(new File(file, arrstring[n2]))) {
                return false;
            }
            ++n2;
        }
        return file.delete();
    }

    public static boolean ensureDirectoriesExistOnExternalStorage(Context context, String string) {
        if (FileUtils.isDirectoryExistingOnExternalStorage(context, string)) {
            return true;
        }
        if (!FileUtils.isExternalStorageWriteable()) throw new IllegalStateException("External Storage is not writeable.");
        return new File(FileUtils.getAbsolutePathOnExternalStorage(context, string)).mkdirs();
    }

    public static String getAbsolutePathOnExternalStorage(Context context, String string) {
        return Environment.getExternalStorageDirectory() + "/Android/data/" + context.getApplicationInfo().packageName + "/files/" + string;
    }

    public static String[] getDirectoryListOnExternalStorage(Context context, String string) throws FileNotFoundException {
        return new File(FileUtils.getAbsolutePathOnExternalStorage(context, string)).list();
    }

    public static String[] getDirectoryListOnExternalStorage(Context context, String string, FilenameFilter filenameFilter) throws FileNotFoundException {
        return new File(FileUtils.getAbsolutePathOnExternalStorage(context, string)).list(filenameFilter);
    }

    public static boolean isDirectoryExistingOnExternalStorage(Context context, String string) {
        if (!FileUtils.isExternalStorageReadable()) throw new IllegalStateException("External Storage is not readable.");
        return new File(FileUtils.getAbsolutePathOnExternalStorage(context, string)).exists();
    }

    public static boolean isExternalStorageReadable() {
        String string = Environment.getExternalStorageState();
        if (string.equals("mounted") || string.equals("mounted_ro")) return true;
        return false;
    }

    public static boolean isExternalStorageWriteable() {
        return Environment.getExternalStorageState().equals("mounted");
    }

    public static boolean isFileExistingOnExternalStorage(Context context, String string) {
        if (!FileUtils.isExternalStorageReadable()) throw new IllegalStateException("External Storage is not readable.");
        return new File(FileUtils.getAbsolutePathOnExternalStorage(context, string)).exists();
    }

    public static InputStream openOnExternalStorage(Context context, String string) throws FileNotFoundException {
        return new FileInputStream(FileUtils.getAbsolutePathOnExternalStorage(context, string));
    }
}

