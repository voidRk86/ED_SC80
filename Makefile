.SUFFIXES: .ASM .REL

.ASM.REL:
	./M80 '=$< /I'
	
ALL: HEADER.REL E0MAIN.REL E0FILEIO.REL E0CMDT.REL E0GETC.REL E0DISP.REL
	./L80 /P:104,HEADER,E0MAIN,E0FILEIO,E0CMDT,E0GETC,E0DISP,E80/N/E #Writeout to E80.COM
clean:
	rm *.REL
	rm *.PRN