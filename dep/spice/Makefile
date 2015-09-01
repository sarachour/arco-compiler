

all:
	cd spice3f5sfix; util/build linux 

clean:
	cd spice3f5sfix; util/build linux clean
	cd gcc; rm -rf build

install:
	cd spice3f5sfix; util/build linux install 


gcc-3.3:
	cd gcc; mkdir -p build;
	cd gcc/build && \
	../gcc-3.3.6/configure --prefix=/opt/gcc-3.3.6 \
		--enable-shared --enable-languages=c,c++ --enable-threads=posix && \
	make bootstrap	
