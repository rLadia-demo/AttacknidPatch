package org.anddev.andengine.util;

import org.anddev.progressmonitor.*;

public interface ProgressCallable<T>
{
    T call(IProgressListener p0) throws Exception;
}
