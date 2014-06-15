package org.anddev.andengine.util;

import java.util.ArrayList;

public class ListUtils
{
  public static <T> ArrayList<? extends T> toList(T paramT)
  {
    ArrayList localArrayList = new ArrayList();
    localArrayList.add(paramT);
    return localArrayList;
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.ListUtils
 * JD-Core Version:    0.7.0.1
 */