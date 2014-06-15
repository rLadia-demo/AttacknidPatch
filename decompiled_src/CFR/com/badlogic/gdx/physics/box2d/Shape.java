/*
 * Decompiled with CFR 0_79.
 */
package com.badlogic.gdx.physics.box2d;

public abstract class Shape {
    protected long addr;

    private native void jniDispose(long var1);

    private native float jniGetRadius(long var1);

    protected static native int jniGetType(long var0);

    private native void jniSetRadius(long var1, float var3);

    public void dispose() {
        this.jniDispose(this.addr);
    }

    public float getRadius() {
        return this.jniGetRadius(this.addr);
    }

    public abstract Type getType();

    public void setRadius(float f) {
        this.jniSetRadius(this.addr, f);
    }

    public static final class Type
    extends Enum<Type> {
        public static final /* enum */ Type Circle = new Type("Circle", 0);
        private static final /* synthetic */ Type[] ENUM$VALUES;
        public static final /* enum */ Type Polygon = new Type("Polygon", 1);

        static {
            Type[] arrtype = new Type[]{Type.Circle, Type.Polygon};
            Type.ENUM$VALUES = arrtype;
        }

        private Type(String string22, int string22) {
            super(string, n);
        }

        public static Type valueOf(String string) {
            return (Type)Enum.valueOf(Type.class, string);
        }

        public static Type[] values() {
            Type[] arrtype = Type.ENUM$VALUES;
            int n = arrtype.length;
            Type[] arrtype2 = new Type[n];
            System.arraycopy(arrtype, 0, arrtype2, 0, n);
            return arrtype2;
        }
    }

}

