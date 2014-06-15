package com.SixClawWorm.utils;

import android.content.*;
import java.util.*;
import android.app.*;

public class ExitApplication
{
    private static ExitApplication exitApplication;
    private List<Activity> listActivity;
    
    private ExitApplication() {
        super();
        this.listActivity = new ArrayList<Activity>();
    }
    
    public static ExitApplication getInstance() {
        if (ExitApplication.exitApplication == null) {
            ExitApplication.exitApplication = new ExitApplication();
        }
        return ExitApplication.exitApplication;
    }
    
    public void addActivity(final Activity activity) {
        this.listActivity.add(activity);
    }
    
    public void exit(final Context context) {
        ((Dialog)new AlertDialog$Builder(context).setTitle((CharSequence)"Are you sure?").setMessage((CharSequence)"Are you sure to quit the game?").setPositiveButton((CharSequence)"sure", (DialogInterface$OnClickListener)new DialogInterface$OnClickListener() {
            public void onClick(final DialogInterface dialogInterface, final int n) {
                final Iterator<Activity> iterator = ExitApplication.this.listActivity.iterator();
                while (iterator.hasNext()) {
                    iterator.next().finish();
                }
                System.exit(0);
            }
        }).setNegativeButton((CharSequence)"cancel", (DialogInterface$OnClickListener)new DialogInterface$OnClickListener() {
            public void onClick(final DialogInterface dialogInterface, final int n) {
            }
        }).create()).show();
    }
}
