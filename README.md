# robotframework-after-jython

Robocon 2021 presentation examples.

Overview of Python-Java bridges (maybe a bit more developer view) [here]
(Overvies of these: https://talvi.net/a-brief-overview-of-python-java-bridges-in-2020.html)

## Only JVM

### [Jython](https://www.jython.org/)

Current RF approach of running is to use Jython. This is the approach that is surely going away, as Jython supports only Python 2 which has been discontinued from April 2020. Also because of the age of Jython, it could easily have issues with newer JDKs.

Example simplified from https://github.com/Hi-Fi/robotframework-after-jython.

Pros:
- Cross OS
- Available at Maven Central
- Quite easy to work also without Docker

Cons:
- Python 2
- Dead project

### [GraalPython](https://github.com/oracle/graalpython)

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

Pros:
- Promises quite much

Cons:
- Experimental
- Not possible to run other than whitelisted Python packages for sure
- Uses OS specific libraries, so installation "as hard" as Python.
- Not available at Maven central (see [issue](https://github.com/oracle/graalpython/issues/96))
- No Windows support

## Python + JVM

### Remote

See e.g. [Python RF + Java library](https://github.com/Hi-Fi/robotframework-remote-workshop/tree/main/using_remote_libraries/2-hello_existing_library/python3%2Bjava)
 or [Robocon 2020 talk](https://github.com/Hi-Fi/rf-remote-library-demos) examples.

Pros:
- Libraries can be used as-is, offering remotely is simple to add
- Offers also other possibilities like distributing libraries to multiple nodes/networks.

Cons:
- No listener interface over remote

### JPype

JPype allows to interact with Java classes directly from Python code. In RF case this would mean simple wrapper (like e.g. jrobotremoteserver for remote)
that would offer library to RF.

Cons:
- Type casting needs to be done manually (one time thing in the wrapper library)
- "Packageless" libraries can't be imported (As those can't be imported with Java). Can be solved by making a wrapper.

### Pyjnius

Quite like JPype. A bit harder (for dependency sake) to take in use, but a bit easier for type casting.

Pros:
- Handles primitive type casting (e.g. strings) automacally.
- Handles multiple invocations self.

Cons:
- More requirements than JPype
- "Packageless" libraries can't be imported (As those can't be imported with Java). Can be solved by making a wrapper.


### Py4J

More similar to remote library than JPype or Pyjnius. JVM has to be started before Python execution, as Python just calls Java gateway.

Cons:
- Port handling
- A bit more complicated than ones which handle JVM self.

