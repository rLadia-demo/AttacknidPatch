package org.anddev.andengine.extension.multiplayer.protocol.util.constants;

public interface ServerMessageFlags
{
    public static final short COUNT_FLAG_MESSAGE_SERVER_CONNECTION = 64;
    public static final short FLAG_MESSAGE_SERVER_CONNECTION_ACCEPTED = Short.MIN_VALUE;
    public static final short FLAG_MESSAGE_SERVER_CONNECTION_CLOSE = -32766;
    public static final short FLAG_MESSAGE_SERVER_CONNECTION_PING = -32765;
    public static final short FLAG_MESSAGE_SERVER_CONNECTION_PONG = -32764;
    public static final short FLAG_MESSAGE_SERVER_CONNECTION_REFUSED = -32767;
    public static final short INDEX_FLAG_MESSAGE_SERVER_CONNECTION_FIRST = Short.MIN_VALUE;
    public static final short INDEX_FLAG_MESSAGE_SERVER_CONNECTION_LAST = -32705;
}
