#!/bin/bash -euo pipefail
INDEX=`find -L ./ -name "*.amb" | sed 's/\.amb$//'`

bwa mem \
    -K 100000000 -Y -R "@RG\tID:null.test.test_L2\tPU:test_L2\tSM:test_test\tLB:test\tDS:s3://ngi-igenomes/testdata/nf-core/modules/genomics/homo_sapiens/genome/genome.fasta\tPL:ILLUMINA" \
    -t 2 \
    $INDEX \
    test_1.fastq.gz test_2.fastq.gz \
    | samtools sort   --threads 2 -o test-test_L2.sorted.bam -

cat <<-END_VERSIONS > versions.yml
"NFCORE_SAREK:SAREK:FASTQ_ALIGN_BWAMEM_MEM2_DRAGMAP_SENTIEON:BWAMEM1_MEM":
    bwa: $(echo $(bwa 2>&1) | sed 's/^.*Version: //; s/Contact:.*$//')
    samtools: $(echo $(samtools --version 2>&1) | sed 's/^.*samtools //; s/Using.*$//')
END_VERSIONS
