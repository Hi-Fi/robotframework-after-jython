package com.github.hi_fi.robotframework_after_jython.py4j;

import java.util.ArrayList;
import org.robotframework.javalib.library.AnnotationLibrary;
import py4j.GatewayServer;


public class RobotLibraryEntryPoint extends AnnotationLibrary {

    public RobotLibraryEntryPoint() {
		super(new ArrayList<String>() {{
            add("com/github/hi_fi/dblibrary/keywords/**");
            add("com/github/hi_fi/httprequestlibrary/keywords/**");
              }});
	}

    public static void main(String[] args) {
        GatewayServer gatewayServer = new GatewayServer(new RobotLibraryEntryPoint(), Integer.parseInt(args[0]));
        gatewayServer.start();
        System.out.println("Gateway Server Started at port "+gatewayServer.getPort());
    }

}

