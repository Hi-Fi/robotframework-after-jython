"""Main library."""

from typing import Optional
# Import module
import jpype

# Enable Java imports
import jpype.imports

# Pull in types
from jpype.types import *

import importlib


class JavaLib:
    ROBOT_LIBRARY_SCOPE = "GLOBAL"
    """General library documentation."""

    def __init__(
        self,
        library: str,
        classpath: Optional[str] = None):
        if jpype.isJVMStarted():
            print("JVM running")
        else:
            jpype.startJVM(classpath=classpath.split(":"))
        JavaLibrary = importlib.import_module(library)
        self.javaLibrary = JavaLibrary()

    def get_keyword_names(self):
        keywords = []
        # AnnotationLibrary return Java's ArrayList with Java's Strings, converting to Python
        for keyword in self.javaLibrary.getKeywordNames():
            keywords.append(str(keyword))

        return keywords

    def run_keyword(self, keyword: str, args, kwargs):
        import java
        return self.javaLibrary.runKeyword(JString(keyword), java.util.ArrayList(args), java.util.HashMap(kwargs))

    def get_keyword_documentation(self, keyword: str):
        try:
            # AnnotationLibrary returns java.lang.String
            documentation = str(self.javaLibrary.getKeywordDocumentation(keyword))
        except:
           documentation = ""
        return documentation
