all: ergogen/pcbs/atma.kicad_pcb

ergogen/pcbs/atma.kicad_pcb: atma.yaml
	npm run gen

clean:
	rm -rf ergogen/pcbs/atma.kicad_pcb
