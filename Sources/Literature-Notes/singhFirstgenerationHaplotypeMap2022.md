---
citekey: singhFirstgenerationHaplotypeMap2022
title: "A first-generation haplotype map (HapMap-1) of tea ( <i>Camellia sinensis</i> L. O. Kuntz)"
authors: [Singh, Rawal, Angadi, Sharma, Singh, Mondal]
year: 2022
journal: "Bioinformatics"
doi: "10.1093/bioinformatics/btab690"
url: "https://academic.oup.com/bioinformatics/article/38/2/318/6380552"
zotero-link: "zotero://select/library/items/9ATT475L"
extraction-status: read
lineage-relevant: true
species-relevant: true
region-relevant: true
tags: [literature, source]
---

# A first-generation haplotype map (HapMap-1) of tea ( <i>Camellia sinensis</i> L. O. Kuntz)

> **Authors:** Nisha Singh, Hukam C Rawal, Ulavappa B Angadi, Tilak Raj Sharma, Nagendra Kumar Singh, Tapan Kumar Mondal
> **Year:** 2022
> **Journal:** Bioinformatics
> **DOI:** 10.1093/bioinformatics/btab690
> [Open in Zotero](zotero://select/library/items/9ATT475L)

---

## Abstract

Motivation: Tea is a cross-pollinated woody perennial plant, which is why, application of conventional breeding is limited for its genetic improvement. However, lack of the genome-wide high-density SNP markers and genome-wide haplotype information has greatly hampered the utilization of tea genetic resources toward fast-track tea breeding programs. To address this challenge, we have generated a ﬁrst-generation haplotype map of tea (Tea HapMap-1). Out-crossing and highly heterozygous nature of tea plants, make them more complicated for DNA-level variant discovery.

---

## Key Claims Relevant to Tea KG

- Whole-genome re-sequencing of 369 diverse tea genotypes (five *Camellia* species) generated a "Tea HapMap-1": 2,334,564 filtered biallelic SNPs and 1,447,985 InDels, from an initial raw call set of 23,210,504 markers (21,267,645 raw biallelic SNPs, 1,942,859 raw biallelic indels) after GATK hard filtering.
- ~2928.04 million paired-end reads were used, with an average per-accession mapping depth of only 0.31x (range 0.01–1.61x); read lengths ranged 45–201 bp (avg 110 bp); 95–98% of reads mapped to the reference genome but only ~50–60% had non-zero mapping quality.
- Reference genome used for alignment/variant calling: CSS_V1.2 (Chen et al. 2020).
- Panel composition (369 genotypes total): *C. crassicolumna* (n=4), *C. remotiserrata* (n=50), *C. sinensis* (n=224), *C. tachangensis* (n=86), *C. taliensis* (n=5).
- Genome-wide average SNP density estimated at ~7–10 SNPs per kilobase pair.
- Average expected heterozygosity across the 369 genotypes = 0.651 (~65%); per-window heterozygosity ranged 0.347–0.923; ~35% of genotypes classified as moderately homozygous.
- Heterozygosity ranking among species: *C. sinensis* is most heterozygous, followed by *C. tachangensis*, then *C. taliensis*; *C. remotiserrata* and *C. crassicolumna* had the lowest heterozygosity (inbreeding coefficient F range 0.3–0.5).
- Tajima's D (100 kb windows) ranged 0.0167–3.606 across the genome; mean Tajima's D = 1.184.
- Elevated Tajima's D, nucleotide diversity and heterozygosity in *C. sinensis* interpreted by the authors as evidence of balancing selection; *C. sinensis* shows moderate-to-high overall genetic diversity.
- The paper reports (somewhat inconsistently) that *C. taliensis*, a wild tea relative, shows greater loss of genetic diversity and stronger genetic drift than domesticated *C. sinensis* (attributed to preferential selection, over-exploitation and habitat fragmentation of wild populations), while the conclusion separately states *C. taliensis* "has conserved genetic composition" as a close wild relative of *C. sinensis*.
- Estimated divergence time between Chinese Assam-type tea and Indian Assam-type tea = ~2770 years ago, said to be consistent with historical records of tea usage in Yunnan.
- Botanical classification cited: tea divided into three groups — broad-leaf Assam type (*Camellia assamica*), small-leaf China type (*Camellia sinensis*), and intermediate type (*Camellia assamica lasiocalyx*).
- Discussion cites prior work indicating two domestication events detected via nuclear microsatellites (nSSR) — one for China-type tea, one for Indian tea (Meegahakumbura et al. 2016) — and, separately, three independent domestication events for China type, Assam type and Cambod type tea (Cohen-Stuart 1919).
- Origin/domestication of tea considered controversial; candidate origin regions cited: Sichuan and Yunnan provinces of China, Assam (India), and Indo-Burma region.
- Tea genome estimated at ~3 Gb across 15 chromosomes (citing Chen et al. 2020; Mondal et al. 2019; Xia et al. 2020).
- Data sourced from two public repositories: National Genomics Data Center (NGDC), China (Project CRA001438) and European Nucleotide Archive (ENA, Project PRJNA222497).
- Resulting Tea HapMap-1 variant call data deposited at European Variation Archive (EVA), EMBL-EBI, under Project PRJEB43159, analysis accession ERZ1741156.
- A public Tea HapMap-1 web database was built (http://webtom.cabgrid.res.in/teahapmap/), providing BLAST search against the reference genome and chromosome-wise download of raw/filtered SNP and InDel VCFs for the 369 accessions.
- Background claim: tea is grown commercially in over 81 countries with an annual leaf harvest of more than 5 million tonnes (citing Mondal 2020); China Tea Science Society statistics cited as documenting collection/conservation of more than 15,000 tea plant accessions in China.

## Cultivars / Species Mentioned

- *Camellia sinensis* (small-leaf China type)
- *Camellia assamica* (broad-leaf Assam type)
- *Camellia assamica lasiocalyx* (intermediate type)
- *Camellia crassicolumna*
- *Camellia remotiserrata*
- *Camellia tachangensis*
- *Camellia taliensis* (wild tea relative)
- China type tea
- Assam type tea
- Cambod type tea
- cultivar Shuchazao (referenced re: prior genome/transcriptome sequencing work)

## Regions Mentioned

- New Delhi, India (ICAR-National Institute for Plant Biotechnology, LBS Building, Pusa campus; ICAR-Indian Agricultural Statistics Research Institute)
- China (general; source of NGDC data and >15,000 conserved germplasm accessions)
- Sichuan province, China (candidate tea origin region)
- Yunnan province, China (candidate tea origin region; site of early historical tea-usage records)
- Assam, India (candidate tea origin region)
- Indo-Burma region (candidate tea origin region)
- Kolkata, India (National Tea Research Foundation / Tea Board, Ministry of Commerce — funding source)
- Asia (general tea-growing region)
- Africa (general tea-growing region)
- Latin America (general tea-growing region)

## Methods Used

- Whole-genome re-sequencing (public short-read paired-end data) of 369 tea genotypes, compiled from NGDC (China) and ENA repositories.
- Read alignment to reference genome CSS_V1.2 using the BWA-mem aligner.
- Variant calling with Sentieon's DNase pipeline (v201911.03), a proprietary GATK-equivalent implementation using HaplotypeCaller; per-sample gVCFs jointly genotyped into a single VCF via GVCFtyper.
- GATK best-practices hard filtering of SNPs (QD < 2, FS > 60.0, MQ < 40.0, MQRankSum < -12.5, ReadPosRankSum < -8.0 removed) and InDels (QD < 2.0, FS > 200.0, ReadPosRankSum < -20.0 removed).
- Additional filtering with vcftools: masking of heterozygous calls with allele-balance (AB) < 30, masking genotypes with read depth (minDP) < 4, removal of monomorphic markers and markers with call rate < 50%, and removal of SNPs with inbreeding coefficient < 0.
- Population genetics statistics computed with vcftools (--site-pi, --TajimaD, --weir-fst-pop) and bedtools (window averaging): per-individual heterozygosity/inbreeding coefficient (F), nucleotide diversity (pi), Tajima's D, and per-site Fst.
- Inbreeding coefficient calculated as IC = 1 − (Hobs / Hexp).
- Window heterozygosity (HW) computed over 100 kb genomic windows; Tajima's D computed in sliding windows (window length = 100 sites, step size = 25 sites), also visualized in 1 Mb windows per chromosome.
- Development of a public Tea HapMap-1 web database: three-tier architecture (HTML/Java client interface, PHP server-side scripting, MySQL backend), FTP server for bulk data download, and integrated NCBI BLAST search (greedy algorithm) against the reference genome.

## Conflicts With Other Sources

- **Taxonomic rank of "assamica" differs from [[weiDevelopmentGenomewide200K2022]] and the Taiwan-focused papers in this vault.** This paper treats the broad-leaf Assam type as its own species, *Camellia assamica*, alongside *C. sinensis* (small-leaf China type) as a separate species. Wei et al. (2022), Hu et al. (2014/2023), Lee et al. (2017), and Su et al. all instead treat it as *Camellia sinensis var. assamica* — a variety within *C. sinensis*, not a distinct species. Same underlying germplasm group, different taxonomic rank; relevant for deciding the canonical rank to use for the "assamica" node in the KG.

## Extraction Status

- [x] Key claims noted above
- [x] Entity candidates identified
- [x] Conflicts documented
- [ ] Ready to extract to CSV

---

## Annotations


