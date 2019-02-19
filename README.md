# irods-docker

This repository contains the files for building a Docker or Singularity image of the iRODS client commands, as well the files to create an Environment Module (or Lmod module) for the client commands, for use on an HPC system.

- Singularity documentation: https://www.sylabs.io/guides/2.5/user-guide/index.html
- iRODS documentation: https://docs.irods.org/4.2.4/
- Environment Modules: http://modules.sourceforge.net/
- Lmod: https://lmod.readthedocs.io/en/latest/

## Dependencies

You must have Singularity installed on a local machine and your HPC system. It is recommended that you use Singularity 2.4 or newer.

## Usage

To build the Singularity image:
```
sudo singularity build irods.simg Singularity
```

To run an icommand:
```
singularity exec irods.simg <command>
```

Note that you need admin privileges to build the Singularity image, so you will most likely have to build the image on a local machine and then transfer the image to your HPC system.

Once you've built the image, you can use the icommands "out-of-the-box" by creating aliases for each icommand, for example:
```
alias iinit="singularity exec irods.simg iinit"
```

The scripts `install-irods-lmod.sh` and `install-irods-tmod.sh` respectively create an Lmod module or Environment Module which provides these aliases automatically. You may need to edit these scripts to work for your particular environment.
