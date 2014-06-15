package org.anddev.andengine.entity.text;

import org.anddev.andengine.entity.shape.*;
import org.anddev.andengine.opengl.font.*;
import org.anddev.andengine.opengl.texture.buffer.*;
import org.anddev.andengine.util.*;
import org.anddev.andengine.opengl.vertex.*;
import org.anddev.andengine.opengl.buffer.*;
import org.anddev.andengine.opengl.util.*;
import javax.microedition.khronos.opengles.*;
import org.anddev.andengine.engine.camera.*;

public class Text extends RectangularShape
{
    protected final int mCharactersMaximum;
    private final Font mFont;
    private String[] mLines;
    private int mMaximumLineWidth;
    private String mText;
    private final TextTextureBuffer mTextTextureBuffer;
    protected final int mVertexCount;
    private int[] mWidths;
    
    public Text(final float n, final float n2, final Font font, final String s) {
        this(n, n2, font, s, HorizontalAlign.LEFT);
    }
    
    public Text(final float n, final float n2, final Font font, final String s, final HorizontalAlign horizontalAlign) {
        this(n, n2, font, s, horizontalAlign, s.length() - StringUtils.countOccurrences(s, '\n'));
    }
    
    protected Text(final float n, final float n2, final Font mFont, final String s, final HorizontalAlign horizontalAlign, final int mCharactersMaximum) {
        super(n, n2, 0.0f, 0.0f, new TextVertexBuffer(mCharactersMaximum, horizontalAlign, 35044));
        this.mCharactersMaximum = mCharactersMaximum;
        this.mVertexCount = 6 * this.mCharactersMaximum;
        this.mTextTextureBuffer = new TextTextureBuffer(2 * this.mVertexCount, 35044);
        BufferObjectManager.getActiveInstance().loadBufferObject(this.mTextTextureBuffer);
        this.mFont = mFont;
        this.updateText(s);
        this.initBlendFunction();
    }
    
    private void applyTexture(final GL10 gl10) {
        if (GLHelper.EXTENSIONS_VERTEXBUFFEROBJECTS) {
            final GL11 gl2 = (GL11)gl10;
            this.mTextTextureBuffer.selectOnHardware(gl2);
            GLHelper.bindTexture(gl10, this.mFont.getTexture().getHardwareTextureID());
            GLHelper.texCoordZeroPointer(gl2);
            return;
        }
        GLHelper.bindTexture(gl10, this.mFont.getTexture().getHardwareTextureID());
        GLHelper.texCoordPointer(gl10, this.mTextTextureBuffer.getFloatBuffer());
    }
    
    private void initBlendFunction() {
        if (this.mFont.getTexture().getTextureOptions().mPreMultipyAlpha) {
            this.setBlendFunction(1, 771);
        }
    }
    
    @Override
    protected void drawVertices(final GL10 gl10, final Camera camera) {
        gl10.glDrawArrays(4, 0, this.mVertexCount);
    }
    
    public int getCharacterCount() {
        return this.mCharactersMaximum;
    }
    
    @Override
    public TextVertexBuffer getVertexBuffer() {
        return (TextVertexBuffer)super.getVertexBuffer();
    }
    
    @Override
    protected void onApplyTransformations(final GL10 gl10) {
        super.onApplyTransformations(gl10);
        this.applyTexture(gl10);
    }
    
    @Override
    protected void onInitDraw(final GL10 gl10) {
        super.onInitDraw(gl10);
        GLHelper.enableTextures(gl10);
        GLHelper.enableTexCoordArray(gl10);
    }
    
    @Override
    protected void onUpdateVertexBuffer() {
        final Font mFont = this.mFont;
        if (mFont != null) {
            this.getVertexBuffer().update(mFont, this.mMaximumLineWidth, this.mWidths, this.mLines);
        }
    }
    
    protected void updateText(final String mText) {
        this.mText = mText;
        final Font mFont = this.mFont;
        this.mLines = StringUtils.split(this.mText, '\n', this.mLines);
        final String[] mLines = this.mLines;
        final int length = mLines.length;
        int n;
        if (this.mWidths != null && this.mWidths.length == length) {
            n = 1;
        }
        else {
            n = 0;
        }
        if (n == 0) {
            this.mWidths = new int[length];
        }
        final int[] mWidths = this.mWidths;
        int max = 0;
        for (int i = length - 1; i >= 0; --i) {
            mWidths[i] = mFont.getStringWidth(mLines[i]);
            max = Math.max(max, mWidths[i]);
        }
        this.mMaximumLineWidth = max;
        super.mWidth = this.mMaximumLineWidth;
        final float mWidth = super.mWidth;
        super.mBaseWidth = mWidth;
        super.mHeight = length * mFont.getLineHeight() + (length - 1) * mFont.getLineGap();
        final float mHeight = super.mHeight;
        super.mBaseHeight = mHeight;
        this.mRotationCenterX = mWidth * 0.5f;
        this.mRotationCenterY = mHeight * 0.5f;
        this.mScaleCenterX = this.mRotationCenterX;
        this.mScaleCenterY = this.mRotationCenterY;
        this.mTextTextureBuffer.update(mFont, mLines);
        this.updateVertexBuffer();
    }
}
