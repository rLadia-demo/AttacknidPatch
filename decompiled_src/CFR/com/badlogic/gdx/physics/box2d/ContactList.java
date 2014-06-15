/*
 * Decompiled with CFR 0_79.
 */
package com.badlogic.gdx.physics.box2d;

import com.badlogic.gdx.physics.box2d.Contact;
import java.util.ArrayList;

public class ContactList {
    private final ArrayList<Contact> contacts = new ArrayList<Contact>();
    private final ArrayList<Contact> freeContacts = new ArrayList<Contact>();
    private int freeIdx = 0;

    protected void add(long l) {
    }

    public Contact get(int n) {
        return this.contacts.get(n);
    }

    protected void remove(long l) {
    }

    public int size() {
        return this.contacts.size();
    }
}

