package org.anddev.andengine.util;

import java.io.*;

public class Base64
{
    public static final int CRLF = 4;
    public static final int DEFAULT = 0;
    public static final int NO_CLOSE = 16;
    public static final int NO_PADDING = 1;
    public static final int NO_WRAP = 2;
    public static final int URL_SAFE = 8;
    
    public static byte[] decode(final String s, final int n) {
        return decode(s.getBytes(), n);
    }
    
    public static byte[] decode(final byte[] array, final int n) {
        return decode(array, 0, array.length, n);
    }
    
    public static byte[] decode(final byte[] array, final int n, final int n2, final int n3) {
        final Decoder decoder = new Decoder(n3, new byte[n2 * 3 / 4]);
        if (!decoder.process(array, n, n2, true)) {
            throw new IllegalArgumentException("bad base-64");
        }
        if (decoder.op == decoder.output.length) {
            return decoder.output;
        }
        final byte[] array2 = new byte[decoder.op];
        System.arraycopy(decoder.output, 0, array2, 0, decoder.op);
        return array2;
    }
    
    public static byte[] encode(final byte[] array, final int n) {
        return encode(array, 0, array.length, n);
    }
    
    public static byte[] encode(final byte[] array, final int n, final int n2, final int n3) {
        final Encoder encoder = new Encoder(n3, null);
        int n4 = 4 * (n2 / 3);
        if (encoder.do_padding) {
            if (n2 % 3 > 0) {
                n4 += 4;
            }
        }
        else {
            switch (n2 % 3) {
                case 2: {
                    n4 += 3;
                    break;
                }
                case 1: {
                    n4 += 2;
                }
            }
        }
        if (encoder.do_newline && n2 > 0) {
            final int n5 = 1 + (n2 - 1) / 57;
            int n6;
            if (encoder.do_cr) {
                n6 = 2;
            }
            else {
                n6 = 1;
            }
            n4 += n6 * n5;
        }
        encoder.output = new byte[n4];
        encoder.process(array, n, n2, true);
        assert encoder.op == n4;
        return encoder.output;
    }
    
    public static String encodeToString(final byte[] array, final int n) {
        try {
            return new String(encode(array, n), "US-ASCII");
        }
        catch (UnsupportedEncodingException ex) {
            throw new AssertionError((Object)ex);
        }
    }
    
    public static String encodeToString(final byte[] array, final int n, final int n2, final int n3) {
        try {
            return new String(encode(array, n, n2, n3), "US-ASCII");
        }
        catch (UnsupportedEncodingException ex) {
            throw new AssertionError((Object)ex);
        }
    }
    
    abstract static class Coder
    {
        public int op;
        public byte[] output;
        
        public abstract int maxOutputSize(final int p0);
        
        public abstract boolean process(final byte[] p0, final int p1, final int p2, final boolean p3);
    }
    
    static class Decoder extends Coder
    {
        private static final int[] DECODE;
        private static final int[] DECODE_WEBSAFE;
        private static final int EQUALS = -2;
        private static final int SKIP = -1;
        private final int[] alphabet;
        private int state;
        private int value;
        
        static {
            DECODE = new int[] { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 62, -1, -1, -1, 63, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, -1, -1, -1, -2, -1, -1, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, -1, -1, -1, -1, -1, -1, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 };
            DECODE_WEBSAFE = new int[] { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 62, -1, -1, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, -1, -1, -1, -2, -1, -1, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, -1, -1, -1, -1, 63, -1, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 };
        }
        
        public Decoder(final int n, final byte[] output) {
            super();
            this.output = output;
            int[] alphabet;
            if ((n & 0x8) == 0x0) {
                alphabet = Decoder.DECODE;
            }
            else {
                alphabet = Decoder.DECODE_WEBSAFE;
            }
            this.alphabet = alphabet;
            this.state = 0;
            this.value = 0;
        }
        
        @Override
        public int maxOutputSize(final int n) {
            return 10 + n * 3 / 4;
        }
        
