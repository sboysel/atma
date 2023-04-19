all: output/pcbs/quadrate_pcb.kicad_pcb \
	output/pcbs/quadrate_pcb_front.jpg \
	output/pcbs/quadrate_pcb_back.jpg \
	img/quadrate_pcb_front_small.jpg

output/pcbs/quadrate_pcb.kicad_pcb: quadrate.yaml
	npm run gen

output/pcbs/quadrate_pcb_front.jpg: output/pcbs/quadrate_pcb.kicad_pcb 
	pcbdraw plot \
		--side front \
		--style gatema-green \
		$< $@
	mkdir -p img 
	cp $@ img/$(notdir $@)

output/pcbs/quadrate_pcb_back.jpg: output/pcbs/quadrate_pcb.kicad_pcb
	pcbdraw plot \
		--side back \
		--style gatema-green \
		$< $@
	mkdir -p img 
	cp $@ img/$(notdir $@)

img/quadrate_pcb_front_small.jpg: output/pcbs/quadrate_pcb_front.jpg
	mkdir -p img
	convert $< -resize 25% $@

# output/pcbs/quadrate_pcb_front.svg: output/pcbs/quadrate_pcb.kicad_pcb 
# 	kicad-cli pcb export svg -l '*' -o $@ $<

# output/pcbs/quadrate_pcb_front.pdf: output/pcbs/quadrate_pcb.kicad_pcb 
# 	kicad-cli pcb export pdf -l '*' -o $@ $<

clean:
	rm -rf output/pcbs/quadrate_pcb.kicad_pcb \
		img/quadrate_pcb_front.jpg \
		img/quadrate_pcb_back.jpg \
		output/pcbs/quadrate_pcb_front.jpg \
		output/pcbs/quadrate_pcb_back.jpg \
		img/quadrate_pcb_front_small.jpg
