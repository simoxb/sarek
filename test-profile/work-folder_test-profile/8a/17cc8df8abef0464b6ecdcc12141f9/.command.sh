#!/bin/bash -euo pipefail
mkdir bwa
bwa \
    index \
     \
    -p bwa/genome \
    genome.fasta

cat <<-END_VERSIONS > versions.yml
"NFCORE_SAREK:PREPARE_GENOME:BWAMEM1_INDEX":
    bwa: $(echo $(bwa 2>&1) | sed 's/^.*Version: //; s/Contact:.*$//')
END_VERSIONS
