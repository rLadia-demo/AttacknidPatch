package org.anddev.andengine.util;

import android.content.*;
import android.os.*;
import java.io.*;

public class FileUtils
{
    public static void copyFile(final File file, final File file2) throws IOException {
        final FileInputStream fileInputStream = new FileInputStream(file);
        final FileOutputStream fileOutputStream = new FileOutputStream(file2);
        try {
            StreamUtils.copy(fileInputStream, fileOutputStream);
        }
        finally {
            StreamUtils.closeStream(fileInputStream);
            StreamUtils.closeStream(fileOutputStream);
        }
    }
    
    public static void copyToExternalStorage(final Context context, final int n, final String s) throws FileNotFoundException {
        copyToExternalStorage(context, context.getResources().openRawResource(n), s);
    }
    
    public static void copyToExternalStorage(final Context context, final InputStream inputStream, final String s) throws FileNotFoundException {
        if (isExternalStorageWriteable()) {
            StreamUtils.copyAndClose(inputStream, new FileOutputStream(getAbsolutePathOnExternalStorage(context, s)));
            return;
        }
        throw new IllegalStateException("External Storage is not writeable.");
    }
    
    public static void copyToExternalStorage(final Context context, final String s, final String s2) throws IOException {
        copyToExternalStorage(context, context.getAssets().open(s), s2);
    }
    
    public static boolean deleteDirectory(final File file) {
        if (file.isDirectory()) {
            final String[] list = file.list();
            for (int length = list.length, i = 0; i < length; ++i) {
                if (!deleteDirectory(new File(file, list[i]))) {
                    return false;
                }
            }
        }
        return file.delete();
    }
    
    public static boolean ensureDirectoriesExistOnExternalStorage(final Context context, final String s) {
        if (isDirectoryExistingOnExternalStorage(context, s)) {
            return true;
        }
        if (isExternalStorageWriteable()) {
            return new File(getAbsolutePathOnExternalStorage(context, s)).mkdirs();
        }
        throw new IllegalStateException("External Storage is not writeable.");
    }
    
    public static String getAbsolutePathOnExternalStorage(final Context context, final String s) {
        return Environment.getExternalStorageDirectory() + "/Android/data/" + context.getApplicationInfo().packageName + "/files/" + s;
    }
    
    public static String[] getDirectoryListOnExternalStorage(final Context context, final String s) throws FileNotFoundException {
        return new File(getAbsolutePathOnExternalStorage(context, s)).list();
    }
    
    public static String[] getDirectoryListOnExternalStorage(final Context context, final String s, final FilenameFilter filenameFilter) throws FileNotFoundException {
        return new File(getAbsolutePathOnExternalStorage(context, s)).list(filenameFilter);
    }
    
    public static boolean isDirectoryExistingOnExternalStorage(final Context context, final String s) {
        if (isExternalStorageReadable()) {
            return new File(getAbsolutePathOnExternalStorage(context, s)).exists();
        }
        throw new IllegalStateException("External Storage is not readable.");
    }
    
    public static boolean isExternalStorageReadable() {
        final String externalStorageState = Environment.getExternalStorageState();
        return externalStorageState.equals("mounted") || externalStorageState.equals("mounted_ro");
    }
    
    public static boolean isExternalStorageWriteable() {
        return Environment.getExternalStorageState().equals("mounted");
    }
    
    public static boolean isFileExistingOnExternalStorage(final Context context, final String s) {
        if (isExternalStorageReadable()) {
            return new File(getAbsolutePathOnExternalStorage(context, s)).exists();
        }
        throw new IllegalStateException("External Storage is not readable.");
    }
    
    public static InputStream openOnExternalStorage(final Context context, final String s) throws FileNotFoundException {
        return new FileInputStream(getAbsolutePathOnExternalStorage(context, s));
    }
}
