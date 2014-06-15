package com.badlogic.gdx.physics.box2d;

import java.util.ArrayList;

public class ContactList
{
  private final ArrayList<Contact> contacts = new ArrayList();
  private final ArrayList<Contact> freeContacts = new ArrayList();
  private int freeIdx = 0;
  
  protected void add(long paramLong) {}
  
  public Contact get(int paramInt)
  {
    return (Contact)this.contacts.get(paramInt);
  }
  
  protected void remove(long paramLong) {}
  
  public int size()
  {
    return this.contacts.size();
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     com.badlogic.gdx.physics.box2d.ContactList
 * JD-Core Version:    0.7.0.1
 */