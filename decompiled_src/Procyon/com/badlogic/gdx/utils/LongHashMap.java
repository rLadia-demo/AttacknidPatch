package com.badlogic.gdx.utils;

import java.util.*;

public class LongHashMap<T>
{
    private int capacity;
    EntryIterable iterable;
    private float loadFactor;
    private int mask;
    private int size;
    private Entry[] table;
    private int threshold;
    
    public LongHashMap() {
        this(16, 0.75f);
    }
    
    public LongHashMap(final int n) {
        this(n, 0.75f);
    }
    
    public LongHashMap(final int n, final float loadFactor) {
        super();
        this.iterable = new EntryIterable();
        if (n > 1073741824) {
            throw new IllegalArgumentException("initialCapacity is too large.");
        }
        if (n < 0) {
            throw new IllegalArgumentException("initialCapacity must be greater than zero.");
        }
        if (loadFactor <= 0.0f) {
            throw new IllegalArgumentException("initialCapacity must be greater than zero.");
        }
        this.capacity = 1;
        while (this.capacity < n) {
            this.capacity <<= 1;
        }
        this.loadFactor = loadFactor;
        this.threshold = (int)(loadFactor * this.capacity);
        this.table = new Entry[this.capacity];
        this.mask = -1 + this.capacity;
    }
    
    public void clear() {
        final Entry[] table = this.table;
        int length = table.length;
        while (--length >= 0) {
            table[length] = null;
        }
        this.size = 0;
    }
    
    public boolean containsKey(final long n) {
        for (Entry next = this.table[(int)n & this.mask]; next != null; next = next.next) {
            if (next.key == n) {
                return true;
            }
        }
        return false;
    }
    
    public boolean containsValue(final Object o) {
        final Entry[] table = this.table;
        int length = table.length;
        while (true) {
            final int n = length - 1;
            if (length <= 0) {
                return false;
            }
            for (Entry next = table[n]; next != null; next = next.next) {
                if (next.value.equals(o)) {
                    return true;
                }
            }
            length = n;
        }
    }
    
    public T get(final long n) {
        for (Entry next = this.table[(int)(n & this.mask)]; next != null; next = next.next) {
            if (next.key == n) {
                return (T)next.value;
            }
        }
        return null;
    }
    
    public T put(final long n, final T value) {
        final int n2 = (int)(n & this.mask);
        for (Entry next = this.table[n2]; next != null; next = next.next) {
            if (next.key == n) {
                final Object value2 = next.value;
                next.value = value;
                return (T)value2;
            }
        }
        this.table[n2] = new Entry(n, value, this.table[n2]);
        if (this.size++ >= this.threshold) {
            final int capacity = 2 * this.capacity;
            final Entry[] table = new Entry[capacity];
            final Entry[] table2 = this.table;
            final int n3 = capacity - 1;
            for (int i = 0; i < table2.length; ++i) {
                Entry entry = table2[i];
                if (entry != null) {
                    table2[i] = null;
                    do {
                        final Entry next2 = entry.next;
                        final int n4 = (int)(entry.key & n3);
                        entry.next = table[n4];
                        table[n4] = entry;
                        entry = next2;
                    } while (entry != null);
                }
            }
            this.table = table;
            this.capacity = capacity;
            this.threshold = (int)(capacity * this.loadFactor);
            this.mask = -1 + this.capacity;
        }
        return null;
    }
    
    public T remove(final long n) {
        final int n2 = (int)(n & this.mask);
        Entry entry2;
        Entry next;
        for (Entry entry = entry2 = this.table[n2]; entry2 != null; entry2 = next) {
            next = entry2.next;
            if (entry2.key == n) {
                --this.size;
                if (entry == entry2) {
                    this.table[n2] = next;
                }
                else {
                    entry.next = next;
                }
                return (T)entry2.value;
            }
            entry = entry2;
        }
        return null;
    }
    
    public int size() {
        return this.size;
    }
    
    public Iterable<T> values() {
        this.iterable.reset();
        return this.iterable;
    }
    
    static class Entry
    {
        final long key;
        Entry next;
        Object value;
        
        Entry(final long key, final Object value, final Entry next) {
            super();
            this.key = key;
            this.value = value;
            this.next = next;
        }
    }
    
    class EntryIterable implements Iterable<T>
    {
        Entry currEntry;
        int currIndex;
        Iterator<T> iter;
        
        EntryIterable() {
            super();
            this.currIndex = -1;
            this.currEntry = null;
            this.iter = new Iterator<T>() {
                private boolean loadNextEntry() {
                    do {
                        final EntryIterable this$1 = EntryIterable.this;
                        ++this$1.currIndex;
                        if (EntryIterable.this.currIndex >= LongHashMap.this.table.length) {
                            return false;
                        }
                    } while (LongHashMap.this.table[EntryIterable.this.currIndex] == null);
                    EntryIterable.this.currEntry = LongHashMap.this.table[EntryIterable.this.currIndex];
                    return true;
                }
                
                @Override
                public boolean hasNext() {
                    if (EntryIterable.this.currEntry == null) {
                        if (this.loadNextEntry()) {
                            return true;
                        }
                    }
                    else {
                        if (EntryIterable.this.currEntry.next != null) {
                            EntryIterable.this.currEntry = EntryIterable.this.currEntry.next;
                            return true;
                        }
                        if (this.loadNextEntry()) {
                            return true;
                        }
                    }
                    return false;
                }
                
                @Override
                public T next() {
                    return (T)EntryIterable.this.currEntry.value;
                }
                
                @Override
                public void remove() {
                    throw new UnsupportedOperationException("not implemented");
                }
            };
        }
        
        @Override
        public Iterator<T> iterator() {
            return this.iter;
        }
        
        public void reset() {
            this.currIndex = -1;
            this.currEntry = null;
        }
    }
}
