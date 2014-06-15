/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.opengl.texture.buffer;

import org.anddev.andengine.opengl.buffer.BufferObject;
import org.anddev.andengine.opengl.font.Font;
import org.anddev.andengine.opengl.font.Letter;
import org.anddev.andengine.opengl.util.FastFloatBuffer;

public class TextTextureBuffer
extends BufferObject {
    public TextTextureBuffer(int n, int n2) {
        super(n, n2);
    }

    /*
     * Unable to fully structure code
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Converted monitor instructions to comments
     */
    public void update(Font var1_1, String[] var2_2) {
        // MONITORENTER : this
        var4_3 = this.getFloatBuffer();
        var4_3.position(0);
        var5_4 = var2_2.length;
        var6_5 = 0;
        do {
            ** if (var6_5 >= var5_4) goto lbl12
lbl8: // 1 sources:
            var7_6 = var2_2[var6_5];
            var8_7 = var7_6.length();
            var9_8 = 0;
            ** GOTO lbl34
lbl12: // 1 sources:
            var4_3.position(0);
            this.setHardwareBufferNeedsUpdate();
            // MONITOREXIT : this
            return;
lbl-1000: // 1 sources:
            {
                var10_9 = var1_1.getLetter(var7_6.charAt(var9_8));
                var11_10 = var10_9.mTextureX;
                var12_11 = var10_9.mTextureY;
                var13_12 = var11_10 + var10_9.mTextureWidth;
                var14_13 = var12_11 + var10_9.mTextureHeight;
                var4_3.put(var11_10);
                var4_3.put(var12_11);
                var4_3.put(var11_10);
                var4_3.put(var14_13);
                var4_3.put(var13_12);
                var4_3.put(var14_13);
                var4_3.put(var13_12);
                var4_3.put(var14_13);
                var4_3.put(var13_12);
                var4_3.put(var12_11);
                var4_3.put(var11_10);
                var4_3.put(var12_11);
                ++var9_8;
lbl34: // 2 sources:
                ** while (var9_8 < var8_7)
            }
lbl35: // 1 sources:
            ++var6_5;
        } while (true);
    }
}

