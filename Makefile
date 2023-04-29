all: output/pcbs/atma_pcb.kicad_pcb \
	output/pcbs/atma_pcb_front.jpg \
	output/pcbs/atma_pcb_back.jpg \
	img/atma_pcb_front_small.jpg

output/pcbs/atma_pcb.kicad_pcb: atma.yaml
	npm run gen

output/pcbs/atma_pcb_front.jpg: output/pcbs/atma_pcb.kicad_pcb 
	pcbdraw plot \
		--side front \
		--style gatema-green \
		$< $@
	mkdir -p img 
	cp $@ img/$(notdir $@)

output/pcbs/atma_pcb_back.jpg: output/pcbs/atma_pcb.kicad_pcb
	pcbdraw plot \
		--side back \
		--style gatema-green \
		$< $@
	mkdir -p img 
	cp $@ img/$(notdir $@)

img/atma_pcb_front_small.jpg: output/pcbs/atma_pcb_front.jpg
	mkdir -p img
	convert $< -resize 25% $@

# output/pcbs/atma_pcb_front.svg: output/pcbs/atma_pcb.kicad_pcb 
# 	kicad-cli pcb export svg -l '*' -o $@ $<

# output/pcbs/atma_pcb_front.pdf: output/pcbs/atma_pcb.kicad_pcb 
# 	kicad-cli pcb export pdf -l '*' -o $@ $<

clean:
	rm -rf output/pcbs/atma_pcb.kicad_pcb \
		img/atma_pcb_front.jpg \
		img/atma_pcb_back.jpg \
		output/pcbs/atma_pcb_front.jpg \
		output/pcbs/atma_pcb_back.jpg \
		img/atma_pcb_front_small.jpg
