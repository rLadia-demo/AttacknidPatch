package org.anddev.andengine.util.levelstats;

import android.content.*;
import org.apache.http.impl.client.*;
import org.apache.http.message.*;
import org.apache.http.client.entity.*;
import java.util.*;
import org.apache.http.client.methods.*;
import org.anddev.andengine.util.*;
import java.io.*;
import org.apache.http.*;
import org.apache.http.client.*;

public class LevelStatsDBConnector
{
    private static final String PREFERENCES_LEVELSTATSDBCONNECTOR_PLAYERID_ID = "preferences.levelstatsdbconnector.playerid";
    private final int mPlayerID;
    private final String mSecret;
    private final String mSubmitURL;
    
    public LevelStatsDBConnector(final Context context, final String mSecret, final String mSubmitURL) {
        super();
        this.mSecret = mSecret;
        this.mSubmitURL = mSubmitURL;
        final int int1 = SimplePreferences.getInstance(context).getInt("preferences.levelstatsdbconnector.playerid", -1);
        if (int1 != -1) {
            this.mPlayerID = int1;
            return;
        }
        this.mPlayerID = MathUtils.random(1000000000, Integer.MAX_VALUE);
        SimplePreferences.getEditorInstance(context).putInt("preferences.levelstatsdbconnector.playerid", this.mPlayerID).commit();
    }
    
    public void submitAsync(final int n, final boolean b, final int n2) {
        this.submitAsync(n, b, n2, null);
    }
    
    public void submitAsync(final int n, final boolean b, final int n2, final Callback<Boolean> callback) {
        new Thread(new Runnable() {
            @Override
            public void run() {
                while (true) {
                Label_0291:
                    while (true) {
                        Label_0312: {
                            try {
                                final DefaultHttpClient defaultHttpClient = new DefaultHttpClient();
                                final HttpPost httpPost = new HttpPost(LevelStatsDBConnector.this.mSubmitURL);
                                final ArrayList<BasicNameValuePair> list = new ArrayList<BasicNameValuePair>(4);
                                list.add(new BasicNameValuePair("level_id", String.valueOf(n)));
                                if (!b) {
                                    break Label_0312;
                                }
                                final String s = "1";
                                list.add(new BasicNameValuePair("solved", s));
                                list.add(new BasicNameValuePair("secondsplayed", String.valueOf(n2)));
                                list.add(new BasicNameValuePair("player_id", String.valueOf(LevelStatsDBConnector.this.mPlayerID)));
                                list.add(new BasicNameValuePair("secret", String.valueOf(LevelStatsDBConnector.this.mSecret)));
                                httpPost.setEntity((HttpEntity)new UrlEncodedFormEntity((List)list));
                                final HttpResponse execute = ((HttpClient)defaultHttpClient).execute((HttpUriRequest)httpPost);
                                if (execute.getStatusLine().getStatusCode() == 200) {
                                    if (StreamUtils.readFully(execute.getEntity().getContent()).equals("<success/>")) {
                                        if (callback != null) {
                                            callback.onCallback(true);
                                            return;
                                        }
                                        break;
                                    }
                                    else {
                                        if (callback != null) {
                                            callback.onCallback(false);
                                            return;
                                        }
                                        break;
                                    }
                                }
                            }
                            catch (IOException ex) {
                                Debug.e(ex);
                                if (callback != null) {
                                    callback.onCallback(false);
                                    return;
                                }
                                break;
                            }
                            break Label_0291;
                        }
                        final String s = "0";
                        continue;
                    }
                    if (callback != null) {
                        callback.onCallback(false);
                        break;
                    }
                    break;
                }
            }
        }).start();
    }
}
