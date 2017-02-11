SDCC=sdcc
SDLD=sdld
OBJECTS=useless.hex test.hex

.PHONY: all clean

all: $(OBJECTS)

clean:
	rm -f $(OBJECTS) *.cdb *.lst *.asm *.lk *.map *.rel *.rst *.sym
	
%.ihx: %.c
	$(SDCC) -lstm8 -mstm8 --out-fmt-ihx $(CFLAGS) $(LDFLAGS) $<

%.hex: %.ihx
	cp $^ $@
	cp $@ ~/vm\ shared
