/*
 * Decompiled with CFR 0_79.
 */
package org.helllabs.android.xmp;

class ModInfo {
    int bpm;
    int chn;
    String filename;
    int ins;
    int len;
    String name;
    int pat;
    int smp;
    int time;
    int tpo;
    int trk;
    String type;

    public ModInfo(String string, String string2, String string3, int n, int n2, int n3, int n4, int n5, int n6, int n7, int n8, int n9) {
        this.name = string;
        this.type = string2;
        this.filename = string3;
        this.chn = n;
        this.pat = n2;
        this.ins = n3;
        this.trk = n4;
        this.smp = n5;
        this.len = n6;
        this.bpm = n7;
        this.tpo = n8;
        this.time = n9;
    }
}

