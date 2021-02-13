"""Main library."""

from typing import Optional

from py4j.java_gateway import JavaGateway, GatewayParameters
from py4j.java_collections import MapConverter, ListConverter

class Py4jLibrary:
    ROBOT_LIBRARY_SCOPE = "GLOBAL"
    """General library documentation."""

    def __init__(
        self,
        port: int):
        self.library = JavaGateway(gateway_parameters=GatewayParameters(port=port, auto_field=True)).entry_point

    def get_keyword_names(self):
        return self.library.getKeywordNames()

    def run_keyword(self, keyword: str, args, kwargs):
        # JavaException: No methods matching your arguments, requested: ('createSession', ('google', 'http://www.google.com'), {}), available: ['(Ljava/lang/String;Ljava/util/List;Ljava/util/Map;)Ljava/lang/Object;', '(Ljava/lang/String;Ljava/util/List;)Ljava/lang/Object;']
        # jlist = self.ArrayList()
        # jmap = self.HashMap()
        # for arg in args:
        #     jlist.add(arg)

        # for key, value in kwargs.items():
        #     jmap.put(key, value)

        java_list = ListConverter().convert(args, self.library._gateway_client)
        java_map = MapConverter().convert(kwargs, self.library._gateway_client)
        return self.library.runKeyword(keyword, java_list, java_map)

    def get_keyword_documentation(self, keyword: str):
        try:
            # AnnotationLibrary returns java.lang.String
            documentation = self.library.getKeywordDocumentation(keyword)
        except:
           documentation = ""
        return documentation
