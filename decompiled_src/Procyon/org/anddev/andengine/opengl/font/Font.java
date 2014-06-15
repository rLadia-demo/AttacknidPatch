package org.anddev.andengine.opengl.font;

import java.util.*;
import org.anddev.andengine.opengl.texture.*;
import android.util.*;
import android.graphics.*;
import javax.microedition.khronos.opengles.*;
import org.anddev.andengine.opengl.util.*;
import android.opengl.*;

public class Font
{
    private static final int LETTER_EXTRA_WIDTH = 10;
    protected static final float LETTER_LEFT_OFFSET;
    private final Paint mBackgroundPaint;
    protected final Canvas mCanvas;
    private final Size mCreateLetterTemporarySize;
    private int mCurrentTextureX;
    private int mCurrentTextureY;
    protected final Paint$FontMetrics mFontMetrics;
    private final Rect mGetLetterBitmapTemporaryRect;
    private final Rect mGetLetterBoundsTemporaryRect;
    private final Rect mGetStringWidthTemporaryRect;
    private final ArrayList<Letter> mLettersPendingToBeDrawnToTexture;
    private final int mLineGap;
    private final int mLineHeight;
    private final SparseArray<Letter> mManagedCharacterToLetterMap;
    protected final Paint mPaint;
    private final float[] mTemporaryTextWidthFetchers;
    private final Texture mTexture;
    private final float mTextureHeight;
    private final float mTextureWidth;
    
    public Font(final Texture mTexture, final Typeface typeface, final float textSize, final boolean antiAlias, final int color) {
        super();
        this.mCurrentTextureX = 0;
        this.mCurrentTextureY = 0;
        this.mManagedCharacterToLetterMap = (SparseArray<Letter>)new SparseArray();
        this.mLettersPendingToBeDrawnToTexture = new ArrayList<Letter>();
        this.mCreateLetterTemporarySize = new Size();
        this.mGetLetterBitmapTemporaryRect = new Rect();
        this.mGetStringWidthTemporaryRect = new Rect();
        this.mGetLetterBoundsTemporaryRect = new Rect();
        this.mTemporaryTextWidthFetchers = new float[1];
        this.mCanvas = new Canvas();
        this.mTexture = mTexture;
        this.mTextureWidth = mTexture.getWidth();
        this.mTextureHeight = mTexture.getHeight();
        (this.mPaint = new Paint()).setTypeface(typeface);
        this.mPaint.setColor(color);
        this.mPaint.setTextSize(textSize);
        this.mPaint.setAntiAlias(antiAlias);
        (this.mBackgroundPaint = new Paint()).setColor(0);
        this.mBackgroundPaint.setStyle(Paint$Style.FILL);
        this.mFontMetrics = this.mPaint.getFontMetrics();
        this.mLineHeight = (int)FloatMath.ceil(Math.abs(this.mFontMetrics.ascent) + Math.abs(this.mFontMetrics.descent));
        this.mLineGap = (int)FloatMath.ceil(this.mFontMetrics.leading);
    }
    
    private Letter createLetter(final char c) {
        final float mTextureWidth = this.mTextureWidth;
        final float mTextureHeight = this.mTextureHeight;
        final Size mCreateLetterTemporarySize = this.mCreateLetterTemporarySize;
        this.getLetterBounds(c, mCreateLetterTemporarySize);
        final float width = mCreateLetterTemporarySize.getWidth();
        final float height = mCreateLetterTemporarySize.getHeight();
        if (width + this.mCurrentTextureX >= mTextureWidth) {
            this.mCurrentTextureX = 0;
            this.mCurrentTextureY += this.getLineGap() + this.getLineHeight();
        }
        final Letter letter = new Letter(c, this.getLetterAdvance(c), (int)width, (int)height, this.mCurrentTextureX / mTextureWidth, this.mCurrentTextureY / mTextureHeight, width / mTextureWidth, height / mTextureHeight);
        this.mCurrentTextureX += (int)width;
        return letter;
    }
    
    private int getLetterAdvance(final char c) {
        this.mPaint.getTextWidths(String.valueOf(c), this.mTemporaryTextWidthFetchers);
        return (int)FloatMath.ceil(this.mTemporaryTextWidthFetchers[0]);
    }
    
