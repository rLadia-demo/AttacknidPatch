/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  javax.microedition.khronos.opengles.GL10
 */
package org.anddev.andengine.entity.text;

import javax.microedition.khronos.opengles.GL10;
import org.anddev.andengine.engine.camera.Camera;
import org.anddev.andengine.entity.text.Text;
import org.anddev.andengine.opengl.font.Font;
import org.anddev.andengine.util.HorizontalAlign;
import org.anddev.andengine.util.StringUtils;

public class ChangeableText
extends Text {
    private static final String ELLIPSIS = "...";
    private static final int ELLIPSIS_CHARACTER_COUNT = "...".length();
    private int mCharacterCountCurrentText;

    public ChangeableText(float f, float f2, Font font, String string) {
        this(f, f2, font, string, string.length() - StringUtils.countOccurrences(string, '\u000a'));
    }

    public ChangeableText(float f, float f2, Font font, String string, int n) {
        this(f, f2, font, string, HorizontalAlign.LEFT, n);
    }

    public ChangeableText(float f, float f2, Font font, String string, HorizontalAlign horizontalAlign, int n) {
        super(f, f2, font, string, horizontalAlign, n);
        this.mCharacterCountCurrentText = string.length() - StringUtils.countOccurrences(string, '\u000a');
    }

    @Override
    protected void drawVertices(GL10 gL10, Camera camera) {
        gL10.glDrawArrays(4, 0, 6 * this.mCharacterCountCurrentText);
    }

    public void setText(String string) {
        this.setText(string, false);
    }

    /*
     * Enabled aggressive block sorting
     */
    public void setText(String string, boolean bl) {
        int n = string.length() - StringUtils.countOccurrences(string, '\u000a');
        if (n > this.mCharactersMaximum) {
            if (bl && this.mCharactersMaximum > ChangeableText.ELLIPSIS_CHARACTER_COUNT) {
                this.updateText(string.substring(0, this.mCharactersMaximum - ChangeableText.ELLIPSIS_CHARACTER_COUNT).concat("..."));
            } else {
                this.updateText(string.substring(0, this.mCharactersMaximum));
            }
            this.mCharacterCountCurrentText = this.mCharactersMaximum;
            return;
        }
        this.updateText(string);
        this.mCharacterCountCurrentText = n;
    }
}

