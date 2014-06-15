/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  javax.microedition.khronos.opengles.GL10
 */
package org.anddev.andengine.opengl.texture;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import javax.microedition.khronos.opengles.GL10;
import org.anddev.andengine.opengl.texture.Texture;

public class TextureManager {
    private final ArrayList<Texture> mTexturesLoaded = new ArrayList<Texture>();
    private final HashSet<Texture> mTexturesManaged = new HashSet<Texture>();
    private final ArrayList<Texture> mTexturesToBeLoaded = new ArrayList<Texture>();
    private final ArrayList<Texture> mTexturesToBeUnloaded = new ArrayList<Texture>();

    protected void clear() {
        this.mTexturesToBeLoaded.clear();
        this.mTexturesLoaded.clear();
        this.mTexturesManaged.clear();
    }

    public boolean loadTexture(Texture texture) {
        if (this.mTexturesManaged.contains(texture)) {
            this.mTexturesToBeUnloaded.remove(texture);
            return false;
        }
        this.mTexturesManaged.add(texture);
        this.mTexturesToBeLoaded.add(texture);
        return true;
    }

    public /* varargs */ void loadTextures(Texture ... arrtexture) {
        int n = -1 + arrtexture.length;
        while (n >= 0) {
            this.loadTexture(arrtexture[n]);
            --n;
        }
        return;
    }

    public void reloadTextures() {
        Iterator<Texture> iterator = this.mTexturesManaged.iterator();
        do {
            if (!iterator.hasNext()) {
                this.mTexturesToBeLoaded.addAll(this.mTexturesLoaded);
                this.mTexturesLoaded.clear();
                this.mTexturesManaged.removeAll(this.mTexturesToBeUnloaded);
                this.mTexturesToBeUnloaded.clear();
                return;
            }
            iterator.next().setLoadedToHardware(false);
        } while (true);
    }

    /*
     * Enabled aggressive block sorting
     */
    public boolean unloadTexture(Texture texture) {
        if (!this.mTexturesManaged.contains(texture)) return false;
        if (this.mTexturesLoaded.contains(texture)) {
            this.mTexturesToBeUnloaded.add(texture);
            return true;
        } else {
            if (!this.mTexturesToBeLoaded.remove(texture)) return true;
            this.mTexturesManaged.remove(texture);
        }
        return true;
    }

    public /* varargs */ void unloadTextures(Texture ... arrtexture) {
        int n = -1 + arrtexture.length;
        while (n >= 0) {
            this.unloadTexture(arrtexture[n]);
            --n;
        }
        return;
    }

    /*
     * Unable to fully structure code
     * Enabled aggressive block sorting
     */
    public void updateTextures(GL10 var1_1) {
        var2_2 = this.mTexturesManaged;
        var3_3 = this.mTexturesLoaded;
        var4_4 = this.mTexturesToBeLoaded;
        var5_5 = this.mTexturesToBeUnloaded;
        var6_6 = var3_3.size();
        ** if (var6_6 <= 0) goto lbl-1000
lbl7: // 1 sources:
        var16_7 = var6_6 - 1;
        do {
            if (var16_7 < 0) lbl-1000: // 2 sources:
            {
                if ((var7_9 = var4_4.size()) > 0) {
                    break;
                } else {
                    ** GOTO lbl-1000
                }
            }
            if ((var17_8 = var3_3.get(var16_7)).isUpdateOnHardwareNeeded()) {
                var17_8.unloadFromHardware(var1_1);
                var17_8.loadToHardware(var1_1);
            }
            --var16_7;
        } while (true);
        var13_10 = var7_9 - 1;
        do {
            if (var13_10 < 0) lbl-1000: // 3 sources:
            {
                if ((var8_12 = var5_5.size()) > 0) {
                    break;
                } else {
                    ** GOTO lbl-1000
                }
            }
            if (!(var14_11 = var4_4.remove(var13_10)).isLoadedToHardware()) {
                var14_11.loadToHardware(var1_1);
            }
            var3_3.add(var14_11);
            --var13_10;
        } while (true);
        var9_13 = var8_12 - 1;
        do {
            if (var9_13 < 0) lbl-1000: // 3 sources:
            {
                if (var7_9 <= 0) {
                    if (var8_12 <= 0) return;
                }
                System.gc();
                return;
            }
            if ((var10_14 = var5_5.remove(var9_13)).isLoadedToHardware()) {
                var10_14.unloadFromHardware(var1_1);
            }
            var3_3.remove(var10_14);
            var2_2.remove(var10_14);
            --var9_13;
        } while (true);
    }
}

