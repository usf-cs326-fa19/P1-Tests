all: virtualproc.so

virtualproc.so: virtualproc.c
	gcc -Wall -shared -fPIC -ldl $< -o $@

clean:
	rm -f virtualproc.so
