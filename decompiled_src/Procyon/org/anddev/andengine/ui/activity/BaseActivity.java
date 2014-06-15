package org.anddev.andengine.ui.activity;

import java.util.concurrent.*;
import android.os.*;
import android.app.*;
import android.content.*;
import org.anddev.andengine.util.*;
import org.anddev.progressmonitor.*;

public abstract class BaseActivity extends Activity
{
    protected <T> void doAsync(final int n, final int n2, final Callable<T> callable, final Callback<T> callback) {
        this.doAsync(n, n2, callable, callback, null);
    }
    
    protected <T> void doAsync(final int n, final int n2, final Callable<T> callable, final Callback<T> callback, final Callback<Exception> callback2) {
        new AsyncTask<Void, Void, T>() {
            private Exception mException = null;
            private ProgressDialog mPD;
            
            public T doInBackground(final Void... array) {
                try {
                    return callable.call();
                }
                catch (Exception mException) {
                    this.mException = mException;
                    return null;
                }
            }
            
            public void onPostExecute(final T t) {
            Label_0042_Outer:
                while (true) {
                    while (true) {
                        while (true) {
                            try {
                                this.mPD.dismiss();
                                if (this.isCancelled()) {
                                    this.mException = new CancelledException();
                                }
                                if (this.mException == null) {
                                    callback.onCallback(t);
                                    super.onPostExecute((Object)t);
                                    return;
                                }
                            }
                            catch (Exception ex) {
                                Debug.e("Error", ex);
                                continue Label_0042_Outer;
                            }
                            break;
                        }
                        if (callback2 == null) {
                            Debug.e("Error", this.mException);
                            continue;
                        }
                        callback2.onCallback(this.mException);
                        continue;
                    }
                }
            }
            
            public void onPreExecute() {
                this.mPD = ProgressDialog.show((Context)BaseActivity.this, (CharSequence)BaseActivity.this.getString(n), (CharSequence)BaseActivity.this.getString(n2));
                super.onPreExecute();
            }
        }.execute((Object[])null);
    }
    
    protected <T> void doAsync(final int n, final int n2, final AsyncCallable<T> asyncCallable, final Callback<T> callback, final Callback<Exception> callback2) {
        asyncCallable.call(new Callback<T>() {
            private final /* synthetic */ ProgressDialog val$pd = ProgressDialog.show((Context)this, (CharSequence)BaseActivity.this.getString(n), (CharSequence)BaseActivity.this.getString(n2));
            
            @Override
            public void onCallback(final T t) {
                while (true) {
                    try {
                        this.val$pd.dismiss();
                        callback.onCallback(t);
                    }
                    catch (Exception ex) {
                        Debug.e("Error", ex);
                        continue;
                    }
                    break;
                }
            }
        }, callback2);
    }
    
    protected <T> void doProgressAsync(final int n, final ProgressCallable<T> progressCallable, final Callback<T> callback) {
        this.doProgressAsync(n, progressCallable, callback, null);
    }
    
    protected <T> void doProgressAsync(final int n, final ProgressCallable<T> progressCallable, final Callback<T> callback, final Callback<Exception> callback2) {
        new AsyncTask<Void, Integer, T>() {
            private Exception mException = null;
            private ProgressDialog mPD;
            
            public T doInBackground(final Void... array) {
                try {
                    return progressCallable.call((IProgressListener)new IProgressListener() {
                        public void onProgressChanged(final int n) {
                            AsyncTask.this.onProgressUpdate(n);
                        }
                    });
                }
                catch (Exception mException) {
                    this.mException = mException;
                    return null;
                }
            }
            
            public void onPostExecute(final T t) {
            Label_0042_Outer:
                while (true) {
                    while (true) {
                        while (true) {
                            try {
                                this.mPD.dismiss();
                                if (this.isCancelled()) {
                                    this.mException = new CancelledException();
                                }
                                if (this.mException == null) {
                                    callback.onCallback(t);
                                    super.onPostExecute((Object)t);
                                    return;
                                }
                            }
                            catch (Exception ex) {
                                Debug.e("Error", ex);
                                continue Label_0042_Outer;
                            }
                            break;
                        }
                        if (callback2 == null) {
                            Debug.e("Error", this.mException);
                            continue;
                        }
                        callback2.onCallback(this.mException);
                        continue;
                    }
                }
            }
            
            public void onPreExecute() {
                (this.mPD = new ProgressDialog((Context)BaseActivity.this)).setTitle(n);
                this.mPD.setIcon(17301582);
                this.mPD.setIndeterminate(false);
                this.mPD.setProgressStyle(1);
                this.mPD.show();
                super.onPreExecute();
            }
            
            public void onProgressUpdate(final Integer... array) {
                this.mPD.setProgress((int)array[0]);
            }
        }.execute((Object[])null);
    }
    
    public static class CancelledException extends Exception
    {
        private static final long serialVersionUID = -78123211381435596L;
    }
}
