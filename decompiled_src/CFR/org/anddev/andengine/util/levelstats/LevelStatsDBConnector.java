/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.content.Context
 *  android.content.SharedPreferences
 *  android.content.SharedPreferences$Editor
 *  org.apache.http.HttpEntity
 *  org.apache.http.HttpResponse
 *  org.apache.http.StatusLine
 *  org.apache.http.client.entity.UrlEncodedFormEntity
 *  org.apache.http.client.methods.HttpPost
 *  org.apache.http.client.methods.HttpUriRequest
 *  org.apache.http.impl.client.DefaultHttpClient
 *  org.apache.http.message.BasicNameValuePair
 */
package org.anddev.andengine.util.levelstats;

import android.content.Context;
import android.content.SharedPreferences;
import java.io.IOException;
import java.io.InputStream;
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
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;

public class LevelStatsDBConnector {
    private static final String PREFERENCES_LEVELSTATSDBCONNECTOR_PLAYERID_ID = "preferences.levelstatsdbconnector.playerid";
    private final int mPlayerID;
    private final String mSecret;
    private final String mSubmitURL;

    public LevelStatsDBConnector(Context context, String string, String string2) {
        this.mSecret = string;
        this.mSubmitURL = string2;
        int n = SimplePreferences.getInstance(context).getInt("preferences.levelstatsdbconnector.playerid", -1);
        if (n != -1) {
            this.mPlayerID = n;
            return;
        }
        this.mPlayerID = MathUtils.random(1000000000, Integer.MAX_VALUE);
        SimplePreferences.getEditorInstance(context).putInt("preferences.levelstatsdbconnector.playerid", this.mPlayerID).commit();
    }

    public void submitAsync(int n, boolean bl, int n2) {
        this.submitAsync(n, bl, n2, null);
    }

    public void submitAsync(int n, boolean bl, int n2, Callback<Boolean> callback) {
        new Thread(new Runnable(){

            /*
             * Enabled aggressive block sorting
             * Enabled unnecessary exception pruning
             */
            @Override
            public void run() {
                try {
                    DefaultHttpClient defaultHttpClient = new DefaultHttpClient();
                    HttpPost httpPost = new HttpPost(LevelStatsDBConnector.this.mSubmitURL);
                    ArrayList<BasicNameValuePair> arrayList = new ArrayList<BasicNameValuePair>(4);
                    arrayList.add(new BasicNameValuePair("level_id", String.valueOf(n)));
                    String string = bl ? "1" : "0";
                    arrayList.add(new BasicNameValuePair("solved", string));
                    arrayList.add(new BasicNameValuePair("secondsplayed", String.valueOf(n2)));
                    arrayList.add(new BasicNameValuePair("player_id", String.valueOf(LevelStatsDBConnector.this.mPlayerID)));
                    arrayList.add(new BasicNameValuePair("secret", String.valueOf(LevelStatsDBConnector.this.mSecret)));
                    httpPost.setEntity((HttpEntity)new UrlEncodedFormEntity(arrayList));
                    HttpResponse httpResponse = defaultHttpClient.execute((HttpUriRequest)httpPost);
                    if (httpResponse.getStatusLine().getStatusCode() == 200) {
                        if (StreamUtils.readFully(httpResponse.getEntity().getContent()).equals("<success/>")) {
                            if (callback == null) return;
                            callback.onCallback(true);
                            return;
                        }
                        if (callback == null) return;
                        callback.onCallback(false);
                        return;
                    }
                    if (callback == null) return;
                    callback.onCallback(false);
                    return;
                }
                catch (IOException var4_6) {
                    Debug.e(var4_6);
                    if (callback == null) return;
                    callback.onCallback(false);
                    return;
                }
            }
        }).start();
    }

}

