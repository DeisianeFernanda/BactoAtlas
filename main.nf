#!/usr/bin/env nextflow

nextflow.enable.dsl=2

// =====================
// Parameters
// =====================
params.help      = false
params.genomes   = null
params.outdir    = "results"
params.profile   = "general"

// =====================
// Help message
// =====================
def showHelp() {
    log.info """
    =====================================
              BactoAtlas v0.1
    Genomic mining for bacterial potential
    =====================================

    USAGE:
      nextflow run main.nf --genomes <path> [options]

    REQUIRED:
      --genomes        Path to genome files (FASTA)

    OPTIONAL:
      --profile        Analysis profile (general, plant, animal)
                       [default: general]

      --outdir         Output directory
                       [default: results]

      --help           Show this help message

    EXAMPLE:
      nextflow run main.nf \\
        --genomes data/genomes/*.fna \\
        --profile plant \\
        --outdir results

    =====================================
    """
}

// =====================
// Help logic
// =====================
if (params.help) {
    showHelp()
    exit 0
}

// =====================
// Input validation
// =====================
if (!params.genomes) {
    log.error "ERROR: --genomes parameter is required."
    log.error "Use --help to see usage instructions."
    exit 1
}

// =====================
// Workflow
// =====================
workflow {

    log.info "Starting BactoAtlas"
    log.info "Profile: ${params.profile}"
    log.info "Genomes: ${params.genomes}"
    log.info "Output directory: ${params.outdir}"

    // Placeholder for future processes
    log.info "Pipeline structure initialized successfully 🚀"
}
