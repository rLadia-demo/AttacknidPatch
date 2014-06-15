/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.util;

import java.io.UnsupportedEncodingException;

public class Base64 {
    static final /* synthetic */ boolean $assertionsDisabled = 0;
    public static final int CRLF = 4;
    public static final int DEFAULT = 0;
    public static final int NO_CLOSE = 16;
    public static final int NO_PADDING = 1;
    public static final int NO_WRAP = 2;
    public static final int URL_SAFE = 8;

    /*
     * Enabled aggressive block sorting
     */
    static {
        boolean bl = !Base64.class.desiredAssertionStatus();
        Base64.$assertionsDisabled = bl;
    }

    private Base64() {
    }

    public static byte[] decode(String string, int n) {
        return Base64.decode(string.getBytes(), n);
    }

    public static byte[] decode(byte[] arrby, int n) {
        return Base64.decode(arrby, 0, arrby.length, n);
    }

    public static byte[] decode(byte[] arrby, int n, int n2, int n3) {
        Decoder decoder = new Decoder(n3, new byte[n2 * 3 / 4]);
        if (!decoder.process(arrby, n, n2, true)) {
            throw new IllegalArgumentException("bad base-64");
        }
        if (decoder.op == decoder.output.length) {
            return decoder.output;
        }
        byte[] arrby2 = new byte[decoder.op];
        System.arraycopy(decoder.output, 0, arrby2, 0, decoder.op);
        return arrby2;
    }

    public static byte[] encode(byte[] arrby, int n) {
        return Base64.encode(arrby, 0, arrby.length, n);
    }

