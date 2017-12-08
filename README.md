# Krypton
Portable JavaScript Engine Featuring Mozilla Rhino

```sh
$K configurePrompt('"[" + XPR.getSystemType() + ": " + XPR.getSystemArchitecture().toUpperCase() + ": " + XPR.fileName(XPR.currentDirectory()) + "]$K "', true)
[Linux: AMD64: Krypton]$K 
```
### Purpose
Krypton was created to be a modern replacement for shell coding languages; which are powerful, but really don't have the readability of source code or power-features modern coders have become accustomed to using with JavaScript. Aside from Krypton's XPR (cross-platform-runtime for JavaScript), Krypton is not exactly "feature-rich", supporting only a handful of functions to get the XPR up and running in a working environment.

### Cross Platform Scripting
XPR is designed to sport a "flat api"; in other words we move away from the object oriented API model providing a single global object, which hosts all of the functions needed for the XPR based coding. Not only is the API model "flat", so are all of the return values and inputs. This means only primitives and strings are supported, however complex objects can be passed in/out using JSON. This design feature is so that XPR can be compatible with "molested" scripting environments like Android's WebView JavascriptInterface, or in situations where passing full-fledged-runtime-objects is not a suitable option, such as in network transmission and other stream oriented interfaces like unix pipes (when working with other programs as drivers for example).

### Supported POSIX Platforms

 1. aarch64-Linux
 2. arm-Linux
 3. Darwin
 4. i386-Linux
 5. i386-SunOS
 6. i386-Windows
 7. ppc64-Linux
 8. ppc64le-Linux
 9. ppc-AIX
10. sparcv9-Linux
11. spacv9-SunOS
12. x86_64-FreeBSD
13. x86_64-Linux
14. x86_64-OpenBSD
15. x86_64-SunOS
16. x86_64-Windows

### General Capabilities
You will find in Krypton's XPR, most everything (if not all) you need to do shell coding on multiple-platforms. Due to what Krypton is designed for, the Mozilla Rhino's live-connect feature is not enabled because we want to make sure your Krypton scripts can move around and be portable across multiple scripting engines, which may choose to offer an XPR clone, or emulation. So essentially, (if you have been paying attention) you can consider Krypton to be a shell for XPR. There are a few enhancements for Krypton itself in the works. You will have to "stay tuned" to find out what those are.

