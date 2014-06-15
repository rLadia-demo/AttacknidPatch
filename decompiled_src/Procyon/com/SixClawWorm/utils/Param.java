package com.SixClawWorm.utils;

import com.SixClawWorm.application.*;

public class Param
{
    public static BluetoothChatService ChatService;
    public static boolean ConntectSucceed;
    public static String address;
    public static boolean connecting;
    public static boolean ifinTrodutionActivity;
    
    static {
        Param.ConntectSucceed = false;
        Param.address = "";
        Param.ChatService = null;
        Param.connecting = false;
        Param.ifinTrodutionActivity = false;
    }
}