    /*
     * Exception decompiling
     */
    public static byte[] encode(byte[] var0, int var1_1, int var2_2, int var3_3) {
        // This method has failed to decompile.  When submitting a bug report, please provide this stack trace, and (if you hold appropriate legal rights) the relevant class file.
        // java.lang.ClassCastException: org.benf.cfr.reader.bytecode.analysis.parse.statement.AssignmentSimple cannot be cast to org.benf.cfr.reader.bytecode.analysis.parse.statement.CaseStatement
        // org.benf.cfr.reader.bytecode.analysis.opgraph.Op03SimpleStatement.buildSwitchCases(Op03SimpleStatement.java:5135)
        // org.benf.cfr.reader.bytecode.analysis.opgraph.Op03SimpleStatement.replaceRawSwitch(Op03SimpleStatement.java:5081)
        // org.benf.cfr.reader.bytecode.analysis.opgraph.Op03SimpleStatement.replaceRawSwitches(Op03SimpleStatement.java:5452)
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

    public static String encodeToString(byte[] arrby, int n) {
        try {
            String string = new String(Base64.encode(arrby, n), "US-ASCII");
            return string;
        }
        catch (UnsupportedEncodingException var3_3) {
            throw new AssertionError(var3_3);
        }
    }

    public static String encodeToString(byte[] arrby, int n, int n2, int n3) {
        try {
            String string = new String(Base64.encode(arrby, n, n2, n3), "US-ASCII");
            return string;
        }
        catch (UnsupportedEncodingException var5_5) {
            throw new AssertionError(var5_5);
        }
    }

    static abstract class Coder {
        public int op;
        public byte[] output;

        Coder() {
        }

        public abstract int maxOutputSize(int var1);

        public abstract boolean process(byte[] var1, int var2, int var3, boolean var4);
    }

    static class Decoder
    extends Coder {
        private static final int[] DECODE;
        private static final int[] DECODE_WEBSAFE;
        private static final int EQUALS = -2;
        private static final int SKIP = -1;
        private final int[] alphabet;
        private int state;
        private int value;

        static {
            int[] arrn = new int[256];
            arrn[0] = -1;
            arrn[1] = -1;
            arrn[2] = -1;
            arrn[3] = -1;
            arrn[4] = -1;
            arrn[5] = -1;
            arrn[6] = -1;
            arrn[7] = -1;
            arrn[8] = -1;
            arrn[9] = -1;
            arrn[10] = -1;
            arrn[11] = -1;
            arrn[12] = -1;
            arrn[13] = -1;
            arrn[14] = -1;
            arrn[15] = -1;
            arrn[16] = -1;
            arrn[17] = -1;
            arrn[18] = -1;
            arrn[19] = -1;
            arrn[20] = -1;
            arrn[21] = -1;
            arrn[22] = -1;
            arrn[23] = -1;
            arrn[24] = -1;
            arrn[25] = -1;
            arrn[26] = -1;
            arrn[27] = -1;
            arrn[28] = -1;
            arrn[29] = -1;
            arrn[30] = -1;
            arrn[31] = -1;
            arrn[32] = -1;
            arrn[33] = -1;
            arrn[34] = -1;
            arrn[35] = -1;
            arrn[36] = -1;
            arrn[37] = -1;
            arrn[38] = -1;
            arrn[39] = -1;
            arrn[40] = -1;
            arrn[41] = -1;
            arrn[42] = -1;
            arrn[43] = 62;
            arrn[44] = -1;
            arrn[45] = -1;
            arrn[46] = -1;
            arrn[47] = 63;
            arrn[48] = 52;
            arrn[49] = 53;
            arrn[50] = 54;
            arrn[51] = 55;
            arrn[52] = 56;
            arrn[53] = 57;
            arrn[54] = 58;
            arrn[55] = 59;
            arrn[56] = 60;
            arrn[57] = 61;
            arrn[58] = -1;
            arrn[59] = -1;
            arrn[60] = -1;
            arrn[61] = -2;
            arrn[62] = -1;
            arrn[63] = -1;
            arrn[64] = -1;
            arrn[66] = 1;
            arrn[67] = 2;
            arrn[68] = 3;
            arrn[69] = 4;
            arrn[70] = 5;
            arrn[71] = 6;
            arrn[72] = 7;
            arrn[73] = 8;
            arrn[74] = 9;
            arrn[75] = 10;
            arrn[76] = 11;
            arrn[77] = 12;
            arrn[78] = 13;
            arrn[79] = 14;
            arrn[80] = 15;
            arrn[81] = 16;
            arrn[82] = 17;
            arrn[83] = 18;
            arrn[84] = 19;
            arrn[85] = 20;
            arrn[86] = 21;
            arrn[87] = 22;
            arrn[88] = 23;
            arrn[89] = 24;
            arrn[90] = 25;
            arrn[91] = -1;
            arrn[92] = -1;
            arrn[93] = -1;
            arrn[94] = -1;
            arrn[95] = -1;
            arrn[96] = -1;
            arrn[97] = 26;
            arrn[98] = 27;
            arrn[99] = 28;
            arrn[100] = 29;
            arrn[101] = 30;
            arrn[102] = 31;
            arrn[103] = 32;
            arrn[104] = 33;
            arrn[105] = 34;
            arrn[106] = 35;
            arrn[107] = 36;
            arrn[108] = 37;
            arrn[109] = 38;
            arrn[110] = 39;
            arrn[111] = 40;
            arrn[112] = 41;
            arrn[113] = 42;
            arrn[114] = 43;
            arrn[115] = 44;
            arrn[116] = 45;
            arrn[117] = 46;
            arrn[118] = 47;
            arrn[119] = 48;
            arrn[120] = 49;
            arrn[121] = 50;
            arrn[122] = 51;
            arrn[123] = -1;
            arrn[124] = -1;
            arrn[125] = -1;
            arrn[126] = -1;
            arrn[127] = -1;
            arrn[128] = -1;
            arrn[129] = -1;
            arrn[130] = -1;
            arrn[131] = -1;
            arrn[132] = -1;
            arrn[133] = -1;
            arrn[134] = -1;
            arrn[135] = -1;
            arrn[136] = -1;
            arrn[137] = -1;
            arrn[138] = -1;
            arrn[139] = -1;
            arrn[140] = -1;
            arrn[141] = -1;
            arrn[142] = -1;
            arrn[143] = -1;
            arrn[144] = -1;
            arrn[145] = -1;
            arrn[146] = -1;
            arrn[147] = -1;
            arrn[148] = -1;
            arrn[149] = -1;
            arrn[150] = -1;
            arrn[151] = -1;
            arrn[152] = -1;
            arrn[153] = -1;
            arrn[154] = -1;
            arrn[155] = -1;
            arrn[156] = -1;
            arrn[157] = -1;
            arrn[158] = -1;
            arrn[159] = -1;
            arrn[160] = -1;
            arrn[161] = -1;
            arrn[162] = -1;
            arrn[163] = -1;
            arrn[164] = -1;
            arrn[165] = -1;
            arrn[166] = -1;
            arrn[167] = -1;
            arrn[168] = -1;
            arrn[169] = -1;
            arrn[170] = -1;
            arrn[171] = -1;
            arrn[172] = -1;
            arrn[173] = -1;
            arrn[174] = -1;
            arrn[175] = -1;
            arrn[176] = -1;
            arrn[177] = -1;
            arrn[178] = -1;
            arrn[179] = -1;
            arrn[180] = -1;
            arrn[181] = -1;
            arrn[182] = -1;
            arrn[183] = -1;
            arrn[184] = -1;
            arrn[185] = -1;
            arrn[186] = -1;
            arrn[187] = -1;
            arrn[188] = -1;
            arrn[189] = -1;
            arrn[190] = -1;
            arrn[191] = -1;
            arrn[192] = -1;
            arrn[193] = -1;
            arrn[194] = -1;
            arrn[195] = -1;
            arrn[196] = -1;
            arrn[197] = -1;
            arrn[198] = -1;
            arrn[199] = -1;
            arrn[200] = -1;
            arrn[201] = -1;
            arrn[202] = -1;
            arrn[203] = -1;
            arrn[204] = -1;
            arrn[205] = -1;
            arrn[206] = -1;
            arrn[207] = -1;
            arrn[208] = -1;
            arrn[209] = -1;
            arrn[210] = -1;
            arrn[211] = -1;
            arrn[212] = -1;
            arrn[213] = -1;
            arrn[214] = -1;
            arrn[215] = -1;
            arrn[216] = -1;
            arrn[217] = -1;
            arrn[218] = -1;
            arrn[219] = -1;
            arrn[220] = -1;
            arrn[221] = -1;
            arrn[222] = -1;
            arrn[223] = -1;
            arrn[224] = -1;
            arrn[225] = -1;
            arrn[226] = -1;
            arrn[227] = -1;
            arrn[228] = -1;
            arrn[229] = -1;
            arrn[230] = -1;
            arrn[231] = -1;
            arrn[232] = -1;
            arrn[233] = -1;
            arrn[234] = -1;
            arrn[235] = -1;
            arrn[236] = -1;
            arrn[237] = -1;
            arrn[238] = -1;
            arrn[239] = -1;
            arrn[240] = -1;
            arrn[241] = -1;
            arrn[242] = -1;
            arrn[243] = -1;
            arrn[244] = -1;
            arrn[245] = -1;
            arrn[246] = -1;
            arrn[247] = -1;
            arrn[248] = -1;
            arrn[249] = -1;
            arrn[250] = -1;
            arrn[251] = -1;
            arrn[252] = -1;
            arrn[253] = -1;
            arrn[254] = -1;
            arrn[255] = -1;
            Decoder.DECODE = arrn;
            int[] arrn2 = new int[256];
            arrn2[0] = -1;
            arrn2[1] = -1;
            arrn2[2] = -1;
            arrn2[3] = -1;
            arrn2[4] = -1;
            arrn2[5] = -1;
            arrn2[6] = -1;
            arrn2[7] = -1;
            arrn2[8] = -1;
            arrn2[9] = -1;
            arrn2[10] = -1;
            arrn2[11] = -1;
            arrn2[12] = -1;
            arrn2[13] = -1;
            arrn2[14] = -1;
            arrn2[15] = -1;
            arrn2[16] = -1;
            arrn2[17] = -1;
            arrn2[18] = -1;
            arrn2[19] = -1;
            arrn2[20] = -1;
            arrn2[21] = -1;
            arrn2[22] = -1;
            arrn2[23] = -1;
            arrn2[24] = -1;
            arrn2[25] = -1;
            arrn2[26] = -1;
            arrn2[27] = -1;
            arrn2[28] = -1;
            arrn2[29] = -1;
            arrn2[30] = -1;
            arrn2[31] = -1;
            arrn2[32] = -1;
            arrn2[33] = -1;
            arrn2[34] = -1;
            arrn2[35] = -1;
            arrn2[36] = -1;
            arrn2[37] = -1;
            arrn2[38] = -1;
            arrn2[39] = -1;
            arrn2[40] = -1;
            arrn2[41] = -1;
            arrn2[42] = -1;
            arrn2[43] = -1;
            arrn2[44] = -1;
            arrn2[45] = 62;
            arrn2[46] = -1;
            arrn2[47] = -1;
            arrn2[48] = 52;
            arrn2[49] = 53;
            arrn2[50] = 54;
            arrn2[51] = 55;
            arrn2[52] = 56;
            arrn2[53] = 57;
            arrn2[54] = 58;
            arrn2[55] = 59;
            arrn2[56] = 60;
            arrn2[57] = 61;
            arrn2[58] = -1;
            arrn2[59] = -1;
            arrn2[60] = -1;
            arrn2[61] = -2;
            arrn2[62] = -1;
            arrn2[63] = -1;
            arrn2[64] = -1;
            arrn2[66] = 1;
            arrn2[67] = 2;
            arrn2[68] = 3;
            arrn2[69] = 4;
            arrn2[70] = 5;
            arrn2[71] = 6;
            arrn2[72] = 7;
            arrn2[73] = 8;
            arrn2[74] = 9;
            arrn2[75] = 10;
            arrn2[76] = 11;
            arrn2[77] = 12;
            arrn2[78] = 13;
            arrn2[79] = 14;
            arrn2[80] = 15;
            arrn2[81] = 16;
            arrn2[82] = 17;
            arrn2[83] = 18;
            arrn2[84] = 19;
            arrn2[85] = 20;
            arrn2[86] = 21;
            arrn2[87] = 22;
            arrn2[88] = 23;
            arrn2[89] = 24;
            arrn2[90] = 25;
            arrn2[91] = -1;
            arrn2[92] = -1;
            arrn2[93] = -1;
            arrn2[94] = -1;
            arrn2[95] = 63;
            arrn2[96] = -1;
            arrn2[97] = 26;
            arrn2[98] = 27;
            arrn2[99] = 28;
            arrn2[100] = 29;
            arrn2[101] = 30;
            arrn2[102] = 31;
            arrn2[103] = 32;
            arrn2[104] = 33;
            arrn2[105] = 34;
            arrn2[106] = 35;
            arrn2[107] = 36;
            arrn2[108] = 37;
            arrn2[109] = 38;
            arrn2[110] = 39;
            arrn2[111] = 40;
            arrn2[112] = 41;
            arrn2[113] = 42;
            arrn2[114] = 43;
            arrn2[115] = 44;
            arrn2[116] = 45;
            arrn2[117] = 46;
            arrn2[118] = 47;
            arrn2[119] = 48;
            arrn2[120] = 49;
            arrn2[121] = 50;
            arrn2[122] = 51;
            arrn2[123] = -1;
            arrn2[124] = -1;
            arrn2[125] = -1;
            arrn2[126] = -1;
            arrn2[127] = -1;
            arrn2[128] = -1;
            arrn2[129] = -1;
            arrn2[130] = -1;
            arrn2[131] = -1;
            arrn2[132] = -1;
            arrn2[133] = -1;
            arrn2[134] = -1;
            arrn2[135] = -1;
            arrn2[136] = -1;
            arrn2[137] = -1;
            arrn2[138] = -1;
            arrn2[139] = -1;
            arrn2[140] = -1;
            arrn2[141] = -1;
            arrn2[142] = -1;
            arrn2[143] = -1;
            arrn2[144] = -1;
            arrn2[145] = -1;
            arrn2[146] = -1;
            arrn2[147] = -1;
            arrn2[148] = -1;
            arrn2[149] = -1;
            arrn2[150] = -1;
            arrn2[151] = -1;
            arrn2[152] = -1;
            arrn2[153] = -1;
            arrn2[154] = -1;
            arrn2[155] = -1;
            arrn2[156] = -1;
            arrn2[157] = -1;
            arrn2[158] = -1;
            arrn2[159] = -1;
            arrn2[160] = -1;
            arrn2[161] = -1;
            arrn2[162] = -1;
            arrn2[163] = -1;
            arrn2[164] = -1;
            arrn2[165] = -1;
            arrn2[166] = -1;
            arrn2[167] = -1;
            arrn2[168] = -1;
            arrn2[169] = -1;
            arrn2[170] = -1;
            arrn2[171] = -1;
            arrn2[172] = -1;
            arrn2[173] = -1;
            arrn2[174] = -1;
            arrn2[175] = -1;
            arrn2[176] = -1;
            arrn2[177] = -1;
            arrn2[178] = -1;
            arrn2[179] = -1;
            arrn2[180] = -1;
            arrn2[181] = -1;
            arrn2[182] = -1;
            arrn2[183] = -1;
            arrn2[184] = -1;
            arrn2[185] = -1;
            arrn2[186] = -1;
            arrn2[187] = -1;
            arrn2[188] = -1;
            arrn2[189] = -1;
            arrn2[190] = -1;
            arrn2[191] = -1;
            arrn2[192] = -1;
            arrn2[193] = -1;
            arrn2[194] = -1;
            arrn2[195] = -1;
            arrn2[196] = -1;
            arrn2[197] = -1;
            arrn2[198] = -1;
            arrn2[199] = -1;
            arrn2[200] = -1;
            arrn2[201] = -1;
            arrn2[202] = -1;
            arrn2[203] = -1;
            arrn2[204] = -1;
            arrn2[205] = -1;
            arrn2[206] = -1;
            arrn2[207] = -1;
            arrn2[208] = -1;
            arrn2[209] = -1;
            arrn2[210] = -1;
            arrn2[211] = -1;
            arrn2[212] = -1;
            arrn2[213] = -1;
            arrn2[214] = -1;
            arrn2[215] = -1;
            arrn2[216] = -1;
            arrn2[217] = -1;
            arrn2[218] = -1;
            arrn2[219] = -1;
            arrn2[220] = -1;
            arrn2[221] = -1;
            arrn2[222] = -1;
            arrn2[223] = -1;
            arrn2[224] = -1;
            arrn2[225] = -1;
            arrn2[226] = -1;
            arrn2[227] = -1;
            arrn2[228] = -1;
            arrn2[229] = -1;
            arrn2[230] = -1;
            arrn2[231] = -1;
            arrn2[232] = -1;
            arrn2[233] = -1;
            arrn2[234] = -1;
            arrn2[235] = -1;
            arrn2[236] = -1;
            arrn2[237] = -1;
            arrn2[238] = -1;
            arrn2[239] = -1;
            arrn2[240] = -1;
            arrn2[241] = -1;
            arrn2[242] = -1;
            arrn2[243] = -1;
            arrn2[244] = -1;
            arrn2[245] = -1;
            arrn2[246] = -1;
            arrn2[247] = -1;
            arrn2[248] = -1;
            arrn2[249] = -1;
            arrn2[250] = -1;
            arrn2[251] = -1;
            arrn2[252] = -1;
            arrn2[253] = -1;
            arrn2[254] = -1;
            arrn2[255] = -1;
            Decoder.DECODE_WEBSAFE = arrn2;
        }

        /*
         * Enabled aggressive block sorting
         */
        public Decoder(int n, byte[] arrby) {
            this.output = arrby;
            int[] arrn = (n & 8) == 0 ? Decoder.DECODE : Decoder.DECODE_WEBSAFE;
            this.alphabet = arrn;
            this.state = 0;
            this.value = 0;
        }

        @Override
        public int maxOutputSize(int n) {
            return 10 + n * 3 / 4;
        }

        /*
         * Unable to fully structure code
         * Enabled aggressive block sorting
         */
        @Override
        public boolean process(byte[] var1_1, int var2_2, int var3_3, boolean var4_4) {
            if (this.state == 6) {
                return false;
            }
            var5_5 = var2_2;
            var6_6 = var3_3 + var2_2;
            var7_7 = this.state;
            var8_8 = this.value;
            var9_9 = 0;
            var10_10 = this.output;
            var11_11 = this.alphabet;
            block15 : do {
                ** if (var5_5 >= var6_6) goto lbl14
lbl12: // 1 sources:
                ** if (var7_7 != 0) goto lbl58
lbl13: // 1 sources:
                ** GOTO lbl47
lbl14: // 1 sources:
                var15_15 = var9_9;
lbl15: // 2 sources:
                do {
                    if (var4_4) {
                        switch (var7_7) {
                            default: {
                                var18_16 = var15_15;
                                ** break;
                            }
                            case 0: {
                                var18_16 = var15_15;
                                ** break;
                            }
                            case 1: {
                                this.state = 6;
                                return false;
                            }
                            case 2: {
                                var18_16 = var15_15 + 1;
                                var10_10[var15_15] = (byte)(var8_8 >> 4);
                                ** break;
                            }
                            case 3: {
                                var16_17 = var15_15 + 1;
                                var10_10[var15_15] = (byte)(var8_8 >> 10);
                                var17_18 = var16_17 + 1;
                                var10_10[var16_17] = (byte)(var8_8 >> 2);
                                var18_16 = var17_18;
lbl37: // 4 sources:
                                this.state = var7_7;
                                this.op = var18_16;
                                return true;
                            }
                        }
                        ** case 4:
lbl41: // 1 sources:
                        this.state = 6;
                        return false;
                    }
                    this.state = var7_7;
                    this.value = var8_8;
                    this.op = var15_15;
                    return true;
                    break;
                } while (true);
lbl47: // 1 sources:
                do {
                    if (var5_5 + 4 > var6_6 || (var8_8 = var11_11[255 & var1_1[var5_5]] << 18 | var11_11[255 & var1_1[var5_5 + 1]] << 12 | var11_11[255 & var1_1[var5_5 + 2]] << 6 | var11_11[255 & var1_1[var5_5 + 3]]) < 0) {
                        if (var5_5 < var6_6) break;
                        var15_15 = var9_9;
                        ** continue;
                    }
                    var10_10[var9_9 + 2] = (byte)var8_8;
                    var10_10[var9_9 + 1] = (byte)(var8_8 >> 8);
                    var10_10[var9_9] = (byte)(var8_8 >> 16);
                    var9_9+=3;
                    var5_5+=4;
                } while (true);
lbl58: // 2 sources:
                var12_12 = var5_5 + 1;
                var13_13 = var11_11[255 & var1_1[var5_5]];
                switch (var7_7) {
                    default: {
                        break;
                    }
                    case 0: {
                        if (var13_13 >= 0) {
                            var8_8 = var13_13;
                            ++var7_7;
                            var5_5 = var12_12;
                            continue block15;
                        }
                        if (var13_13 == -1) break;
                        this.state = 6;
                        return false;
                    }
                    case 1: {
                        if (var13_13 >= 0) {
                            var8_8 = var13_13 | var8_8 << 6;
                            ++var7_7;
                            var5_5 = var12_12;
                            continue block15;
                        }
                        if (var13_13 == -1) break;
                        this.state = 6;
                        return false;
                    }
                    case 2: {
                        if (var13_13 >= 0) {
                            var8_8 = var13_13 | var8_8 << 6;
                            ++var7_7;
                            var5_5 = var12_12;
                            continue block15;
                        }
                        if (var13_13 == -2) {
                            var14_14 = var9_9 + 1;
                            var10_10[var9_9] = (byte)(var8_8 >> 4);
                            var7_7 = 4;
                            var9_9 = var14_14;
                            var5_5 = var12_12;
                            continue block15;
                        }
                        if (var13_13 == -1) break;
                        this.state = 6;
                        return false;
                    }
                    case 3: {
                        if (var13_13 >= 0) {
                            var8_8 = var13_13 | var8_8 << 6;
                            var10_10[var9_9 + 2] = (byte)var8_8;
                            var10_10[var9_9 + 1] = (byte)(var8_8 >> 8);
                            var10_10[var9_9] = (byte)(var8_8 >> 16);
                            var9_9+=3;
                            var5_5 = var12_12;
                            var7_7 = 0;
                            continue block15;
                        }
                        if (var13_13 == -2) {
                            var10_10[var9_9 + 1] = (byte)(var8_8 >> 2);
                            var10_10[var9_9] = (byte)(var8_8 >> 10);
                            var9_9+=2;
                            var7_7 = 5;
                            var5_5 = var12_12;
                            continue block15;
                        }
                        if (var13_13 == -1) break;
                        this.state = 6;
                        return false;
                    }
                    case 4: {
                        if (var13_13 == -2) {
                            ++var7_7;
                            var5_5 = var12_12;
                            continue block15;
                        }
                        if (var13_13 == -1) break;
                        this.state = 6;
                        return false;
                    }
                    case 5: {
                        if (var13_13 != -1) break block15;
                    }
                }
                var5_5 = var12_12;
            } while (true);
            this.state = 6;
            return false;
        }
    }

    static class Encoder
    extends Coder {
        static final /* synthetic */ boolean $assertionsDisabled = 0;
        private static final byte[] ENCODE;
        private static final byte[] ENCODE_WEBSAFE;
        public static final int LINE_GROUPS = 19;
        private final byte[] alphabet;
        private int count;
        public final boolean do_cr;
        public final boolean do_newline;
        public final boolean do_padding;
        private final byte[] tail;
        int tailLen;

        /*
         * Enabled aggressive block sorting
         */
        static {
            boolean bl = !Base64.class.desiredAssertionStatus();
            Encoder.$assertionsDisabled = bl;
            Encoder.ENCODE = new byte[]{65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 43, 47};
            Encoder.ENCODE_WEBSAFE = new byte[]{65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 45, 95};
        }

        /*
         * Enabled aggressive block sorting
         */
        public Encoder(int n, byte[] arrby) {
            boolean bl = true;
            this.output = arrby;
            boolean bl2 = (n & 1) == 0 ? bl : false;
            this.do_padding = bl2;
            boolean bl3 = (n & 2) == 0 ? bl : false;
            this.do_newline = bl3;
            if ((n & 4) == 0) {
                bl = false;
            }
            this.do_cr = bl;
            byte[] arrby2 = (n & 8) == 0 ? Encoder.ENCODE : Encoder.ENCODE_WEBSAFE;
            this.alphabet = arrby2;
            this.tail = new byte[2];
            this.tailLen = 0;
            int n2 = this.do_newline ? 19 : -1;
            this.count = n2;
        }

        @Override
        public int maxOutputSize(int n) {
            return 10 + n * 8 / 5;
        }

        /*
         * Unable to fully structure code
         * Enabled aggressive block sorting
         */
        @Override
        public boolean process(byte[] var1_1, int var2_2, int var3_3, boolean var4_4) {
            var5_5 = this.alphabet;
            var6_6 = this.output;
            var7_7 = this.count;
            var8_8 = var2_2;
            var9_9 = var3_3 + var2_2;
            var10_10 = -1;
            switch (this.tailLen) {
                default: {
                    break;
                }
                case 1: {
                    if (var8_8 + 2 > var9_9) break;
                    var58_14 = (255 & this.tail[0]) << 16;
                    var59_13 = var8_8 + 1;
                    var60_15 = var58_14 | (255 & var1_1[var8_8]) << 8;
                    var8_8 = var59_13 + 1;
                    var10_10 = var60_15 | 255 & var1_1[var59_13];
                    this.tailLen = 0;
                    break;
                }
                case 2: {
                    if (var8_8 + 1 > var9_9) break;
                    var11_11 = (255 & this.tail[0]) << 16 | (255 & this.tail[1]) << 8;
                    var12_12 = var8_8 + 1;
                    var10_10 = var11_11 | 255 & var1_1[var8_8];
                    this.tailLen = 0;
                    var8_8 = var12_12;
                }
            }
            var13_16 = 0;
            ** if (var10_10 == -1) goto lbl174
lbl28: // 1 sources:
            var54_17 = 0 + 1;
            var6_6[0] = var5_5[63 & var10_10 >> 18];
            var55_18 = var54_17 + 1;
            var6_6[var54_17] = var5_5[63 & var10_10 >> 12];
            var56_19 = var55_18 + 1;
            var6_6[var55_18] = var5_5[63 & var10_10 >> 6];
            var13_16 = var56_19 + 1;
            var6_6[var56_19] = var5_5[var10_10 & 63];
            ** if (--var7_7 != 0) goto lbl174
lbl37: // 1 sources:
            if (this.do_cr) {
                var57_20 = var13_16 + 1;
                var6_6[var13_16] = 13;
                var13_16 = var57_20;
            }
            var15_21 = var13_16 + 1;
            var6_6[var13_16] = 10;
            var7_7 = 19;
            var14_22 = var8_8;
            do {
                if (var14_22 + 3 <= var9_9) ** break;
                ** if (!var4_4) goto lbl144
lbl48: // 1 sources:
                ** if (var14_22 - this.tailLen != var9_9 - 1) goto lbl97
lbl49: // 1 sources:
                ** if (this.tailLen <= 0) goto lbl73
lbl50: // 1 sources:
                var52_25 = this.tail;
                var53_26 = 0 + 1;
                var44_27 = var52_25[0];
                var45_28 = var53_26;
                var27_29 = var14_22;
                ** GOTO lbl76
                var16_24 = (255 & var1_1[var14_22]) << 16 | (255 & var1_1[var14_22 + 1]) << 8 | 255 & var1_1[var14_22 + 2];
                var6_6[var15_21] = var5_5[63 & var16_24 >> 18];
                var6_6[var15_21 + 1] = var5_5[63 & var16_24 >> 12];
                var6_6[var15_21 + 2] = var5_5[63 & var16_24 >> 6];
                var6_6[var15_21 + 3] = var5_5[var16_24 & 63];
                var8_8 = var14_22 + 3;
                var13_16 = var15_21 + 4;
                if (--var7_7 == 0) {
                    if (this.do_cr) {
                        var17_23 = var13_16 + 1;
                        var6_6[var13_16] = 13;
                        var13_16 = var17_23;
                    }
                    var15_21 = var13_16 + 1;
                    var6_6[var13_16] = 10;
                    var7_7 = 19;
                    var14_22 = var8_8;
                    continue;
                } else {
                    ** GOTO lbl174
                }
lbl73: // 1 sources:
                var27_29 = var14_22 + 1;
                var44_27 = var1_1[var14_22];
                var45_28 = 0;
lbl76: // 2 sources:
                var46_30 = (var44_27 & 255) << 4;
                this.tailLen-=var45_28;
                var47_31 = var15_21 + 1;
                var6_6[var15_21] = var5_5[63 & var46_30 >> 6];
                var48_32 = var47_31 + 1;
                var6_6[var47_31] = var5_5[var46_30 & 63];
                if (this.do_padding) {
                    var51_33 = var48_32 + 1;
                    var6_6[var48_32] = 61;
                    var48_32 = var51_33 + 1;
                    var6_6[var51_33] = 61;
                }
                var19_34 = var48_32;
                if (this.do_newline) {
                    if (this.do_cr) {
                        var50_35 = var19_34 + 1;
                        var6_6[var19_34] = 13;
                        var19_34 = var50_35;
                    }
                    var49_36 = var19_34 + 1;
                    var6_6[var19_34] = 10;
                    var19_34 = var49_36;
                } else {
                    ** GOTO lbl161
                }
                ** GOTO lbl161
lbl97: // 1 sources:
                ** if (var14_22 - this.tailLen != var9_9 - 2) goto lbl139
lbl98: // 1 sources:
                if (this.tailLen > 1) {
                    var42_37 = this.tail;
                    var43_38 = 0 + 1;
                    var29_39 = var42_37[0];
                    var30_40 = var43_38;
                    var27_29 = var14_22;
                } else {
                    var27_29 = var14_22 + 1;
                    var29_39 = var1_1[var14_22];
                    var30_40 = 0;
                }
                var31_41 = (var29_39 & 255) << 10;
                if (this.tailLen > 0) {
                    var40_42 = this.tail;
                    var41_43 = var30_40 + 1;
                    var33_44 = var40_42[var30_40];
                    var30_40 = var41_43;
                } else {
                    var32_51 = var27_29 + 1;
                    var33_44 = var1_1[var27_29];
                    var27_29 = var32_51;
                }
                var34_45 = var31_41 | (var33_44 & 255) << 2;
                this.tailLen-=var30_40;
                var35_46 = var15_21 + 1;
                var6_6[var15_21] = var5_5[63 & var34_45 >> 12];
                var36_47 = var35_46 + 1;
                var6_6[var35_46] = var5_5[63 & var34_45 >> 6];
                var19_34 = var36_47 + 1;
                var6_6[var36_47] = var5_5[var34_45 & 63];
                if (this.do_padding) {
                    var39_48 = var19_34 + 1;
                    var6_6[var19_34] = 61;
                    var19_34 = var39_48;
                }
                if (this.do_newline) {
                    if (this.do_cr) {
                        var38_49 = var19_34 + 1;
                        var6_6[var19_34] = 13;
                        var19_34 = var38_49;
                    }
                    var37_50 = var19_34 + 1;
                    var6_6[var19_34] = 10;
                    var19_34 = var37_50;
                } else {
                    ** GOTO lbl161
                }
                ** GOTO lbl161
lbl139: // 1 sources:
                ** if (!this.do_newline || var15_21 <= 0 || var7_7 == 19) goto lbl159
lbl140: // 1 sources:
                ** if (!this.do_cr) goto lbl156
lbl141: // 1 sources:
                var28_52 = var15_21 + 1;
                var6_6[var15_21] = 13;
                ** GOTO lbl157
lbl144: // 1 sources:
                ** if (var14_22 == var9_9 - 1) goto lbl166
lbl145: // 1 sources:
                if (var14_22 == var9_9 - 2) {
                    var20_55 = this.tail;
                    var21_56 = this.tailLen;
                    this.tailLen = var21_56 + 1;
                    var20_55[var21_56] = var1_1[var14_22];
                    var22_57 = this.tail;
                    var23_58 = this.tailLen;
                    this.tailLen = var23_58 + 1;
                    var22_57[var23_58] = var1_1[var14_22 + 1];
                }
                var19_34 = var15_21;
                ** GOTO lbl165
lbl156: // 1 sources:
                var28_52 = var15_21;
lbl157: // 2 sources:
                var15_21 = var28_52 + 1;
                var6_6[var28_52] = 10;
lbl159: // 2 sources:
                var27_29 = var14_22;
                var19_34 = var15_21;
lbl161: // 7 sources:
                if (!(Encoder.$assertionsDisabled || this.tailLen == 0)) {
                    throw new AssertionError();
                }
                if (!(Encoder.$assertionsDisabled || var27_29 == var9_9)) {
                    throw new AssertionError();
                } else {
                    ** GOTO lbl171
                }
lbl165: // 1 sources:
                ** GOTO lbl171
lbl166: // 1 sources:
                var24_53 = this.tail;
                var25_54 = this.tailLen;
                this.tailLen = var25_54 + 1;
                var24_53[var25_54] = var1_1[var14_22];
                var19_34 = var15_21;
lbl171: // 4 sources:
                this.op = var19_34;
                this.count = var7_7;
                return true;
lbl174: // 4 sources:
                var14_22 = var8_8;
                var15_21 = var13_16;
            } while (true);
        }
    }

}

