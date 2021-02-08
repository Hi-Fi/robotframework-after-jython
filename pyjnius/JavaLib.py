"""Main library."""

from typing import Optional

class JavaLib:
    ROBOT_LIBRARY_SCOPE = "GLOBAL"
    """General library documentation."""

    def __init__(
        self,
        library: str,
        classpath: Optional[str] = None):
        import jnius_config
        jnius_config.set_classpath(classpath)

        from jnius import autoclass
        JavaLibrary = autoclass(library)
        self.javaLibrary = JavaLibrary()
        self.HashMap = autoclass('java.util.HashMap')
        self.ArrayList = autoclass('java.util.ArrayList')

    def get_keyword_names(self):
        return self.javaLibrary.getKeywordNames()

    def run_keyword(self, keyword: str, args, kwargs):
        # JavaException: No methods matching your arguments, requested: ('createSession', ('google', 'http://www.google.com'), {}), available: ['(Ljava/lang/String;Ljava/util/List;Ljava/util/Map;)Ljava/lang/Object;', '(Ljava/lang/String;Ljava/util/List;)Ljava/lang/Object;']
        jlist = self.ArrayList()
        jmap = self.HashMap()
        for arg in args:
            jlist.add(arg)

        for key, value in kwargs.items():
            jmap.put(key, value)

        return self.javaLibrary.runKeyword(keyword, jlist, jmap)

    def get_keyword_documentation(self, keyword: str):
        try:
            # AnnotationLibrary returns java.lang.String
            documentation = self.javaLibrary.getKeywordDocumentation(keyword)
        except:
           documentation = ""
        return documentation