        @Override
        public boolean process(final byte[] array, final int n, final int n2, final boolean b) {
            if (this.state == 6) {
                return false;
            }
            int i = n;
            final int n3 = n2 + n;
            int state = this.state;
            int value = this.value;
            int n4 = 0;
            final byte[] output = this.output;
            final int[] alphabet = this.alphabet;
            while (true) {
                while (i < n3) {
                    if (state == 0) {
                        while (i + 4 <= n3) {
                            value = (alphabet[0xFF & array[i]] << 18 | alphabet[0xFF & array[i + 1]] << 12 | alphabet[0xFF & array[i + 2]] << 6 | alphabet[0xFF & array[i + 3]]);
                            if (value < 0) {
                                break;
                            }
                            output[n4 + 2] = (byte)value;
                            output[n4 + 1] = (byte)(value >> 8);
                            output[n4] = (byte)(value >> 16);
                            n4 += 3;
                            i += 4;
                        }
                        if (i >= n3) {
                            final int op = n4;
                            if (!b) {
                                this.state = state;
                                this.value = value;
                                this.op = op;
                                return true;
                            }
                            int op2 = 0;
                            switch (state) {
                                default: {
                                    op2 = op;
                                    break;
                                }
                                case 0: {
                                    op2 = op;
                                    break;
                                }
                                case 1: {
                                    this.state = 6;
                                    return false;
                                }
                                case 2: {
                                    op2 = op + 1;
                                    output[op] = (byte)(value >> 4);
                                    break;
                                }
                                case 3: {
                                    final int n5 = op + 1;
                                    output[op] = (byte)(value >> 10);
                                    final int n6 = n5 + 1;
                                    output[n5] = (byte)(value >> 2);
                                    op2 = n6;
                                    break;
                                }
                                case 4: {
                                    this.state = 6;
                                    return false;
                                }
                            }
                            this.state = state;
                            this.op = op2;
                            return true;
                        }
                    }
                    final int n7 = i + 1;
                    final int n8 = alphabet[0xFF & array[i]];
                    switch (state) {
                        case 0: {
                            if (n8 >= 0) {
                                value = n8;
                                ++state;
                                i = n7;
                                continue;
                            }
                            if (n8 != -1) {
                                this.state = 6;
                                return false;
                            }
                            break;
                        }
                        case 1: {
                            if (n8 >= 0) {
                                value = (n8 | value << 6);
                                ++state;
                                i = n7;
                                continue;
                            }
                            if (n8 != -1) {
                                this.state = 6;
                                return false;
                            }
                            break;
                        }
                        case 2: {
                            if (n8 >= 0) {
                                value = (n8 | value << 6);
                                ++state;
                                i = n7;
                                continue;
                            }
                            if (n8 == -2) {
                                final int n9 = n4 + 1;
                                output[n4] = (byte)(value >> 4);
                                state = 4;
                                n4 = n9;
                                i = n7;
                                continue;
                            }
                            if (n8 != -1) {
                                this.state = 6;
                                return false;
                            }
                            break;
                        }
                        case 3: {
                            if (n8 >= 0) {
                                value = (n8 | value << 6);
                                output[n4 + 2] = (byte)value;
                                output[n4 + 1] = (byte)(value >> 8);
                                output[n4] = (byte)(value >> 16);
                                n4 += 3;
                                i = n7;
                                state = 0;
                                continue;
                            }
                            if (n8 == -2) {
                                output[n4 + 1] = (byte)(value >> 2);
                                output[n4] = (byte)(value >> 10);
                                n4 += 2;
                                state = 5;
                                i = n7;
                                continue;
                            }
                            if (n8 != -1) {
                                this.state = 6;
                                return false;
                            }
                            break;
                        }
                        case 4: {
                            if (n8 == -2) {
                                ++state;
                                i = n7;
                                continue;
                            }
                            if (n8 != -1) {
                                this.state = 6;
                                return false;
                            }
                            break;
                        }
                        case 5: {
                            if (n8 != -1) {
                                this.state = 6;
                                return false;
                            }
                            break;
                        }
                    }
                    i = n7;
                }
                final int op = n4;
                continue;
            }
        }
    }
    
