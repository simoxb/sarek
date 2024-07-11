#!/bin/bash -euo pipefail
mosdepth \
    --threads 2 \
     \
    --fasta genome.fasta \
    -n --fast-mode --by 500 \
    test.recal \
    test.recal.cram

cat <<-END_VERSIONS > versions.yml
"NFCORE_SAREK:SAREK:CRAM_SAMPLEQC:CRAM_QC_RECAL:MOSDEPTH":
    mosdepth: $(mosdepth --version 2>&1 | sed 's/^.*mosdepth //; s/ .*$//')
END_VERSIONS
