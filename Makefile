
CFLAGS=-O3 -g -std=gnu99 -Ithird_party -D DASM_VERSION=10400

all: jit1 jit2 jit3
clean:
	rm -rf jit1 jit2 jit3 jit2.c jit3.c

jit1: jit1.c

jit2.c: jit2.dasc
	luajit third_party/dynasm/dynasm.lua jit2.dasc > jit2.c

jit2: dynasm-driver.h jit2.c
	$(CC) $(CFLAGS) -o jit2 dynasm-driver.h jit2.c

jit3.c: jit3.dasc
	luajit third_party/dynasm/dynasm.lua jit3.dasc > jit3.c

jit3: dynasm-driver.h jit3.c
	$(CC) $(CFLAGS) -o jit3 dynasm-driver.h jit3.c
