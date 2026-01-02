process PROKKA {

    tag "${genome.baseName}"

    conda 'bioconda::prokka=1.14.6'

    input:
    path genome

    output:
    path "${genome.baseName}_prokka", emit: prokka_out

    script:
    """
    prokka \
      --outdir ${genome.baseName}_prokka \
      --prefix ${genome.baseName} \
      $genome
    """
}
