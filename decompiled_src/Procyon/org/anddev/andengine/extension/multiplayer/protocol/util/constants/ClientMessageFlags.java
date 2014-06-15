package org.anddev.andengine.extension.multiplayer.protocol.util.constants;

public interface ClientMessageFlags
{
    public static final short COUNT_FLAG_MESSAGE_CLIENT_CONNECTION = 64;
    public static final short FLAG_MESSAGE_CLIENT_CONNECTION_CLOSE = -32767;
    public static final short FLAG_MESSAGE_CLIENT_CONNECTION_ESTABLISH = Short.MIN_VALUE;
    public static final short FLAG_MESSAGE_CLIENT_CONNECTION_PING = -32766;
    public static final short FLAG_MESSAGE_CLIENT_CONNECTION_PONG = -32765;
    public static final short INDEX_FLAG_MESSAGE_CLIENT_CONNECTION_FIRST = Short.MIN_VALUE;
    public static final short INDEX_FLAG_MESSAGE_CLIENT_CONNECTION_LAST = -32705;
}
