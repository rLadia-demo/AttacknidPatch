/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  javax.microedition.khronos.opengles.GL10
 *  javax.microedition.khronos.opengles.GL11
 */
package org.anddev.andengine.entity.text;

import javax.microedition.khronos.opengles.GL10;
import javax.microedition.khronos.opengles.GL11;
import org.anddev.andengine.engine.camera.Camera;
import org.anddev.andengine.entity.shape.RectangularShape;
import org.anddev.andengine.opengl.buffer.BufferObject;
import org.anddev.andengine.opengl.buffer.BufferObjectManager;
import org.anddev.andengine.opengl.font.Font;
import org.anddev.andengine.opengl.texture.Texture;
import org.anddev.andengine.opengl.texture.buffer.TextTextureBuffer;
import org.anddev.andengine.opengl.util.FastFloatBuffer;
import org.anddev.andengine.opengl.util.GLHelper;
import org.anddev.andengine.opengl.vertex.TextVertexBuffer;
import org.anddev.andengine.opengl.vertex.VertexBuffer;
import org.anddev.andengine.util.HorizontalAlign;
import org.anddev.andengine.util.StringUtils;

public class Text
extends RectangularShape {
    protected final int mCharactersMaximum;
    private final Font mFont;
    private String[] mLines;
    private int mMaximumLineWidth;
    private String mText;
    private final TextTextureBuffer mTextTextureBuffer;
    protected final int mVertexCount;
    private int[] mWidths;

    public Text(float f, float f2, Font font, String string) {
        this(f, f2, font, string, HorizontalAlign.LEFT);
    }

    public Text(float f, float f2, Font font, String string, HorizontalAlign horizontalAlign) {
        this(f, f2, font, string, horizontalAlign, string.length() - StringUtils.countOccurrences(string, '\u000a'));
    }

    protected Text(float f, float f2, Font font, String string, HorizontalAlign horizontalAlign, int n) {
        super(f, f2, 0.0f, 0.0f, new TextVertexBuffer(n, horizontalAlign, 35044));
        this.mCharactersMaximum = n;
        this.mVertexCount = 6 * this.mCharactersMaximum;
        this.mTextTextureBuffer = new TextTextureBuffer(2 * this.mVertexCount, 35044);
        BufferObjectManager.getActiveInstance().loadBufferObject(this.mTextTextureBuffer);
        this.mFont = font;
        this.updateText(string);
        this.initBlendFunction();
    }

    private void applyTexture(GL10 gL10) {
        if (GLHelper.EXTENSIONS_VERTEXBUFFEROBJECTS) {
            GL11 gL11 = (GL11)gL10;
            this.mTextTextureBuffer.selectOnHardware(gL11);
            GLHelper.bindTexture(gL10, this.mFont.getTexture().getHardwareTextureID());
            GLHelper.texCoordZeroPointer(gL11);
            return;
        }
        GLHelper.bindTexture(gL10, this.mFont.getTexture().getHardwareTextureID());
        GLHelper.texCoordPointer(gL10, this.mTextTextureBuffer.getFloatBuffer());
    }

    private void initBlendFunction() {
        if (!this.mFont.getTexture().getTextureOptions().mPreMultipyAlpha) return;
        this.setBlendFunction(1, 771);
    }

    @Override
    protected void drawVertices(GL10 gL10, Camera camera) {
        gL10.glDrawArrays(4, 0, this.mVertexCount);
    }

    public int getCharacterCount() {
        return this.mCharactersMaximum;
    }

    @Override
    public TextVertexBuffer getVertexBuffer() {
        return (TextVertexBuffer)super.getVertexBuffer();
    }

    @Override
    protected void onApplyTransformations(GL10 gL10) {
        super.onApplyTransformations(gL10);
        this.applyTexture(gL10);
    }

    @Override
    protected void onInitDraw(GL10 gL10) {
        super.onInitDraw(gL10);
        GLHelper.enableTextures(gL10);
        GLHelper.enableTexCoordArray(gL10);
    }

    @Override
    protected void onUpdateVertexBuffer() {
        Font font = this.mFont;
        if (font == null) return;
        this.getVertexBuffer().update(font, this.mMaximumLineWidth, this.mWidths, this.mLines);
    }

    /*
     * Enabled aggressive block sorting
     */
    protected void updateText(String string) {
        float f;
        float f2;
        this.mText = string;
        Font font = this.mFont;
        String[] arrstring = this.mLines = StringUtils.split(this.mText, '\u000a', this.mLines);
        int n = arrstring.length;
        boolean bl = this.mWidths != null && this.mWidths.length == n;
        if (!bl) {
            this.mWidths = new int[n];
        }
        int[] arrn = this.mWidths;
        int n2 = 0;
        for (int i = n - 1; i >= 0; --i) {
            arrn[i] = font.getStringWidth(arrstring[i]);
            n2 = Math.max(n2, arrn[i]);
        }
        this.mMaximumLineWidth = n2;
        this.mBaseWidth = f = (this.mWidth = (float)this.mMaximumLineWidth);
        this.mBaseHeight = f2 = (this.mHeight = (float)(n * font.getLineHeight() + (n - 1) * font.getLineGap()));
        this.mRotationCenterX = f * 0.5f;
        this.mRotationCenterY = f2 * 0.5f;
        this.mScaleCenterX = this.mRotationCenterX;
        this.mScaleCenterY = this.mRotationCenterY;
        this.mTextTextureBuffer.update(font, arrstring);
        this.updateVertexBuffer();
    }
}

