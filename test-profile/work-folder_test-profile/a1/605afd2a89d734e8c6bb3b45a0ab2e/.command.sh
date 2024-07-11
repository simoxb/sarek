#!/bin/bash -euo pipefail
mosdepth \
    --threads 2 \
     \
    --fasta genome.fasta \
    -n --fast-mode --by 500 \
    test.md \
    test.md.cram

cat <<-END_VERSIONS > versions.yml
"NFCORE_SAREK:SAREK:BAM_MARKDUPLICATES:CRAM_QC_MOSDEPTH_SAMTOOLS:MOSDEPTH":
    mosdepth: $(mosdepth --version 2>&1 | sed 's/^.*mosdepth //; s/ .*$//')
END_VERSIONS
