/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.graphics.Bitmap
 *  android.graphics.Bitmap$Config
 *  android.graphics.Canvas
 *  android.graphics.Paint
 *  android.graphics.Paint$FontMetrics
 *  android.graphics.Paint$Style
 *  android.graphics.Rect
 *  android.graphics.Typeface
 *  android.opengl.GLUtils
 *  android.util.FloatMath
 *  android.util.SparseArray
 *  javax.microedition.khronos.opengles.GL10
 */
package org.anddev.andengine.opengl.font;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.opengl.GLUtils;
import android.util.FloatMath;
import android.util.SparseArray;
import java.util.ArrayList;
import javax.microedition.khronos.opengles.GL10;
import org.anddev.andengine.opengl.font.Letter;
import org.anddev.andengine.opengl.font.Size;
import org.anddev.andengine.opengl.texture.Texture;
import org.anddev.andengine.opengl.util.GLHelper;

public class Font {
    private static final int LETTER_EXTRA_WIDTH = 10;
    protected static final float LETTER_LEFT_OFFSET;
    private final Paint mBackgroundPaint;
    protected final Canvas mCanvas = new Canvas();
    private final Size mCreateLetterTemporarySize = new Size();
    private int mCurrentTextureX = 0;
    private int mCurrentTextureY = 0;
    protected final Paint.FontMetrics mFontMetrics;
    private final Rect mGetLetterBitmapTemporaryRect = new Rect();
    private final Rect mGetLetterBoundsTemporaryRect = new Rect();
    private final Rect mGetStringWidthTemporaryRect = new Rect();
    private final ArrayList<Letter> mLettersPendingToBeDrawnToTexture = new ArrayList<Letter>();
    private final int mLineGap;
    private final int mLineHeight;
    private final SparseArray<Letter> mManagedCharacterToLetterMap = new SparseArray();
    protected final Paint mPaint;
    private final float[] mTemporaryTextWidthFetchers = new float[1];
    private final Texture mTexture;
    private final float mTextureHeight;
    private final float mTextureWidth;

    public Font(Texture texture, Typeface typeface, float f, boolean bl, int n) {
        this.mTexture = texture;
        this.mTextureWidth = texture.getWidth();
        this.mTextureHeight = texture.getHeight();
        this.mPaint = new Paint();
        this.mPaint.setTypeface(typeface);
        this.mPaint.setColor(n);
        this.mPaint.setTextSize(f);
        this.mPaint.setAntiAlias(bl);
        this.mBackgroundPaint = new Paint();
        this.mBackgroundPaint.setColor(0);
        this.mBackgroundPaint.setStyle(Paint.Style.FILL);
        this.mFontMetrics = this.mPaint.getFontMetrics();
        this.mLineHeight = (int)FloatMath.ceil((float)(Math.abs(this.mFontMetrics.ascent) + Math.abs(this.mFontMetrics.descent)));
        this.mLineGap = (int)FloatMath.ceil((float)this.mFontMetrics.leading);
    }

    private Letter createLetter(char c) {
        float f = this.mTextureWidth;
        float f2 = this.mTextureHeight;
        Size size = this.mCreateLetterTemporarySize;
        this.getLetterBounds(c, size);
        float f3 = size.getWidth();
        float f4 = size.getHeight();
        if (f3 + (float)this.mCurrentTextureX >= f) {
            this.mCurrentTextureX = 0;
            this.mCurrentTextureY+=this.getLineGap() + this.getLineHeight();
        }
        float f5 = (float)this.mCurrentTextureX / f;
        float f6 = (float)this.mCurrentTextureY / f2;
        float f7 = f3 / f;
        float f8 = f4 / f2;
        Letter letter = new Letter(c, this.getLetterAdvance(c), (int)f3, (int)f4, f5, f6, f7, f8);
        this.mCurrentTextureX = (int)(f3 + (float)this.mCurrentTextureX);
        return letter;
    }

    private int getLetterAdvance(char c) {
        this.mPaint.getTextWidths(String.valueOf(c), this.mTemporaryTextWidthFetchers);
        return (int)FloatMath.ceil((float)this.mTemporaryTextWidthFetchers[0]);
    }

    /*
     * Enabled aggressive block sorting
     */
    private Bitmap getLetterBitmap(char c) {
        int n = 1;
        Rect rect = this.mGetLetterBitmapTemporaryRect;
        String string = String.valueOf(c);
        this.mPaint.getTextBounds(string, 0, n, rect);
        int n2 = this.getLineHeight();
        if (rect.width() != 0) {
            n = 10 + rect.width();
        }
        Bitmap bitmap = Bitmap.createBitmap((int)n, (int)n2, (Bitmap.Config)Bitmap.Config.ARGB_8888);
        this.mCanvas.setBitmap(bitmap);
        this.mCanvas.drawRect(0.0f, 0.0f, (float)(10 + rect.width()), (float)n2, this.mBackgroundPaint);
        this.drawCharacterString(string);
        return bitmap;
    }

    private void getLetterBounds(char c, Size size) {
        this.mPaint.getTextBounds(String.valueOf(c), 0, 1, this.mGetLetterBoundsTemporaryRect);
        size.set(10 + this.mGetLetterBoundsTemporaryRect.width(), this.getLineHeight());
    }

    protected void drawCharacterString(String string) {
        this.mCanvas.drawText(string, 0.0f, - this.mFontMetrics.ascent, this.mPaint);
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     */
    public Letter getLetter(char c) {
        synchronized (this) {
            SparseArray<Letter> sparseArray = this.mManagedCharacterToLetterMap;
            Letter letter = (Letter)sparseArray.get((int)c);
            if (letter != null) return letter;
            letter = this.createLetter(c);
            this.mLettersPendingToBeDrawnToTexture.add(letter);
            sparseArray.put((int)c, (Object)letter);
            return letter;
        }
    }

    public int getLineGap() {
        return this.mLineGap;
    }

    public int getLineHeight() {
        return this.mLineHeight;
    }

    public int getStringWidth(String string) {
        this.mPaint.getTextBounds(string, 0, string.length(), this.mGetStringWidthTemporaryRect);
        return this.mGetStringWidthTemporaryRect.width();
    }

    public Texture getTexture() {
        return this.mTexture;
    }

    public void reload() {
        synchronized (this) {
            ArrayList<Letter> arrayList = this.mLettersPendingToBeDrawnToTexture;
            SparseArray<Letter> sparseArray = this.mManagedCharacterToLetterMap;
            int n = sparseArray.size();
            int n2 = n - 1;
            do {
                if (n2 < 0) {
                    return;
                }
                arrayList.add((Letter)sparseArray.valueAt(n2));
                --n2;
            } while (true);
        }
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     */
    public void update(GL10 gL10) {
        synchronized (this) {
            ArrayList<Letter> arrayList = this.mLettersPendingToBeDrawnToTexture;
            if (arrayList.size() <= 0) return;
            int n = this.mTexture.getHardwareTextureID();
            float f = this.mTextureWidth;
            float f2 = this.mTextureHeight;
            for (int i = -1 + arrayList.size(); i >= 0; --i) {
                Letter letter = arrayList.get(i);
                Bitmap bitmap = this.getLetterBitmap(letter.mCharacter);
                GLHelper.bindTexture(gL10, n);
                GLUtils.texSubImage2D((int)3553, (int)0, (int)((int)(f * letter.mTextureX)), (int)((int)(f2 * letter.mTextureY)), (Bitmap)bitmap);
                bitmap.recycle();
            }
            arrayList.clear();
            System.gc();
            return;
        }
    }
}