    static class Encoder extends Coder
    {
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
        
        static {
            ENCODE = new byte[] { 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 43, 47 };
            ENCODE_WEBSAFE = new byte[] { 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 45, 95 };
        }
        
        public Encoder(final int n, final byte[] output) {
            boolean do_cr = true;
            super();
            this.output = output;
            this.do_padding = ((n & 0x1) == 0x0 && do_cr);
            this.do_newline = ((n & 0x2) == 0x0 && do_cr);
            if ((n & 0x4) == 0x0) {
                do_cr = false;
            }
            this.do_cr = do_cr;
            byte[] alphabet;
            if ((n & 0x8) == 0x0) {
                alphabet = Encoder.ENCODE;
            }
            else {
                alphabet = Encoder.ENCODE_WEBSAFE;
            }
            this.alphabet = alphabet;
            this.tail = new byte[2];
            this.tailLen = 0;
            int count;
            if (this.do_newline) {
                count = 19;
            }
            else {
                count = -1;
            }
            this.count = count;
        }
        
        @Override
        public int maxOutputSize(final int n) {
            return 10 + n * 8 / 5;
        }
        
        @Override
        public boolean process(final byte[] array, final int n, final int n2, final boolean b) {
            final byte[] alphabet = this.alphabet;
            final byte[] output = this.output;
            int count = this.count;
            int n3 = n;
            final int n4 = n2 + n;
            int n5 = -1;
            switch (this.tailLen) {
                case 1: {
                    if (n3 + 2 <= n4) {
                        final int n6 = (0xFF & this.tail[0]) << 16;
                        final int n7 = n3 + 1;
                        final int n8 = n6 | (0xFF & array[n3]) << 8;
                        n3 = n7 + 1;
                        n5 = (n8 | (0xFF & array[n7]));
                        this.tailLen = 0;
                        break;
                    }
                    break;
                }
                case 2: {
                    if (n3 + 1 <= n4) {
                        final int n9 = (0xFF & this.tail[0]) << 16 | (0xFF & this.tail[1]) << 8;
                        final int n10 = n3 + 1;
                        n5 = (n9 | (0xFF & array[n3]));
                        this.tailLen = 0;
                        n3 = n10;
                        break;
                    }
                    break;
                }
            }
            int n11 = 0;
            while (true) {
                Label_1282: {
                    if (n5 == -1) {
                        break Label_1282;
                    }
                    final int n12 = 0 + 1;
                    output[0] = alphabet[0x3F & n5 >> 18];
                    final int n13 = n12 + 1;
                    output[n12] = alphabet[0x3F & n5 >> 12];
                    final int n14 = n13 + 1;
                    output[n13] = alphabet[0x3F & n5 >> 6];
                    n11 = n14 + 1;
                    output[n14] = alphabet[n5 & 0x3F];
                    if (--count != 0) {
                        break Label_1282;
                    }
                    if (this.do_cr) {
                        final int n15 = n11 + 1;
                        output[n11] = 13;
                        n11 = n15;
                    }
                    int n16 = n11 + 1;
                    output[n11] = 10;
                    count = 19;
                    int n17 = n3;
                    while (n17 + 3 <= n4) {
                        final int n18 = (0xFF & array[n17]) << 16 | (0xFF & array[n17 + 1]) << 8 | (0xFF & array[n17 + 2]);
                        output[n16] = alphabet[0x3F & n18 >> 18];
                        output[n16 + 1] = alphabet[0x3F & n18 >> 12];
                        output[n16 + 2] = alphabet[0x3F & n18 >> 6];
                        output[n16 + 3] = alphabet[n18 & 0x3F];
                        n3 = n17 + 3;
                        n11 = n16 + 4;
                        if (--count != 0) {
                            break Label_1282;
                        }
                        if (this.do_cr) {
                            final int n19 = n11 + 1;
                            output[n11] = 13;
                            n11 = n19;
                        }
                        n16 = n11 + 1;
                        output[n11] = 10;
                        count = 19;
                        n17 = n3;
                    }
                    int op;
                    if (b) {
                        int n22;
                        if (n17 - this.tailLen == n4 - 1) {
                            byte b2;
                            int n21;
                            if (this.tailLen > 0) {
                                final byte[] tail = this.tail;
                                final int n20 = 0 + 1;
                                b2 = tail[0];
                                n21 = n20;
                                n22 = n17;
                            }
                            else {
                                n22 = n17 + 1;
                                b2 = array[n17];
                                n21 = 0;
                            }
                            final int n23 = (b2 & 0xFF) << 4;
                            this.tailLen -= n21;
                            final int n24 = n16 + 1;
                            output[n16] = alphabet[0x3F & n23 >> 6];
                            int n25 = n24 + 1;
                            output[n24] = alphabet[n23 & 0x3F];
                            if (this.do_padding) {
                                final int n26 = n25 + 1;
                                output[n25] = 61;
                                n25 = n26 + 1;
                                output[n26] = 61;
                            }
                            op = n25;
                            if (this.do_newline) {
                                if (this.do_cr) {
                                    final int n27 = op + 1;
                                    output[op] = 13;
                                    op = n27;
                                }
                                final int n28 = op + 1;
                                output[op] = 10;
                                op = n28;
                            }
                        }
                        else if (n17 - this.tailLen == n4 - 2) {
                            byte b3;
                            int n30;
                            if (this.tailLen > 1) {
                                final byte[] tail2 = this.tail;
                                final int n29 = 0 + 1;
                                b3 = tail2[0];
                                n30 = n29;
                                n22 = n17;
                            }
                            else {
                                n22 = n17 + 1;
                                b3 = array[n17];
                                n30 = 0;
                            }
                            final int n31 = (b3 & 0xFF) << 10;
                            byte b4;
                            if (this.tailLen > 0) {
                                final byte[] tail3 = this.tail;
                                final int n32 = n30 + 1;
                                b4 = tail3[n30];
                                n30 = n32;
                            }
                            else {
                                final int n33 = n22 + 1;
                                b4 = array[n22];
                                n22 = n33;
                            }
                            final int n34 = n31 | (b4 & 0xFF) << 2;
                            this.tailLen -= n30;
                            final int n35 = n16 + 1;
                            output[n16] = alphabet[0x3F & n34 >> 12];
                            final int n36 = n35 + 1;
                            output[n35] = alphabet[0x3F & n34 >> 6];
                            op = n36 + 1;
                            output[n36] = alphabet[n34 & 0x3F];
                            if (this.do_padding) {
                                final int n37 = op + 1;
                                output[op] = 61;
                                op = n37;
                            }
                            if (this.do_newline) {
                                if (this.do_cr) {
                                    final int n38 = op + 1;
                                    output[op] = 13;
                                    op = n38;
                                }
                                final int n39 = op + 1;
                                output[op] = 10;
                                op = n39;
                            }
                        }
                        else {
                            if (this.do_newline && n16 > 0 && count != 19) {
                                int n40;
                                if (this.do_cr) {
                                    n40 = n16 + 1;
                                    output[n16] = 13;
                                }
                                else {
                                    n40 = n16;
                                }
                                n16 = n40 + 1;
                                output[n40] = 10;
                            }
                            n22 = n17;
                            op = n16;
                        }
                        assert this.tailLen == 0;
                        assert n22 == n4;
                    }
                    else if (n17 == n4 - 1) {
                        this.tail[this.tailLen++] = array[n17];
                        op = n16;
                    }
                    else {
                        if (n17 == n4 - 2) {
                            this.tail[this.tailLen++] = array[n17];
                            this.tail[this.tailLen++] = array[n17 + 1];
                        }
                        op = n16;
                    }
                    this.op = op;
                    this.count = count;
                    return true;
                }
                int n17 = n3;
                int n16 = n11;
                continue;
            }
        }
    }
}
