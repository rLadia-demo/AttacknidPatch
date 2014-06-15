/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.app.Activity
 *  android.app.Application
 */
package com.SixClawWorm.application;

import android.app.Activity;
import android.app.Application;
import java.util.LinkedList;
import java.util.List;

public class MeetingApplication
extends Application {
    public static String VERSION = "1.0";
    private static MeetingApplication instance;
    private List<Activity> mList = new LinkedList<Activity>();

    public static MeetingApplication getInstance() {
        synchronized (MeetingApplication.class) {
            if (MeetingApplication.instance == null) {
                MeetingApplication.instance = new MeetingApplication();
            }
            MeetingApplication meetingApplication = MeetingApplication.instance;
            return meetingApplication;
        }
    }

    public void addActivity(Activity activity) {
        this.mList.add(activity);
    }

    /*
     * Exception decompiling
     */
    public void exit() {
        // This method has failed to decompile.  When submitting a bug report, please provide this stack trace, and (if you hold appropriate legal rights) the relevant class file.
        // org.benf.cfr.reader.util.ConfusedCFRException: Tried to end blocks [0[TRYBLOCK]], but top level block is 5[WHILELOOP]
        // org.benf.cfr.reader.bytecode.analysis.opgraph.Op04StructuredStatement.processEndingBlocks(Op04StructuredStatement.java:406)
        // org.benf.cfr.reader.bytecode.analysis.opgraph.Op04StructuredStatement.buildNestedBlocks(Op04StructuredStatement.java:458)
        // org.benf.cfr.reader.bytecode.analysis.opgraph.Op03SimpleStatement.createInitialStructuredBlock(Op03SimpleStatement.java:2648)
        // org.benf.cfr.reader.bytecode.CodeAnalyser.getAnalysisInner(CodeAnalyser.java:670)
        // org.benf.cfr.reader.bytecode.CodeAnalyser.getAnalysisOrWrapFail(CodeAnalyser.java:185)
        // org.benf.cfr.reader.bytecode.CodeAnalyser.getAnalysis(CodeAnalyser.java:143)
        // org.benf.cfr.reader.entities.attributes.AttributeCode.analyse(AttributeCode.java:78)
        // org.benf.cfr.reader.entities.Method.analyse(Method.java:364)
        // org.benf.cfr.reader.entities.ClassFile.analyseMid(ClassFile.java:683)
        // org.benf.cfr.reader.entities.ClassFile.analyseTop(ClassFile.java:616)
        // org.benf.cfr.reader.Main.doJar(Main.java:116)
        // org.benf.cfr.reader.Main.main(Main.java:167)
        throw new IllegalStateException("Decompilation failed");
    }

    public void onCreate() {
        super.onCreate();
        MeetingApplication.instance = this;
    }

    public void onExit() {
    }

    public void onLowMemory() {
        super.onLowMemory();
        System.gc();
    }
}

