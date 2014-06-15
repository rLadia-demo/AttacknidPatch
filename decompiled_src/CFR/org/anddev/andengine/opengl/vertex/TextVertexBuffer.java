/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.opengl.vertex;

import org.anddev.andengine.opengl.font.Font;
import org.anddev.andengine.opengl.vertex.VertexBuffer;
import org.anddev.andengine.util.HorizontalAlign;

public class TextVertexBuffer
extends VertexBuffer {
    private static /* synthetic */ int[] $SWITCH_TABLE$org$anddev$andengine$util$HorizontalAlign;
    public static final int VERTICES_PER_CHARACTER = 6;
    private final HorizontalAlign mHorizontalAlign;

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     */
    static /* synthetic */ int[] $SWITCH_TABLE$org$anddev$andengine$util$HorizontalAlign() {
        int[] arrn;
        int[] arrn2 = TextVertexBuffer.$SWITCH_TABLE$org$anddev$andengine$util$HorizontalAlign;
        if (arrn2 != null) {
            return arrn2;
        }
        arrn = new int[HorizontalAlign.values().length];
        try {
            arrn[HorizontalAlign.CENTER.ordinal()] = 2;
        }
        catch (NoSuchFieldError var2_4) {}
        try {
            arrn[HorizontalAlign.LEFT.ordinal()] = 1;
        }
        catch (NoSuchFieldError var3_3) {}
        try {
            arrn[HorizontalAlign.RIGHT.ordinal()] = 3;
        }
        catch (NoSuchFieldError var4_2) {}
        TextVertexBuffer.$SWITCH_TABLE$org$anddev$andengine$util$HorizontalAlign = arrn;
        return arrn;
    }

    public TextVertexBuffer(int n, HorizontalAlign horizontalAlign, int n2) {
        super(n * 12, n2);
        this.mHorizontalAlign = horizontalAlign;
    }

    /*
     * Exception decompiling
     */
    public void update(Font var1_1, int var2_2, int[] var3_3, String[] var4_4) {
        // This method has failed to decompile.  When submitting a bug report, please provide this stack trace, and (if you hold appropriate legal rights) the relevant class file.
        // org.benf.cfr.reader.util.ConfusedCFRException: First case is not immediately after switch.
        // org.benf.cfr.reader.bytecode.analysis.opgraph.Op03SimpleStatement.examineSwitchContiguity(Op03SimpleStatement.java:5316)
        // org.benf.cfr.reader.bytecode.analysis.opgraph.Op03SimpleStatement.replaceRawSwitches(Op03SimpleStatement.java:5483)
        // org.benf.cfr.reader.bytecode.CodeAnalyser.getAnalysisInner(CodeAnalyser.java:362)
        // org.benf.cfr.reader.bytecode.CodeAnalyser.getAnalysisOrWrapFail(CodeAnalyser.java:185)
        // org.benf.cfr.reader.bytecode.CodeAnalyser.getAnalysis(CodeAnalyser.java:143)
        // org.benf.cfr.reader.entities.attributes.AttributeCode.analyse(AttributeCode.java:78)
        // org.benf.cfr.reader.entities.Method.analyse(Method.java:364)
        // org.benf.cfr.reader.entities.ClassFile.analyseMid(ClassFile.java:683)
        // org.benf.cfr.reader.entities.ClassFile.analyseTop(ClassFile.java:616)
        // org.benf.cfr.reader.Main.doJar(Main.java:116)
        // org.benf.cfr.reader.Main.main(Main.java:167)
        throw new IllegalStateException("Decompilation failed");
    }
}

