package org.anddev.andengine.opengl.buffer;

import java.util.*;
import javax.microedition.khronos.opengles.*;

public class BufferObjectManager
{
    private static BufferObjectManager mActiveInstance;
    private static final ArrayList<BufferObject> mBufferObjectsLoaded;
    private static final HashSet<BufferObject> mBufferObjectsManaged;
    private static final ArrayList<BufferObject> mBufferObjectsToBeLoaded;
    private static final ArrayList<BufferObject> mBufferObjectsToBeUnloaded;
    
    static {
        mBufferObjectsManaged = new HashSet<BufferObject>();
        mBufferObjectsLoaded = new ArrayList<BufferObject>();
        mBufferObjectsToBeLoaded = new ArrayList<BufferObject>();
        mBufferObjectsToBeUnloaded = new ArrayList<BufferObject>();
        BufferObjectManager.mActiveInstance = null;
    }
    
    public static BufferObjectManager getActiveInstance() {
        return BufferObjectManager.mActiveInstance;
    }
    
    public static void setActiveInstance(final BufferObjectManager mActiveInstance) {
        BufferObjectManager.mActiveInstance = mActiveInstance;
    }
    
    public void clear() {
        BufferObjectManager.mBufferObjectsToBeLoaded.clear();
        BufferObjectManager.mBufferObjectsLoaded.clear();
        BufferObjectManager.mBufferObjectsManaged.clear();
    }
    
    public void loadBufferObject(final BufferObject bufferObject) {
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
    
    public void loadBufferObjects(final BufferObject... array) {
        for (int i = -1 + array.length; i >= 0; --i) {
            this.loadBufferObject(array[i]);
        }
    }
    
    public void reloadBufferObjects() {
        final ArrayList<BufferObject> mBufferObjectsLoaded = BufferObjectManager.mBufferObjectsLoaded;
        for (int i = -1 + mBufferObjectsLoaded.size(); i >= 0; --i) {
            mBufferObjectsLoaded.get(i).setLoadedToHardware(false);
        }
        BufferObjectManager.mBufferObjectsToBeLoaded.addAll(mBufferObjectsLoaded);
        mBufferObjectsLoaded.clear();
    }
    
    public void unloadBufferObject(final BufferObject bufferObject) {
        if (bufferObject != null && BufferObjectManager.mBufferObjectsManaged.contains(bufferObject)) {
            if (BufferObjectManager.mBufferObjectsLoaded.contains(bufferObject)) {
                BufferObjectManager.mBufferObjectsToBeUnloaded.add(bufferObject);
                return;
            }
            if (BufferObjectManager.mBufferObjectsToBeLoaded.remove(bufferObject)) {
                BufferObjectManager.mBufferObjectsManaged.remove(bufferObject);
            }
        }
    }
    
    public void unloadBufferObjects(final BufferObject... array) {
        for (int i = -1 + array.length; i >= 0; --i) {
            this.unloadBufferObject(array[i]);
        }
    }
    
    public void updateBufferObjects(final GL11 gl11) {
        final HashSet<BufferObject> mBufferObjectsManaged = BufferObjectManager.mBufferObjectsManaged;
        final ArrayList<BufferObject> mBufferObjectsLoaded = BufferObjectManager.mBufferObjectsLoaded;
        final ArrayList<BufferObject> mBufferObjectsToBeLoaded = BufferObjectManager.mBufferObjectsToBeLoaded;
        final ArrayList<BufferObject> mBufferObjectsToBeUnloaded = BufferObjectManager.mBufferObjectsToBeUnloaded;
        final int size = mBufferObjectsToBeLoaded.size();
        if (size > 0) {
            for (int i = size - 1; i >= 0; --i) {
                final BufferObject bufferObject = mBufferObjectsToBeLoaded.get(i);
                if (!bufferObject.isLoadedToHardware()) {
                    bufferObject.loadToHardware(gl11);
                    bufferObject.setHardwareBufferNeedsUpdate();
                }
                mBufferObjectsLoaded.add(bufferObject);
            }
            mBufferObjectsToBeLoaded.clear();
        }
        final int size2 = mBufferObjectsToBeUnloaded.size();
        if (size2 > 0) {
            for (int j = size2 - 1; j >= 0; --j) {
                final BufferObject bufferObject2 = mBufferObjectsToBeUnloaded.remove(j);
                if (bufferObject2.isLoadedToHardware()) {
                    bufferObject2.unloadFromHardware(gl11);
                }
                mBufferObjectsLoaded.remove(bufferObject2);
                mBufferObjectsManaged.remove(bufferObject2);
            }
        }
    }
}
