/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.opengl.font;

public class Letter {
    public final int mAdvance;
    public final char mCharacter;
    public final int mHeight;
    public final float mTextureHeight;
    public final float mTextureWidth;
    public final float mTextureX;
    public final float mTextureY;
    public final int mWidth;

    Letter(char c, int n, int n2, int n3, float f, float f2, float f3, float f4) {
        this.mCharacter = c;
        this.mAdvance = n;
        this.mWidth = n2;
        this.mHeight = n3;
        this.mTextureX = f;
        this.mTextureY = f2;
        this.mTextureWidth = f3;
        this.mTextureHeight = f4;
    }

    /*
     * Enabled aggressive block sorting
     */
    public boolean equals(Object object) {
        if (this == object) {
            return true;
        }
        if (object == null) {
            return false;
        }
        if (this.getClass() != object.getClass()) {
            return false;
        }
        Letter letter = (Letter)object;
        if (this.mCharacter == letter.mCharacter) return true;
        return false;
    }

    public int hashCode() {
        return 31 + this.mCharacter;
    }
}

