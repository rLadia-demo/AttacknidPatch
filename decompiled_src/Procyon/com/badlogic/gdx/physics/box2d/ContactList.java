package com.badlogic.gdx.physics.box2d;

import java.util.*;

public class ContactList
{
    private final ArrayList<Contact> contacts;
    private final ArrayList<Contact> freeContacts;
    private int freeIdx;
    
    public ContactList() {
        super();
        this.freeContacts = new ArrayList<Contact>();
        this.contacts = new ArrayList<Contact>();
        this.freeIdx = 0;
    }
    
    protected void add(final long n) {
    }
    
    public Contact get(final int n) {
        return this.contacts.get(n);
    }
    
    protected void remove(final long n) {
    }
    
    public int size() {
        return this.contacts.size();
    }
}
