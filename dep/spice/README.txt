install dependencies

	sudo apt-get install libxt-dev libxaw7-dev:i386

Requires gcc-3.3. IF you don't have gcc-3.3 go to the building gcc-3.3 section
	
If on newer versions of linux, you need to add the following to your library path

	LIBRARY_PATH=/usr/lib/x86_64-linux-gnu
	export LIBRARY_PATH 

to ensure the build system is able to find cp1o.o

You may also need to fix the symbolic link for libgcc_s if you get -lgcc_s missing
but it's in your library path

	sudo ln -s /lib/i386-linux-gnu/libgcc_s.so.1 /lib/i386-linux-gnu/libgcc_s.so
	sudo ln -s /lib/x86_64-linux-gnu/libgcc_s.so.1 /lib/x86_64-linux-gnu/libgcc_s.so


The build system may also have issues finding gcc_s

make spice

	make
	
install spice to machine

	sudo make install

Make sure you add the following two lines to bashrc
	
	PATH=$PATH:/usr/local/spice/bin
	LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/spice/lib
	
## Installing GCC
GCC 3.3 needs to be installed and used for the spice build. If your headers 
are sufficiently old, you can compile using the following tutorial.

	http://www.linuxfromscratch.org/blfs/view/6.3/general/gcc3.html
	
If not, add the following source to your apt file.

	 http://old-releases.ubuntu.com/ubuntu/ hardy universe

Then 
	
	sudo apt-get install gcc-3.3


	
