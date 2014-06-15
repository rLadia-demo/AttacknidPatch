package com.SixClawWorm.utils;

import android.app.Activity;
import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class ExitApplication
{
  private static ExitApplication exitApplication;
  private List<Activity> listActivity = new ArrayList();
  
  public static ExitApplication getInstance()
  {
    if (exitApplication == null) {
      exitApplication = new ExitApplication();
    }
    return exitApplication;
  }
  
  public void addActivity(Activity paramActivity)
  {
    this.listActivity.add(paramActivity);
  }
  
  public void exit(Context paramContext)
  {
    new AlertDialog.Builder(paramContext).setTitle("Are you sure?").setMessage("Are you sure to quit the game?").setPositiveButton("sure", new DialogInterface.OnClickListener()
    {
      public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
      {
        Iterator localIterator = ExitApplication.this.listActivity.iterator();
        for (;;)
        {
          if (!localIterator.hasNext())
          {
            System.exit(0);
            return;
          }
          ((Activity)localIterator.next()).finish();
        }
      }
    }).setNegativeButton("cancel", new DialogInterface.OnClickListener()
    {
      public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt) {}
    }).create().show();
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     com.SixClawWorm.utils.ExitApplication
 * JD-Core Version:    0.7.0.1
 */