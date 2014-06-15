package org.anddev.andengine.util;

public interface AsyncCallable<T>
{
    void call(Callback<T> p0, Callback<Exception> p1);
}
