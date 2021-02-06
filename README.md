# robotframework-after-jython
Robocon 2021 presentation examples

## Jython

Current RF approach of running is to use Jython. This is the approach that is surely going away, as Jython supports only Python 2 which has been discontinued from April 2020. Also because of the age of Jython, it could easily have issues with newer JDKs.

Example simplified from https://github.com/Hi-Fi/robotframework-java-example.

## GraalPython

GraalPython sounds by description best bet for replacing Jython almost as is. Issue is, that it's still experimental, and doesn't support e.g. pip at all.

When Robot Framework is installed from source, it's stil not working but throwing:

```
robot
KeyError: host symbol java.io.BufferedReader is not defined or access has been denied

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/home/robot/.local/bin/robot", line 11, in <module 'robot'>
    load_entry_point('robotframework==3.2.2', 'console_scripts', 'robot')()
  File "/home/robot/.local/lib/python3.8/site-packages/setuptools-41.0.1-py3.8.egg/pkg_resources/__init__.py", line 489, in load_entry_point
    return get_distribution(dist).load_entry_point(group, name)
  File "/home/robot/.local/lib/python3.8/site-packages/setuptools-41.0.1-py3.8.egg/pkg_resources/__init__.py", line 2843, in load_entry_point
    return ep.load()
  File "/home/robot/.local/lib/python3.8/site-packages/setuptools-41.0.1-py3.8.egg/pkg_resources/__init__.py", line 2434, in load
    return self.resolve()
  File "/home/robot/.local/lib/python3.8/site-packages/setuptools-41.0.1-py3.8.egg/pkg_resources/__init__.py", line 2440, in resolve
    module = __import__(self.module_name, fromlist=['__name__'], level=0)
KeyError: host symbol io.BufferedReader is not defined or access has been denied
```
