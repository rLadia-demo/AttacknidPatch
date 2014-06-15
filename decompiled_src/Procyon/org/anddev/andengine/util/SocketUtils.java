package org.anddev.andengine.util;

import java.io.*;
import java.net.*;

public class SocketUtils
{
    public static final String SOCKETEXCEPTION_MESSAGE_SOCKET_CLOSED = "socket closed";
    public static final String SOCKETEXCEPTION_MESSAGE_SOCKET_IS_CLOSED = "Socket is closed";
    
    public static void closeSocket(final ServerSocket serverSocket) {
        if (serverSocket == null || serverSocket.isClosed()) {
            return;
        }
        try {
            serverSocket.close();
        }
        catch (IOException ex) {
            ex.printStackTrace();
        }
    }
    
    public static void closeSocket(final Socket socket) {
        if (socket == null || socket.isClosed()) {
            return;
        }
        try {
            socket.close();
        }
        catch (IOException ex) {
            System.err.println(ex.getStackTrace());
        }
    }
}
