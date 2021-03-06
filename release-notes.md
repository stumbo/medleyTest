Each release should have a subset of the medley repo in a file
     `medley-`releasename`.tgz`

and at least one
     `maiko-`releasename`.`osname`.`arch`.tgz`
   
e.g.,
	 `maiko-$tag.linux.x86_64.tgz`

for each os/arch pair for which we have GitHub "action" runners.

To use (from a shell/terminal window):

1. Unpack the medley tar file
  ```
  tar -xvfz medley-$tag.tgz
  ```
  and the maiko file for your os.arch
  ```
  tar -xvfz maiko-$tag.linux.x86_64.tgz
  ```
  this should leave you with two new directories, `medley` and `maiko`.
  Then you can 
   ```
   cd medley
   ./run-medley -full
   ```
   

