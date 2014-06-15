/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.app.Activity
 *  android.app.ProgressDialog
 *  android.content.Context
 *  android.os.AsyncTask
 *  org.anddev.progressmonitor.IProgressListener
 */
package org.anddev.andengine.ui.activity;

import android.app.Activity;
import android.app.ProgressDialog;
import android.content.Context;
import android.os.AsyncTask;
import java.util.concurrent.Callable;
import org.anddev.andengine.util.AsyncCallable;
import org.anddev.andengine.util.Callback;
import org.anddev.andengine.util.Debug;
import org.anddev.andengine.util.ProgressCallable;
import org.anddev.progressmonitor.IProgressListener;

public abstract class BaseActivity
extends Activity {
    protected <T> void doAsync(int n, int n2, Callable<T> callable, Callback<T> callback) {
        this.doAsync(n, n2, callable, callback, null);
    }

    protected <T> void doAsync(int n, int n2, Callable<T> callable, Callback<T> callback, Callback<Exception> callback2) {
        new AsyncTask<Void, Void, T>(){
            private Exception mException;
            private ProgressDialog mPD;

            public /* varargs */ T doInBackground(Void ... arrvoid) {
                try {
                    Object V = callable.call();
                    return V;
                }
                catch (Exception var2_2) {
                    this.mException = var2_2;
                    return null;
                }
            }

            /*
             * Enabled aggressive block sorting
             * Enabled unnecessary exception pruning
             */
            public void onPostExecute(T T) {
                try {
                    this.mPD.dismiss();
                }
                catch (Exception var2_2) {
                    Debug.e("Error", var2_2);
                }
                if (this.isCancelled()) {
                    this.mException = new CancelledException();
                }
                if (this.mException == null) {
                    callback.onCallback(T);
                } else if (callback2 == null) {
                    Debug.e("Error", this.mException);
                } else {
                    callback2.onCallback(this.mException);
                }
                super.onPostExecute(T);
            }

            public void onPreExecute() {
                this.mPD = ProgressDialog.show((Context)BaseActivity.this, (CharSequence)BaseActivity.this.getString(n), (CharSequence)BaseActivity.this.getString(n2));
                super.onPreExecute();
            }
        }.execute((Object[])null);
    }

    protected <T> void doAsync(int n, int n2, AsyncCallable<T> asyncCallable, Callback<T> callback, Callback<Exception> callback2) {
        asyncCallable.call(new Callback<T>(ProgressDialog.show((Context)this, (CharSequence)this.getString(n), (CharSequence)this.getString(n2)), callback){
            private final /* synthetic */ Callback val$pCallback;
            private final /* synthetic */ ProgressDialog val$pd;

            /*
             * Enabled aggressive block sorting
             * Enabled unnecessary exception pruning
             */
            @Override
            public void onCallback(T T) {
                try {
                    this.val$pd.dismiss();
                }
                catch (Exception var2_2) {
                    Debug.e("Error", var2_2);
                }
                this.val$pCallback.onCallback(T);
            }
        }, callback2);
    }

    protected <T> void doProgressAsync(int n, ProgressCallable<T> progressCallable, Callback<T> callback) {
        this.doProgressAsync(n, progressCallable, callback, null);
    }

    protected <T> void doProgressAsync(int n, ProgressCallable<T> progressCallable, Callback<T> callback, Callback<Exception> callback2) {
        new AsyncTask<Void, Integer, T>(){
            private Exception mException;
            private ProgressDialog mPD;

            public /* varargs */ T doInBackground(Void ... arrvoid) {
                try {
                    Object T = progressCallable.call((IProgressListener)new IProgressListener(){

                        public void onProgressChanged(int n) {
                             var2_2 = 2.this;
                            Integer[] arrinteger = new Integer[]{n};
                            var2_2.onProgressUpdate(arrinteger);
                        }
                    });
                    return T;
                }
                catch (Exception var2_2) {
                    this.mException = var2_2;
                    return null;
                }
            }

            /*
             * Enabled aggressive block sorting
             * Enabled unnecessary exception pruning
             */
            public void onPostExecute(T T) {
                try {
                    this.mPD.dismiss();
                }
                catch (Exception var2_2) {
                    Debug.e("Error", var2_2);
                }
                if (this.isCancelled()) {
                    this.mException = new CancelledException();
                }
                if (this.mException == null) {
                    callback.onCallback(T);
                } else if (callback2 == null) {
                    Debug.e("Error", this.mException);
                } else {
                    callback2.onCallback(this.mException);
                }
                super.onPostExecute(T);
            }

            public void onPreExecute() {
                this.mPD = new ProgressDialog((Context)BaseActivity.this);
                this.mPD.setTitle(n);
                this.mPD.setIcon(17301582);
                this.mPD.setIndeterminate(false);
                this.mPD.setProgressStyle(1);
                this.mPD.show();
                super.onPreExecute();
            }

            public /* varargs */ void onProgressUpdate(Integer ... arrinteger) {
                this.mPD.setProgress(arrinteger[0].intValue());
            }

        }.execute((Object[])null);
    }

    public static class CancelledException
    extends Exception {
        private static final long serialVersionUID = -78123211381435596L;
    }

}

