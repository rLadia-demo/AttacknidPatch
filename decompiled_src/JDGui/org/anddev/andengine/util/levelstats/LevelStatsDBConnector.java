package org.anddev.andengine.util.levelstats;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import org.anddev.andengine.util.Callback;
import org.anddev.andengine.util.Debug;
import org.anddev.andengine.util.MathUtils;
import org.anddev.andengine.util.SimplePreferences;
import org.anddev.andengine.util.StreamUtils;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.StatusLine;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;

public class LevelStatsDBConnector
{
  private static final String PREFERENCES_LEVELSTATSDBCONNECTOR_PLAYERID_ID = "preferences.levelstatsdbconnector.playerid";
  private final int mPlayerID;
  private final String mSecret;
  private final String mSubmitURL;
  
  public LevelStatsDBConnector(Context paramContext, String paramString1, String paramString2)
  {
    this.mSecret = paramString1;
    this.mSubmitURL = paramString2;
    int i = SimplePreferences.getInstance(paramContext).getInt("preferences.levelstatsdbconnector.playerid", -1);
    if (i != -1)
    {
      this.mPlayerID = i;
      return;
    }
    this.mPlayerID = MathUtils.random(1000000000, 2147483647);
    SimplePreferences.getEditorInstance(paramContext).putInt("preferences.levelstatsdbconnector.playerid", this.mPlayerID).commit();
  }
  
  public void submitAsync(int paramInt1, boolean paramBoolean, int paramInt2)
  {
    submitAsync(paramInt1, paramBoolean, paramInt2, null);
  }
  
  public void submitAsync(final int paramInt1, final boolean paramBoolean, final int paramInt2, final Callback<Boolean> paramCallback)
  {
    new Thread(new Runnable()
    {
      public void run()
      {
        for (;;)
        {
          try
          {
            DefaultHttpClient localDefaultHttpClient = new DefaultHttpClient();
            HttpPost localHttpPost = new HttpPost(LevelStatsDBConnector.this.mSubmitURL);
            ArrayList localArrayList = new ArrayList(4);
            localArrayList.add(new BasicNameValuePair("level_id", String.valueOf(paramInt1)));
            if (!paramBoolean) {
              break label312;
            }
            str = "1";
            localArrayList.add(new BasicNameValuePair("solved", str));
            localArrayList.add(new BasicNameValuePair("secondsplayed", String.valueOf(paramInt2)));
            localArrayList.add(new BasicNameValuePair("player_id", String.valueOf(LevelStatsDBConnector.this.mPlayerID)));
            localArrayList.add(new BasicNameValuePair("secret", String.valueOf(LevelStatsDBConnector.this.mSecret)));
            localHttpPost.setEntity(new UrlEncodedFormEntity(localArrayList));
            HttpResponse localHttpResponse = localDefaultHttpClient.execute(localHttpPost);
            if (localHttpResponse.getStatusLine().getStatusCode() == 200)
            {
              if (StreamUtils.readFully(localHttpResponse.getEntity().getContent()).equals("<success/>"))
              {
                if (paramCallback == null) {
                  break label311;
                }
                paramCallback.onCallback(Boolean.valueOf(true));
                return;
              }
              if (paramCallback == null) {
                break label311;
              }
              paramCallback.onCallback(Boolean.valueOf(false));
            }
          }
          catch (IOException localIOException)
          {
            Debug.e(localIOException);
            if (paramCallback != null)
            {
              paramCallback.onCallback(Boolean.valueOf(false));
              return;
              if (paramCallback != null) {
                paramCallback.onCallback(Boolean.valueOf(false));
              }
            }
          }
          label311:
          return;
          label312:
          String str = "0";
        }
      }
    }).start();
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.levelstats.LevelStatsDBConnector
 * JD-Core Version:    0.7.0.1
 */