    private Bitmap getLetterBitmap(final char c) {
        int n = 1;
        final Rect mGetLetterBitmapTemporaryRect = this.mGetLetterBitmapTemporaryRect;
        final String value = String.valueOf(c);
        this.mPaint.getTextBounds(value, 0, n, mGetLetterBitmapTemporaryRect);
        final int lineHeight = this.getLineHeight();
        if (mGetLetterBitmapTemporaryRect.width() != 0) {
            n = 10 + mGetLetterBitmapTemporaryRect.width();
        }
        final Bitmap bitmap = Bitmap.createBitmap(n, lineHeight, Bitmap$Config.ARGB_8888);
        this.mCanvas.setBitmap(bitmap);
        this.mCanvas.drawRect(0.0f, 0.0f, (float)(10 + mGetLetterBitmapTemporaryRect.width()), (float)lineHeight, this.mBackgroundPaint);
        this.drawCharacterString(value);
        return bitmap;
    }
    
    private void getLetterBounds(final char c, final Size size) {
        this.mPaint.getTextBounds(String.valueOf(c), 0, 1, this.mGetLetterBoundsTemporaryRect);
        size.set(10 + this.mGetLetterBoundsTemporaryRect.width(), this.getLineHeight());
    }
    
    protected void drawCharacterString(final String s) {
        this.mCanvas.drawText(s, 0.0f, -this.mFontMetrics.ascent, this.mPaint);
    }
    
    public Letter getLetter(final char c) {
        synchronized (this) {
            final SparseArray<Letter> mManagedCharacterToLetterMap = this.mManagedCharacterToLetterMap;
            Letter letter = (Letter)mManagedCharacterToLetterMap.get((int)c);
            if (letter == null) {
                letter = this.createLetter(c);
                this.mLettersPendingToBeDrawnToTexture.add(letter);
                mManagedCharacterToLetterMap.put((int)c, (Object)letter);
            }
            return letter;
        }
    }
    
    public int getLineGap() {
        return this.mLineGap;
    }
    
    public int getLineHeight() {
        return this.mLineHeight;
    }
    
    public int getStringWidth(final String s) {
        this.mPaint.getTextBounds(s, 0, s.length(), this.mGetStringWidthTemporaryRect);
        return this.mGetStringWidthTemporaryRect.width();
    }
    
    public Texture getTexture() {
        return this.mTexture;
    }
    
    public void reload() {
        synchronized (this) {
            final ArrayList<Letter> mLettersPendingToBeDrawnToTexture = this.mLettersPendingToBeDrawnToTexture;
            final SparseArray<Letter> mManagedCharacterToLetterMap = this.mManagedCharacterToLetterMap;
            for (int i = mManagedCharacterToLetterMap.size() - 1; i >= 0; --i) {
                mLettersPendingToBeDrawnToTexture.add((Letter)mManagedCharacterToLetterMap.valueAt(i));
            }
        }
    }
    
    public void update(final GL10 gl10) {
        synchronized (this) {
            final ArrayList<Letter> mLettersPendingToBeDrawnToTexture = this.mLettersPendingToBeDrawnToTexture;
            if (mLettersPendingToBeDrawnToTexture.size() > 0) {
                final int hardwareTextureID = this.mTexture.getHardwareTextureID();
                final float mTextureWidth = this.mTextureWidth;
                final float mTextureHeight = this.mTextureHeight;
                for (int i = -1 + mLettersPendingToBeDrawnToTexture.size(); i >= 0; --i) {
                    final Letter letter = mLettersPendingToBeDrawnToTexture.get(i);
                    final Bitmap letterBitmap = this.getLetterBitmap(letter.mCharacter);
                    GLHelper.bindTexture(gl10, hardwareTextureID);
                    GLUtils.texSubImage2D(3553, 0, (int)(mTextureWidth * letter.mTextureX), (int)(mTextureHeight * letter.mTextureY), letterBitmap);
                    letterBitmap.recycle();
                }
                mLettersPendingToBeDrawnToTexture.clear();
                System.gc();
            }
        }
    }
}
