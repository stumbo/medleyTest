# medley 
This repo is for the overall Lisp environment for Medley Interlisp.

A sub-project is [Interlisp/maiko](https://github.com/Interlisp/maiko) which is the implementation of the Lisp virtual machine. If you want to run on some other platform that we haven't tried, you just need to port/build Maiko.

We're still in the process of sorting out what we have and ensuring we start with a solid base.


## Running Medley on all platforms with Docker

If this is your first time working with Docker, you'll want to [install it](https://docs.docker.com/get-docker/) before continuing. You'll also need a modern VNC client; [TightVNC](https://www.tightvnc.com/) works well.

Next, you can either pull a prebuilt image or build from scratch:

### Using a prebuilt image (recommended)

1. `$ docker run -p 5900:5900 interlisp/medley`
2. Run a VNC viewer and connect to localhost.

### Building from scratch

1. Pull the latest Medley repo.
2. `$ cd medley`
3. Pull Maiko: `$ git submodule update --init --recursive`
4. `$ docker build . -t interlisp/medley`
5. And then as above.


## Running Medley on macOS

1. Download and install [XQuartz](https://www.xquartz.org/releases/). MacPorts has the most recent builds.
2. Clone this repo and [Interlisp/maiko](https://github.com/Interlisp/maiko) into the same parent directory.
3. In a terminal:
```sh
cd maiko/bin
./makeright x

cd ../../medley
./run-medley --dimensions 1440x800 -full &
```

### Middle-mouse tweak

if you don't have a 3-button mouse (wheel = middle mouse)
you can enable FN-left to be middle. Run in a terminal:

```sh
defaults write org.macosforge.xquartz.X11 enable_fake_buttons -boolean true
defaults write org.macosforge.xquartz.X11 fake_button2 fn
defaults write org.macosforge.xquartz.X11 fake_button3 none
```

To turn the settings back to the original default values do:

```sh
defaults write org.macosforge.xquartz.X11 enable_fake_buttons -boolean false
defaults delete org.macosforge.xquartz.X11 fake_button2
defaults delete org.macosforge.xquartz.X11 fake_button3
```


## Running Medley on Windows with WSL

Get the Windows X server called [Xming](https://sourceforge.net/projects/xming/) (the default options will do).

Make Maiko following the instructions [in that repo](https://github.com/Interlisp/maiko), and 
copy `lde` and `ldex` from `linux.x86_64` into your path (/usr/local/bin).

```sh
export MEDLEYDIR=/mnt/c/path-to-medley-directory
export HOME=/mnt/c/path-to-windows-home
export DISPLAY=:0
export LDEINIT="$MEDLEYDIR"/greetfiles/LOCAL-INIT

cd "$MEDLEYDIR"

IP=1.2.3.4  # your Windows machine's local IP
./run-medley --dimensions 1440x800 --display "$IP":0 -bw 0 -full &
```

## Naming conventions and directory structure

File Names and Extensions: Most Interlisp source file names are
UPPERCASE and Interlisp didn't use file extensions for its source
files.  (note that any .TEDIT or .TXT file is probably documentation
for the package of same name, at least in the library,
internal/library, lispusers)

The current repo has both Lisp sources and compiled .LCOM and .DFASL
files, because some files don't compile in a vanilla lisp.sysout .

Each directory should have a README.md, but briefly
- basics -- old sysouts needed (for now) for rebuilding new sysouts
- docs -- Documentation files (either PDFs or online help)
- fonts -- raster fonts (or font widths) in various resolutions for display, postscript, interpress, press formats
- greetfiles -- should have any necessary setup of directories Lisp should look in for load
- internal -- These _were_ internal to Venue
- library  -- packages that were supported (30 years ago)
- lispusers -- packages that were only half supported (ditto)
- loadups   -- has sysouts and other builds
- makesysout -- files for making new sysouts for various configurations, based on basics
- patches -- ""
- sunloadup --  support information for making a new lisp.sysout from scratch
- sources   -- sources for Interlisp and Common Lisp implementations
- unicode  -- data files for support of XCCS to and from Unicode mappings

plus
   Dockerfile, and scripts for building and running medley
