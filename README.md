# Contained

A convenience utility to support laptop-to-cloud-to-HPC native development. Wraps Singularity in Docker-like run semantics. Helps configure Docker for emphemeral use as a code execution environment. This script or its successors will ultimately be bundled with TACC's Singularity installation. 

```
usage: contained - Contain the chaos of multiple container runtimes

 contained run [opts] repo:tag [command] [params]
  - Run commands inside a local container image
 contained pull [-f] repo:tag
  - Pull a container image from a public registry
 contained images (repo:tag)
  - List local container images
    Optional: lexically matching repo:tag
 contained rm [opts] image
  - Remove a container image from the local cache
 contained build [opts] -t tag:label -f Dockerfile .
  - Build a container image from a Dockerfile and assets
    Note: Dispatches to TACC Cloud when local build support
    is not available. Stores result in your local cache.
 contained config
   - Read about runtime configuration options

Help: support@sd2e.org | Issues: github.com/SD2E/contain_yourself/issues
```
