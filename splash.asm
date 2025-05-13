// Exomizer PETSCII decrunch master

// Labels for memory area of the PETSCII logo (this can be custom)
.label screenmem = PETSCII

// The C64's default colour and screen RAM location

.label screenram = $0400
.label colourram = $d800

.var bordercolour = 4 // Purple background
.var backgroundcolour = 0 // Black background


	// Import the crunched program

	*=$0801
	.import c64 "crunched.prg"

	// Main routine after decruncher

	lda #$04
	sta $d020
	lda #$00
	sta $d021
	lda #$16 // Default char
	sta $d018

	// Draw the PETSCII logo by copying and
	// pasting the memory loaction to the
	// screen and colour RAM.

	ldx #$00
drawpetscii:
	lda screenmem,x
	sta screenram,x
	lda screenmem+$100,x
	sta screenram+$100,x
	lda screenmem+$200,x
	sta screenram+$200,x
	lda screenmem+$2e8,x
	sta screenram+$2e8,x
	lda #$01
	sta colourram,x
	sta colourram+$100,x
	sta colourram+$200,x
	sta colourram+$2e8,x
	inx
	bne drawpetscii
	rts // Exit subroutine ... this will then
	    // jump directly to the main decrunch
		// routine in exomizer!

PETSCII:
	.import binary "data/splash"
