package org.anddev.andengine.extension.multiplayer.protocol.adt.message;

import java.io.*;

public interface IMessage
{
    void transmit(DataOutputStream p0) throws IOException;
}
