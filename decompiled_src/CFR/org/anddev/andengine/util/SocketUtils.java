/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.util;

import java.io.IOException;
import java.io.PrintStream;
import java.net.ServerSocket;
import java.net.Socket;

public class SocketUtils {
    public static final String SOCKETEXCEPTION_MESSAGE_SOCKET_CLOSED = "socket closed";
    public static final String SOCKETEXCEPTION_MESSAGE_SOCKET_IS_CLOSED = "Socket is closed";

    public static void closeSocket(ServerSocket serverSocket) {
        if (serverSocket == null || serverSocket.isClosed()) return;
        try {
            serverSocket.close();
            return;
        }
        catch (IOException var1_1) {
            var1_1.printStackTrace();
            return;
        }
    }

    public static void closeSocket(Socket socket) {
        if (socket == null || socket.isClosed()) return;
        try {
            socket.close();
            return;
        }
        catch (IOException var1_1) {
            System.err.println(var1_1.getStackTrace());
            return;
        }
    }
}

