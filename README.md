
# Install OCP Agnostic from RHEL

TODO

Standards:
* RHEL golden image containing:
  * core user
  * Disks/partitions:
    * vda - root disk with at least 4GB free space
* vdc - additional disk where RHCOS will be deployed
* Apache webserver running on bastion