/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  javax.microedition.khronos.opengles.GL11
 */
package org.anddev.andengine.opengl.buffer;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import javax.microedition.khronos.opengles.GL11;
import org.anddev.andengine.opengl.buffer.BufferObject;

public class BufferObjectManager {
    private static BufferObjectManager mActiveInstance;
    private static final ArrayList<BufferObject> mBufferObjectsLoaded;
    private static final HashSet<BufferObject> mBufferObjectsManaged;
    private static final ArrayList<BufferObject> mBufferObjectsToBeLoaded;
    private static final ArrayList<BufferObject> mBufferObjectsToBeUnloaded;

    static {
        BufferObjectManager.mBufferObjectsManaged = new HashSet<BufferObject>();
        BufferObjectManager.mBufferObjectsLoaded = new ArrayList<BufferObject>();
        BufferObjectManager.mBufferObjectsToBeLoaded = new ArrayList<BufferObject>();
        BufferObjectManager.mBufferObjectsToBeUnloaded = new ArrayList<BufferObject>();
        BufferObjectManager.mActiveInstance = null;
    }

    public static BufferObjectManager getActiveInstance() {
        return BufferObjectManager.mActiveInstance;
    }

    public static void setActiveInstance(BufferObjectManager bufferObjectManager) {
        BufferObjectManager.mActiveInstance = bufferObjectManager;
    }

    public void clear() {
        BufferObjectManager.mBufferObjectsToBeLoaded.clear();
        BufferObjectManager.mBufferObjectsLoaded.clear();
        BufferObjectManager.mBufferObjectsManaged.clear();
    }

    public void loadBufferObject(BufferObject bufferObject) {
        if (bufferObject == null) {
            return;
        }
        if (BufferObjectManager.mBufferObjectsManaged.contains(bufferObject)) {
            BufferObjectManager.mBufferObjectsToBeUnloaded.remove(bufferObject);
            return;
        }
        BufferObjectManager.mBufferObjectsManaged.add(bufferObject);
        BufferObjectManager.mBufferObjectsToBeLoaded.add(bufferObject);
    }

    public /* varargs */ void loadBufferObjects(BufferObject ... arrbufferObject) {
        int n = -1 + arrbufferObject.length;
        while (n >= 0) {
            this.loadBufferObject(arrbufferObject[n]);
            --n;
        }
        return;
    }

    public void reloadBufferObjects() {
        ArrayList<BufferObject> arrayList = BufferObjectManager.mBufferObjectsLoaded;
        int n = -1 + arrayList.size();
        do {
            if (n < 0) {
                BufferObjectManager.mBufferObjectsToBeLoaded.addAll(arrayList);
                arrayList.clear();
                return;
            }
            arrayList.get(n).setLoadedToHardware(false);
            --n;
        } while (true);
    }

    /*
     * Enabled aggressive block sorting
     */
    public void unloadBufferObject(BufferObject bufferObject) {
        if (bufferObject == null) {
            return;
        }
        if (!BufferObjectManager.mBufferObjectsManaged.contains(bufferObject)) return;
        if (BufferObjectManager.mBufferObjectsLoaded.contains(bufferObject)) {
            BufferObjectManager.mBufferObjectsToBeUnloaded.add(bufferObject);
            return;
        }
        if (!BufferObjectManager.mBufferObjectsToBeLoaded.remove(bufferObject)) return;
        BufferObjectManager.mBufferObjectsManaged.remove(bufferObject);
    }

    public /* varargs */ void unloadBufferObjects(BufferObject ... arrbufferObject) {
        int n = -1 + arrbufferObject.length;
        while (n >= 0) {
            this.unloadBufferObject(arrbufferObject[n]);
            --n;
        }
        return;
    }

    /*
     * Unable to fully structure code
     * Enabled aggressive block sorting
     */
    public void updateBufferObjects(GL11 var1_1) {
        var2_2 = BufferObjectManager.mBufferObjectsManaged;
        var3_3 = BufferObjectManager.mBufferObjectsLoaded;
        var4_4 = BufferObjectManager.mBufferObjectsToBeLoaded;
        var5_5 = BufferObjectManager.mBufferObjectsToBeUnloaded;
        var6_6 = var4_4.size();
        ** if (var6_6 <= 0) goto lbl11
lbl7: // 1 sources:
        var12_7 = var6_6 - 1;
        do {
            if (var12_7 < 0) {
                var4_4.clear();
            } else {
                ** GOTO lbl14
            }
lbl11: // 2 sources:
            var7_9 = var5_5.size();
            if (var7_9 <= 0) return;
            break;
lbl14: // 2 sources:
            if (!(var13_8 = var4_4.get(var12_7)).isLoadedToHardware()) {
                var13_8.loadToHardware(var1_1);
                var13_8.setHardwareBufferNeedsUpdate();
            }
            var3_3.add(var13_8);
            --var12_7;
        } while (true);
        var8_10 = var7_9 - 1;
        for (; var8_10 >= 0; --var8_10) {
            var9_11 = var5_5.remove(var8_10);
            if (var9_11.isLoadedToHardware()) {
                var9_11.unloadFromHardware(var1_1);
            }
            var3_3.remove(var9_11);
            var2_2.remove(var9_11);
        }
    }
}

