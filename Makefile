.SUFFIXES: .ASM .REL

.ASM.REL:
	./M80 '=$< /I/L'
	
ALL: HEADER.REL E0MAIN.REL E0FILEIO.REL E0CMDT.REL E0GETC.REL E0DISP.REL
	./L80 /P:104,HEADER,E0MAIN,E0FILEIO,E0CMDT,E0GETC,E0DISP,ESC80.RK/N/E/Y #Writeout to ESC80.RK
	cp ESC80.RK bin
clean:
	rm *.REL
	rm *.PRN