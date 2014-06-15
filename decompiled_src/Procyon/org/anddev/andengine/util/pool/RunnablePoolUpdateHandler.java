package org.anddev.andengine.util.pool;

public abstract class RunnablePoolUpdateHandler<T extends RunnablePoolItem> extends PoolUpdateHandler<T>
{
    public RunnablePoolUpdateHandler() {
        super();
    }
    
    public RunnablePoolUpdateHandler(final int n) {
        super(n);
    }
    
    @Override
    protected abstract T onAllocatePoolItem();
    
    @Override
    protected void onHandlePoolItem(final T t) {
        t.run();
    }
}
