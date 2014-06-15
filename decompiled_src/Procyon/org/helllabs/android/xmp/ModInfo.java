package org.helllabs.android.xmp;

class ModInfo
{
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
    
    public ModInfo(final String name, final String type, final String filename, final int chn, final int pat, final int ins, final int trk, final int smp, final int len, final int bpm, final int tpo, final int time) {
        super();
        this.name = name;
        this.type = type;
        this.filename = filename;
        this.chn = chn;
        this.pat = pat;
        this.ins = ins;
        this.trk = trk;
        this.smp = smp;
        this.len = len;
        this.bpm = bpm;
        this.tpo = tpo;
        this.time = time;
    }
}