### MPL Licensing Compatibility Statement
For the time being, Krypton is a binary-only-java-virtual-machine-software. Apart from minification (deletions of unused source code) Krypton does not modify the Mozilla Rhino source code; however the compiled code may be modified during the packaging process by the packaging tools. If you would like to download the source code for Mozilla Rhino, please visit [Mozilla Rhino](https://developer.mozilla.org/en-US/docs/Mozilla/Projects/Rhino) on the web. In a future-time, should the need for modifications of Mozilla's Rhino Codebase arise by this project, the modifications or original archive and patches will be made available for downloading from within this repository, in accord with the MPL.

### JSON Tricks
Krypton also features technology from the [org.json](https://github.com/stleary/JSON-java) project, with a few modifications which make coding Krypton JSON outputs easier (convenience features) than they would be with the lack of said modificatons. Most notably, the JSONArray class has been hacked (extended) to allow appending tokenized JSON source to existing JSONArray objects. Krypton uses this feature in the XPR's run function, which takes only two string parameters, but offers file based redirections, stream captures, and string based stream inputs to the target program to name a few things that can be done.

### XPR Overview
Here is an SDK Snapshot of the current XPR API:

```javascript
JSON.stringify(Object.keys(XPR).sort(), function(k, v){if (k === "") return v; return XPR.getFunctionSDK(v);}, 2)
```
```json
[
  "appendTextFile: ƒ(FilePath file, String output, CharSet encoding) => void",
  "base64ToBuffer: ƒ(String source) => Buffer",
  "bufferBytesTotal: ƒ() => long",
  "bufferCount: ƒ() => long",
  "bufferLength: ƒ(Buffer buffer) => long",
  "bufferToBase64: ƒ(Buffer transferOut) => String",
  "bufferToString: ƒ(Buffer transferOut, CharSet encoding) => String",
  "changeDirectory: ƒ(FilePath directory) => void",
  "copyFile: ƒ(FilePath source, FilePath destination) => boolean",
  "createBuffer: ƒ(int width, int length) => Buffer",
  "createDirectory: ƒ(FilePath file) => boolean",
  "createFile: ƒ(FilePath file) => boolean",
  "currentDirectory: ƒ() => FilePath",
  "deleteEnvironmentKey: ƒ(String key) => void",
  "deleteFile: ƒ(FilePath file) => boolean",
  "directoryFile: ƒ(FilePath file) => boolean",
  "executableFile: ƒ(FilePath file) => boolean",
  "existingFile: ƒ(FilePath file) => boolean",
  "fileCreateTime: ƒ(FilePath file) => EpochTime",
  "fileName: ƒ(FilePath file) => String",
  "fileParent: ƒ(FilePath file) => String",
  "fileSize: ƒ(FilePath file) => long",
  "fileWritableSpace: ƒ(FilePath file) => long",
  "fileWriteTime: ƒ(FilePath file) => EpochTime",
  "freeBuffer: ƒ(Buffer buffer) => void",
  "getCharSet: ƒ() => CharSet",
  "getCharacterEncodings: ƒ(int jsonSpacing) => JSONArray",
  "getEnvironmentKey: ƒ(String key) => String",
  "getEnvironmentKeys: ƒ(int spacing) => JSONArray",
  "getFileSeparator: ƒ() => String",
  "getFileUri: ƒ(FilePath file) => FilePath",
  "getFunctionSDK: ƒ(String xprFunctionPath) => String",
  "getLineSeparator: ƒ() => String",
  "getParameter: ƒ(int parameter) => String",
  "getParameterCount: ƒ() => int",
  "getParameters: ƒ(int spacing) => JSONArray",
  "getPathSeparator: ƒ() => String",
  "getRealFile: ƒ(FilePath file) => FilePath",
  "getSystemArchitecture: ƒ() => String",
  "getSystemCharSet: ƒ() => CharSet",
  "getSystemType: ƒ() => String",
  "getSystemVersion: ƒ() => String",
  "getUserHome: ƒ() => String",
  "getUserName: ƒ() => String",
  "hiddenFile: ƒ(FilePath file) => boolean",
  "listFiles: ƒ(FilePath file, int spacing) => JSONArray",
  "markFileExecutable: ƒ(FilePath file, boolean status) => boolean",
  "markFileReadable: ƒ(FilePath file, boolean status) => boolean",
  "markFileWritable: ƒ(FilePath file, boolean status) => boolean",
  "moveFile: ƒ(FilePath source, FilePath destination) => boolean",
  "normalFile: ƒ(FilePath file) => boolean",
  "print: ƒ(String output, CharSet encoding) => void",
  "printError: ƒ(String output, CharSet encoding) => void",
  "printErrorLine: ƒ(String output, CharSet encoding) => void",
  "printLine: ƒ(String output, CharSet encoding) => void",
  "readBufferInput: ƒ(Buffer buffer) => int",
  "readLine: ƒ(CharSet encoding) => String",
  "readTextFile: ƒ(FilePath file, CharSet encoding) => String",
  "readableFile: ƒ(FilePath file) => boolean",
  "relativeFile: ƒ(FilePath file) => boolean",
  "run: ƒ(FilePath command, JSONObject options) => JSONObject",
  "setCharSet: ƒ(CharSet encoding, boolean validated) => void",
  "setEnvironmentKey: ƒ(String key, String value) => void",
  "setJsonSpacing: ƒ(int spacing) => void",
  "stringToBuffer: ƒ(String source, CharSet encoding) => Buffer",
  "updateFile: ƒ(FilePath source, FilePath destination) => boolean",
  "writableFile: ƒ(FilePath file) => boolean",
  "writeBufferOutput: ƒ(Buffer buffer) => void",
  "writeTextFile: ƒ(FilePath file, String output, CharSet encoding) => void"
]
```

### Development Note
You should note that this api is subject to change in form, function or naming convention at anytime, during this stage of development, and that this (above) listing is provided to you for general conception purposes.

### User Support
Krypton has a feature-rich console based help system to help you learn to use Krypton and navigate the XPR scripting APIs. As well, each function in Krypton and XPR sports a uniform usage error reporting mechanism, which tells you which arguments you need to execute the target function, and what went wrong with your supplied function parameter(s) during the function's pre-execution stage. Currently the system will report on missing arguments, and invalid argument types with an extremely technical, and helpful no-non-sense "nothing but the goods", "exactly how to do it" messaging system. Generally, you won't need to go searching the web to learn how to use Krypton, and you won't be needing any "man pages" either, the manual is builtin for portability and uniformity.

### International User Support
The text file reading and writing algorithms fully support two-way encoding schemes. Not only can you read/write your text files with a user supplied encoding, you can also load your startup script and support scripts with any user supplied encoding scheme supported by the local JVM host.

### Extensible Strategy Planning
While the Krypton/XPR system is made for shell coding, it is apparent that some people might want to do more than just shell coding with Krypton due to its great feature set. So, Krypton will eventually bring in Rhino Live Connect support, by allowing compiled Rhino Scripts to be specified for loading from the command line. Scripts won't be able to load such implements themselves (unless an extension provides such capabilities), and there may be some kind of file-system security layer put in place by configuration files, which will dicate what can and cannot be loaded in this manner. Using this method, logic dictates that, other script engines will be able to provide the same extensibility features as Krypton, even though they may not be Java Based applications, because the separation of the extensions from the main scripts, will allow the implementation to choose its own JVM strategy for loading the compiled JavaScript classes. Thusly, each extension is simply a portable support feature that can be probed from within the script.

### Summary
Krypton is a JavaScript shell for coding shell-tools across a diverse network of platforms. Typical usages are system-utilities, and application build-tools. The need for this tool became evident when the program's creator (Triston J. Taylor) got "fed-up" with the fact that his bash based make systems weren't cross platform friendly, which limited the reach of his cross-platform capable tools and applications. Therefore, Krypton is designed to do everything a bash-script can do with JavaScript rather than bash-script.

### Feasibility of Work
Some people might think that this project is not so useful, as there may be other JavaScript implementations out there which already provide such features as XPR provides. If there are, more power to them; and Krypton's creator wishes them the best in their endeavors, but if there is one thing Krypton's creator knows, and knows well about software engineering, its the beauty and power of the Unix Philosophies. This is something software coders these days are absolutely lost on, and for that reason, you won't find a better JavaScript based shell tool than one created by a certifiable-bash-script-hacking-master.
