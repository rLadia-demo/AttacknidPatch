package org.anddev.andengine.opengl.font;

public class Letter
{
    public final int mAdvance;
    public final char mCharacter;
    public final int mHeight;
    public final float mTextureHeight;
    public final float mTextureWidth;
    public final float mTextureX;
    public final float mTextureY;
    public final int mWidth;
    
    Letter(final char mCharacter, final int mAdvance, final int mWidth, final int mHeight, final float mTextureX, final float mTextureY, final float mTextureWidth, final float mTextureHeight) {
        super();
        this.mCharacter = mCharacter;
        this.mAdvance = mAdvance;
        this.mWidth = mWidth;
        this.mHeight = mHeight;
        this.mTextureX = mTextureX;
        this.mTextureY = mTextureY;
        this.mTextureWidth = mTextureWidth;
        this.mTextureHeight = mTextureHeight;
    }
    
    @Override
    public boolean equals(final Object o) {
        if (this != o) {
            if (o == null) {
                return false;
            }
            if (this.getClass() != o.getClass()) {
                return false;
            }
            if (this.mCharacter != ((Letter)o).mCharacter) {
                return false;
            }
        }
        return true;
    }
    
    @Override
    public int hashCode() {
        return '\u001f' + this.mCharacter;
    }
}
