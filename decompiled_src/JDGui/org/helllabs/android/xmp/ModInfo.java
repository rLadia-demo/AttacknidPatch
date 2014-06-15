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
  
  public ModInfo(String paramString1, String paramString2, String paramString3, int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8, int paramInt9)
  {
    this.name = paramString1;
    this.type = paramString2;
    this.filename = paramString3;
    this.chn = paramInt1;
    this.pat = paramInt2;
    this.ins = paramInt3;
    this.trk = paramInt4;
    this.smp = paramInt5;
    this.len = paramInt6;
    this.bpm = paramInt7;
    this.tpo = paramInt8;
    this.time = paramInt9;
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.helllabs.android.xmp.ModInfo
 * JD-Core Version:    0.7.0.1
 */