package com.SixClawWorm.application;

import android.app.*;
import java.util.*;

public class MeetingApplication extends Application
{
    public static String VERSION;
    private static MeetingApplication instance;
    private List<Activity> mList;
    
    static {
        MeetingApplication.VERSION = "1.0";
    }
    
    public MeetingApplication() {
        super();
        this.mList = new LinkedList<Activity>();
    }
    
    public static MeetingApplication getInstance() {
        synchronized (MeetingApplication.class) {
            if (MeetingApplication.instance == null) {
                MeetingApplication.instance = new MeetingApplication();
            }
            return MeetingApplication.instance;
        }
    }
    
    public void addActivity(final Activity activity) {
        this.mList.add(activity);
    }
    
    public void exit() {
        try {
            for (final Activity activity : this.mList) {
                if (activity != null) {
                    activity.finish();
                }
            }
        }
        catch (Exception ex) {
            ex.printStackTrace();
        }
        finally {
            System.exit(0);
        }
    }
    
    public void onCreate() {
        super.onCreate();
        MeetingApplication.instance = this;
    }
    
    public void onExit() {
    }
    
    public void onLowMemory() {
        super.onLowMemory();
        System.gc();
    }
}
