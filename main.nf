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

    workflow {

    // Create output and log directories
    def logDir = new File("${params.outdir}/logs")
    logDir.mkdirs()

    def logFile = new File(logDir, "bactoatlas.log")

    // Write initial log information
    logFile << "=====================================\n"
    logFile << "BactoAtlas run started\n"
    logFile << "Date: ${new Date()}\n"
    logFile << "Profile: ${params.profile}\n"
    logFile << "Genomes: ${params.genomes}\n"
    logFile << "Output directory: ${params.outdir}\n"
    logFile << "=====================================\n\n"

    log.info "BactoAtlas started"
    log.info "Log file: ${logFile}"
    
    // (future processes go here)
}

}
