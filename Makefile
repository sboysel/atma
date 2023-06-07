all: output/pcbs/atma.kicad_pcb

output/pcbs/atma.kicad_pcb: atma.yaml
	npm run gen

clean:
	rm -rf output/pcbs/atma.kicad_pcb
