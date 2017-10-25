

### Additional Licenses

Singularity
Hashids


## Verbs

contained pull protocol://registry/org/name:tag
contained list <org/name:tag>
contained rmi <org/name:tag>
contained exec protocol://registry/org/name:tag

## Configs are

name: docker-prod
  - runtime: "docker"
  - version: "17.09"
  - host: "Linux"
  - exec:
    - command: "run"
    - opts:
        - "--rm"
        - "--network=none"
        - "--cpus=1.0000"
        - "--memory=1G" 
        - "--device-read-iops=/dev/sda:1500"
        - "--device-read-iops=/dev/sda:1500"
        - "--user=0:$GID"
        - "-v $PWD:/home:rw" 
        - "-w /home"
  - before:
  - after:

name: docker-local
  - runtime: "docker"
  - version: "17.09"
  - host: "Darwin"
  - exec:
    - command: "run"
    - opts:
        - "--rm"
        - "-v $PWD:/home:rw" 
        - "-w /home"
  - before:
  - after:
