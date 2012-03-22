# Project Builder configuration file for DataSeries

pburl DataSeries = file:///home/anderse/projects/DataSeries-0.2012.02.28.tar.gz

# Repository
pbrepo DataSeries = http://tesla.hpl.hp.com/opensource
#pbml DataSeries = DataSeries-announce@lists.DataSeries.org
#pbsmtp DataSeries = localhost

# Check whether project is well formed 
# when downloading from ftp/http/...
# (containing already a directory with the project-version name)
pbwf DataSeries = 1

#
# Packager label
#
pbpackager DataSeries = Eric Anderson <eric.anderson4@hp.com>
#

# For delivery to a machine by SSH (potentially the FTP server)
# Needs hostname, account and directory
#
#sshhost DataSeries = www.DataSeries.org
#sshlogin DataSeries = bill
#sshdir DataSeries = /DataSeries/ftp
#sshport DataSeries = 22

#
# For Virtual machines management
# Naming convention to follow: distribution name (as per ProjectBuilder::Distribution)
# followed by '-' and by release number
# followed by '-' and by architecture
# a .vmtype extension will be added to the resulting string
# a QEMU rhel-3-i286 here means that the VM will be named rhel-3-i386.qemu
#
#vmlist DataSeries = mandrake-10.1-i386,mandrake-10.2-i386,mandriva-2006.0-i386,mandriva-2007.0-i386,mandriva-2007.1-i386,mandriva-2008.0-i386,redhat-7.3-i386,redhat-9-i386,fedora-4-i386,fedora-5-i386,fedora-6-i386,fedora-7-i386,fedora-8-i386,rhel-3-i386,rhel-4-i386,rhel-5-i386,suse-10.0-i386,suse-10.1-i386,suse-10.2-i386,suse-10.3-i386,sles-9-i386,sles-10-i386,gentoo-nover-i386,debian-3.1-i386,debian-4.0-i386,ubuntu-6.06-i386,ubuntu-7.04-i386,ubuntu-7.10-i386,mandriva-2007.0-x86_64,mandriva-2007.1-x86_64,mandriva-2008.0-x86_64,fedora-6-x86_64,fedora-7-x86_64,fedora-8-x86_64,rhel-4-x86_64,rhel-5-x86_64,suse-10.2-x86_64,suse-10.3-x86_64,sles-10-x86_64,gentoo-nover-x86_64,debian-4.0-x86_64,ubuntu-7.04-x86_64,ubuntu-7.10-x86_64,solaris-10-x86_64

#
# Valid values for vmtype are
# qemu, (vmware, xen, ... TBD)
#vmtype DataSeries = qemu

# Hash for VM stuff on vmtype
#vmntp default = pool.ntp.org

# We suppose we can commmunicate with the VM through SSH
#vmhost DataSeries = localhost
#vmlogin DataSeries = pb
#vmport DataSeries = 2222

# Timeout to wait when VM is launched/stopped
#vmtmout default = 120

# per VMs needed paramaters
#vmopt DataSeries = -m 384 -daemonize
#vmpath DataSeries = /home/qemu
#vmsize DataSeries = 5G

# 
# For Virtual environment management
# Naming convention to follow: distribution name (as per ProjectBuilder::Distribution)
# followed by '-' and by release number
# followed by '-' and by architecture
# a .vetype extension will be added to the resulting string
# a chroot rhel-3-i286 here means that the VE will be named rhel-3-i386.chroot
#
#velist DataSeries = fedora-7-i386

# VE params
#vetype DataSeries = chroot
#ventp default = pool.ntp.org
#velogin DataSeries = pb
#vepath DataSeries = /var/cache/rpmbootstrap
#rbsconf DataSeries = /etc/mock
#verebuild DataSeries = false

#
# Global version/tag for the project
#
projver DataSeries = 0.2012.02.28
projtag DataSeries = 1

# Hash of valid version names

# Additional repository to add at build time
addrepo deb = http://localhost/pb-pkgs/$pbos->{'name'}/$pbos->{'version'}/Lintel.sources.list
# addrepo centos-5-x86_64 = http://packages.sw.be/rpmforge-release/rpmforge-release-0.3.6-1.el5.rf.x86_64.rpm,ftp://ftp.project-builder.org/centos/5/pb.repo
# addrepo centos-5-x86_64 = http://packages.sw.be/rpmforge-release/rpmforge-release-0.3.6-1.el5.rf.x86_64.rpm,ftp://ftp.project-builder.org/centos/5/pb.repo
#version DataSeries = devel,stable

# Is it a test version or a production version
testver DataSeries = false
# Which upper target dir for delivery
delivery DataSeries = production

# Additional repository to add at build time
# addrepo centos-5-x86_64 = http://packages.sw.be/rpmforge-release/rpmforge-release-0.3.6-1.el5.rf.x86_64.rpm,ftp://ftp.project-builder.org/centos/5/pb.repo
# addrepo centos-4-x86_64 = http://packages.sw.be/rpmforge-release/rpmforge-release-0.3.6-1.el4.rf.x86_64.rpm,ftp://ftp.project-builder.org/centos/4/pb.repo

# Adapt to your needs:
# Optional if you need to overwrite the global values above
#
#pkgver DataSeries = stable
#pkgtag DataSeries = 3
# Hash of default package/package directory
defpkgdir DataSeries = DataSeries-0.2012.02.28
# Hash of additional package/package directory
#extpkgdir minor-pkg = dir-minor-pkg

# List of files per pkg on which to apply filters
# Files are mentioned relatively to pbroot/defpkgdir
#filteredfiles DataSeries = Makefile.PL,configure.in,install.sh,DataSeries.8
#supfiles DataSeries = DataSeries.init

# For perl modules, names are different depending on distro
# Here perl-xxx for RPMs, libxxx-perl for debs, ...
# So the package name is indeed virtual
#namingtype DataSeries = perl

sshhost DataSeries = localhost
sshdir DataSeries = /home/anderse/cache-project-builder/repos
