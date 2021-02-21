package com.github.hi_fi.robotframework_after_jython;

import java.util.ArrayList;

import org.robotframework.javalib.library.AnnotationLibrary;

public class JavaLibrary extends AnnotationLibrary {
    public static final String ROBOT_LIBRARY_SCOPE = "GLOBAL";

    public JavaLibrary() {
		super(new ArrayList<String>() {{
            add("com/github/hi_fi/dblibrary/keywords/**");
            add("com/github/hi_fi/httprequestlibrary/keywords/**");
              }});
	}
}
