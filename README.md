# esxi-cloud-init

Installation
============

Get vagrant, packer, and virtualbox.

As of the time of this writing, you have to [hack vagrant](https://blogs.oracle.com/scoter/getting-vagrant-226-working-with-virtualbox-61-ga) to use virtualbox 6.1.

To make the vib:
```
cd infra/cent7
make vib
```
you'll see the vib output in the newly created top level dist directory.
