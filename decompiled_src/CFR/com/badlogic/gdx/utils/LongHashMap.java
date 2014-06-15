/*
 * Decompiled with CFR 0_79.
 */
package com.badlogic.gdx.utils;

import java.util.Iterator;

public class LongHashMap<T> {
    private int capacity;
    LongHashMap<T> iterable;
    private float loadFactor;
    private int mask;
    private int size;
    private Entry[] table;
    private int threshold;

    public LongHashMap() {
        this(16, 0.75f);
    }

    public LongHashMap(int n) {
        this(n, 0.75f);
    }

    public LongHashMap(int n, float f) {
        this.iterable = new EntryIterable();
        if (n > 1073741824) {
            throw new IllegalArgumentException("initialCapacity is too large.");
        }
        if (n < 0) {
            throw new IllegalArgumentException("initialCapacity must be greater than zero.");
        }
        if (f <= 0.0f) {
            throw new IllegalArgumentException("initialCapacity must be greater than zero.");
        }
        this.capacity = 1;
        do {
            if (this.capacity >= n) {
                this.loadFactor = f;
                this.threshold = (int)(f * (float)this.capacity);
                this.table = new Entry[this.capacity];
                this.mask = -1 + this.capacity;
                return;
            }
            --this.capacity;
        } while (true);
    }

    public void clear() {
        Entry[] arrentry = this.table;
        int n = arrentry.length;
        do {
            if (--n < 0) {
                this.size = 0;
                return;
            }
            arrentry[n] = null;
        } while (true);
    }

    public boolean containsKey(long l) {
        int n = (int)l & this.mask;
        Entry entry = this.table[n];
        while (entry != null) {
            if (entry.key == l) {
                return true;
            }
            entry = entry.next;
        }
        return false;
    }

    public boolean containsValue(Object object) {
        Entry[] arrentry = this.table;
        int n = arrentry.length;
        block0 : do {
            int n2 = n - 1;
            if (n <= 0) {
                return false;
            }
            Entry entry = arrentry[n2];
            do {
                if (entry == null) {
                    n = n2;
                    continue block0;
                }
                if (entry.value.equals(object)) {
                    return true;
                }
                entry = entry.next;
            } while (true);
            break;
        } while (true);
    }

    public T get(long l) {
        int n = (int)(l & (long)this.mask);
        Entry entry = this.table[n];
        while (entry != null) {
            if (entry.key == l) {
                return entry.value;
            }
            entry = entry.next;
        }
        return null;
    }

    /*
     * Unable to fully structure code
     * Enabled aggressive block sorting
     */
    public T put(long var1_1, T var3_2) {
        block4 : {
            var4_3 = (int)(var1_1 & (long)this.mask);
            var5_4 = this.table[var4_3];
            do {
                if (var5_4 == null) {
                    this.table[var4_3] = new Entry(var1_1, var3_2, this.table[var4_3]);
                    var7_5 = this.size;
                    this.size = var7_5 + 1;
                    if (var7_5 < this.threshold) return null;
                    break block4;
                }
                if (var5_4.key == var1_1) break;
                var5_4 = var5_4.next;
            } while (true);
            var6_14 = var5_4.value;
            var5_4.value = var3_2;
            return var6_14;
        }
        var8_6 = 2 * this.capacity;
        var9_7 = new Entry[var8_6];
        var10_8 = this.table;
        var11_9 = var8_6 - 1;
        var12_10 = 0;
        do {
            ** if (var12_10 >= var10_8.length) goto lbl26
lbl24: // 1 sources:
            ** if ((var13_11 = var10_8[var12_10]) == null) goto lbl38
lbl25: // 1 sources:
            ** GOTO lbl31
lbl26: // 1 sources:
            this.table = var9_7;
            this.capacity = var8_6;
            this.threshold = (int)((float)var8_6 * this.loadFactor);
            this.mask = -1 + this.capacity;
            return null;
lbl31: // 1 sources:
            var10_8[var12_10] = null;
            do {
                var14_12 = var13_11.next;
                var15_13 = (int)(var13_11.key & (long)var11_9);
                var13_11.next = var9_7[var15_13];
                var9_7[var15_13] = var13_11;
            } while ((var13_11 = var14_12) != null);
lbl38: // 2 sources:
            ++var12_10;
        } while (true);
    }

    /*
     * Enabled aggressive block sorting
     */
    public T remove(long l) {
        Entry entry;
        int n = (int)(l & (long)this.mask);
        Entry entry2 = entry = this.table[n];
        while (entry2 != null) {
            Entry entry3 = entry2.next;
            if (entry2.key == l) {
                this.size = -1 + this.size;
                if (entry == entry2) {
                    this.table[n] = entry3;
                    return entry2.value;
                } else {
                    entry.next = entry3;
                }
                return entry2.value;
            }
            entry = entry2;
            entry2 = entry3;
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

    static class Entry {
        final long key;
        Entry next;
        Object value;

        Entry(long l, Object object, Entry entry) {
            this.key = l;
            this.value = object;
            this.next = entry;
        }
    }

    class EntryIterable
    implements Iterable<T> {
        Entry currEntry;
        int currIndex;
        Iterator<T> iter;

        EntryIterable() {
            this.currIndex = -1;
            this.currEntry = null;
            this.iter = new Iterator<T>(){

                private boolean loadNextEntry() {
                    do {
                        EntryIterable entryIterable = EntryIterable.this;
                        entryIterable.currIndex = 1 + entryIterable.currIndex;
                        if (EntryIterable.this.currIndex < EntryIterable.this.LongHashMap.this.table.length) continue;
                        return false;
                    } while (EntryIterable.this.LongHashMap.this.table[EntryIterable.this.currIndex] == null);
                    EntryIterable.this.currEntry = EntryIterable.this.LongHashMap.this.table[EntryIterable.this.currIndex];
                    return true;
                }

                /*
                 * Enabled aggressive block sorting
                 */
                @Override
                public boolean hasNext() {
                    if (EntryIterable.this.currEntry == null) {
                        if (this.loadNextEntry()) return true;
                        return false;
                    }
                    if (EntryIterable.this.currEntry.next == null) {
                        if (!this.loadNextEntry()) return false;
                        return true;
                    } else {
                        EntryIterable.this.currEntry = EntryIterable.this.currEntry.next;
                    }
                    return true;
                }

                @Override
                public T next() {
                    return EntryIterable.this.currEntry.value;
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

