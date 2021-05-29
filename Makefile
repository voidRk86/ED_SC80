EMUPATH=/Users/tchv/emu80v4/build-Emu80qt-Desktop_x86_darwin_generic_mach_o_64bit-Release/Emu80qt.app/Contents/MacOS
M80PATH=/Users/tchv/.cargo/bin

.SUFFIXES: .ASM .REL

.ASM.REL:
	$(M80PATH)/M80 '=$< /I/L'

	
E0MAIN.REL: E0MAIN.ASM E0DISP.MAC RK86.MAC E0BREAK.MAC

E0DISP.REL: E0DISP.ASM E0DISP.MAC

EDSC80.REL: EDSC80.ASM E0MAIN.ASM E0FILEIO.ASM E0CMDT.ASM E0GETC.ASM E0DISP.ASM E0DISP.MAC RK86.MAC E0BREAK.MAC

clean:
	rm *.REL
	rm *.PRN

all: EDSC80.REL
	$(M80PATH)/L80 /P:100,EDSC80,EDSC80.BIN/U/N/E/Y #Writeout to EDSC80.BIN
	../makerk/Release/makerk 0 EDSC80.BIN bin/ESC80_32k_NoInit.rk

run: bin/ESC80_32k_NoInit.rk
	$(EMUPATH)/Emu80Qt bin/ESC80_32k_NoInit.rk