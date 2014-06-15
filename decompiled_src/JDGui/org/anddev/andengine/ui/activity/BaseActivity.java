package org.anddev.andengine.ui.activity;

import android.app.Activity;
import android.app.ProgressDialog;
import android.os.AsyncTask;
import java.util.concurrent.Callable;
import org.anddev.andengine.util.AsyncCallable;
import org.anddev.andengine.util.Callback;
import org.anddev.andengine.util.Debug;
import org.anddev.andengine.util.ProgressCallable;
import org.anddev.progressmonitor.IProgressListener;

public abstract class BaseActivity
  extends Activity
{
  protected <T> void doAsync(int paramInt1, int paramInt2, Callable<T> paramCallable, Callback<T> paramCallback)
  {
    doAsync(paramInt1, paramInt2, paramCallable, paramCallback, null);
  }
  
  protected <T> void doAsync(final int paramInt1, final int paramInt2, final Callable<T> paramCallable, final Callback<T> paramCallback, final Callback<Exception> paramCallback1)
  {
    new AsyncTask()
    {
      private Exception mException = null;
      private ProgressDialog mPD;
      
      public T doInBackground(Void... paramAnonymousVarArgs)
      {
        try
        {
          Object localObject = paramCallable.call();
          return localObject;
        }
        catch (Exception localException)
        {
          this.mException = localException;
        }
        return null;
      }
      
      public void onPostExecute(T paramAnonymousT)
      {
        try
        {
          this.mPD.dismiss();
          if (isCancelled()) {
            this.mException = new BaseActivity.CancelledException();
          }
          if (this.mException == null)
          {
            paramCallback.onCallback(paramAnonymousT);
            super.onPostExecute(paramAnonymousT);
            return;
          }
        }
        catch (Exception localException)
        {
          for (;;)
          {
            Debug.e("Error", localException);
            continue;
            if (paramCallback1 == null) {
              Debug.e("Error", this.mException);
            } else {
              paramCallback1.onCallback(this.mException);
            }
          }
        }
      }
      
      public void onPreExecute()
      {
        this.mPD = ProgressDialog.show(BaseActivity.this, BaseActivity.this.getString(paramInt1), BaseActivity.this.getString(paramInt2));
        super.onPreExecute();
      }
    }.execute(null);
  }
  
  protected <T> void doAsync(int paramInt1, int paramInt2, AsyncCallable<T> paramAsyncCallable, final Callback<T> paramCallback, Callback<Exception> paramCallback1)
  {
    paramAsyncCallable.call(new Callback()
    {
      public void onCallback(T paramAnonymousT)
      {
        try
        {
          this.val$pd.dismiss();
          paramCallback.onCallback(paramAnonymousT);
          return;
        }
        catch (Exception localException)
        {
          for (;;)
          {
            Debug.e("Error", localException);
          }
        }
      }
    }, paramCallback1);
  }
  
  protected <T> void doProgressAsync(int paramInt, ProgressCallable<T> paramProgressCallable, Callback<T> paramCallback)
  {
    doProgressAsync(paramInt, paramProgressCallable, paramCallback, null);
  }
  
  protected <T> void doProgressAsync(final int paramInt, final ProgressCallable<T> paramProgressCallable, final Callback<T> paramCallback, final Callback<Exception> paramCallback1)
  {
    new AsyncTask()
    {
      private Exception mException = null;
      private ProgressDialog mPD;
      
      public T doInBackground(Void... paramAnonymousVarArgs)
      {
        try
        {
          Object localObject = paramProgressCallable.call(new IProgressListener()
          {
            public void onProgressChanged(int paramAnonymous2Int)
            {
              BaseActivity.2 local2 = BaseActivity.2.this;
              Integer[] arrayOfInteger = new Integer[1];
              arrayOfInteger[0] = Integer.valueOf(paramAnonymous2Int);
              local2.onProgressUpdate(arrayOfInteger);
            }
          });
          return localObject;
        }
        catch (Exception localException)
        {
          this.mException = localException;
        }
        return null;
      }
      
      public void onPostExecute(T paramAnonymousT)
      {
        try
        {
          this.mPD.dismiss();
          if (isCancelled()) {
            this.mException = new BaseActivity.CancelledException();
          }
          if (this.mException == null)
          {
            paramCallback.onCallback(paramAnonymousT);
            super.onPostExecute(paramAnonymousT);
            return;
          }
        }
        catch (Exception localException)
        {
          for (;;)
          {
            Debug.e("Error", localException);
            continue;
            if (paramCallback1 == null) {
              Debug.e("Error", this.mException);
            } else {
              paramCallback1.onCallback(this.mException);
            }
          }
        }
      }
      
      public void onPreExecute()
      {
        this.mPD = new ProgressDialog(BaseActivity.this);
        this.mPD.setTitle(paramInt);
        this.mPD.setIcon(17301582);
        this.mPD.setIndeterminate(false);
        this.mPD.setProgressStyle(1);
        this.mPD.show();
        super.onPreExecute();
      }
      
      public void onProgressUpdate(Integer... paramAnonymousVarArgs)
      {
        this.mPD.setProgress(paramAnonymousVarArgs[0].intValue());
      }
    }.execute(null);
  }
  
  public static class CancelledException
    extends Exception
  {
    private static final long serialVersionUID = -78123211381435596L;
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.ui.activity.BaseActivity
 * JD-Core Version:    0.7.0.1
 */