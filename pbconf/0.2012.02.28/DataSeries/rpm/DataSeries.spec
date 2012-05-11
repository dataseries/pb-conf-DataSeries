#
# (c) Copyright 2012, Hewlett-Packard Development Company, LP
#
#  See the file named COPYING for license details
#
#
# SPEC file for DataSeries
#
Name:          DataSeries
Version:       PBVER
URL:           http://tesla.hpl.hp.com/opensource.html
Source:        %{name}-%{version}.tar.gz
Release:       1
Summary:       Support tools and library 
Group:         Development/Libraries
License:       BSD
Packager:      Lintel-Users <lintel-users@lists.sourceforge.net>
BuildRoot:     %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)
# standard packages
BuildRequires: gcc-c++, libstdc++-devel
BuildRequires: perl-TimeDate, perl-XML-Parser, doxygen, pcre-devel, libpcap-devel, gnuplot
# Lintel
BuildRequires: Lintel-devel, Lintel-utils
BuildRequires: PBNONSTANDARD
BuildRequires: PBCOMPRESSION
BuildRequires: PBOPENSSL
BuildRequires: PBPERL

%package	libs
Summary:        DataSeries library files
Group:          Development/Libraries
Requires:       %{name}-libs = %{version}-%{release}
License:        BSD

%package	devel
Summary:        DataSeries development files
Group:          Development/Libraries
Requires:       %{name}-libs = %{version}-%{release}
Requires:       cmake
License:        BSD

%package	utils
Summary:        DataSeries utilities
Group:          Development/Libraries
Requires:       %{name}-libs = %{version}-%{release}
License:        BSD

# TODO-package-reviewer: how do we make this package architecture independent?
%package	docs
Summary:        DataSeries development files documentation
Group:          Development/Libraries
Requires:       %{name}-libs = %{version}-%{release}
License:        BSD

%description
This is the meta-package for DataSeries, the -{libs,devel,utils,docs} sub-packages contain
the actual contents.

PBDESC_libdataseries_dev

%description	libs
PBDESC_libdataseries

%description	devel
PBDESC_libdataseries_dev

%description    utils
PBDESC_dataseries_utils

%description    docs
PBDESC_libdataseries_dev_doc

%prep
%setup -q

%build
mkdir rpm-build
cd rpm-build
cmake -D CMAKE_INSTALL_PREFIX=/usr ..
make -j 6
ctest

%install
cd rpm-build
rm -rf $RPM_BUILD_ROOT
make install DESTDIR=$RPM_BUILD_ROOT
pwd
ls ..
../dist/fix-install.sh $RPM_BUILD_ROOT
mkdir -p $RPM_BUILD_ROOT%{_docdir}/DataSeries-%{version}
cp ../Release.info ../ChangeLog ../COPYING $RPM_BUILD_ROOT%{_docdir}/DataSeries-%{version}
# TODO: can we make cmake automatically figure out that centos wants libs in /usr/lib64
if [ %{_libdir} != /usr/lib ]; then
        mkdir -p $RPM_BUILD_ROOT%{_libdir}
        mv $RPM_BUILD_ROOT/usr/lib/libDataSeries*so* $RPM_BUILD_ROOT%{_libdir}
fi
mkdir -p $RPM_BUILD_ROOT/usr/share/doc/DataSeries-devel 
cat >$RPM_BUILD_ROOT/usr/share/doc/DataSeries-devel/README <<EOF 
PBDESC_libdataseries_dev
EOF

mkdir -p $RPM_BUILD_ROOT/usr/share/doc/DataSeries-utils
cat >$RPM_BUILD_ROOT/usr/share/doc/DataSeries-utils/README <<EOF 
PBDESC_dataseries_utils
EOF

strip $RPM_BUILD_ROOT/usr/lib*/libDataSeries*.so.*.*

# may be empty
mkdir -p $RPM_BUILD_ROOT/usr/share/perl5/DataSeries

%post libs -p /sbin/ldconfig

%postun libs -p /sbin/ldconfig

%clean
rm -rf $RPM_BUILD_ROOT rpm-build

%files libs
%{_libdir}/libDataSeries.so.*
%{_docdir}/DataSeries-%{version}/COPYING
%{_docdir}/DataSeries-%{version}/Release.info

%files devel
%{_includedir}/DataSeries/*
%{_bindir}/dataseries-config
%{_libdir}/libDataSeries*.so
/usr/share/doc/DataSeries-devel/README
/usr/share/cmake*/Modules

%files utils
# skip dataseries-config
%{_bindir}/[a-ce-z]*
%{_bindir}/d[b-z]*
/usr/share/bp_modules/BatchParallel
/usr/share/man/man1/*
/usr/share/doc/DataSeries-utils/README
/usr/share/perl5/DataSeries

# rpmlint complains about the manpages being compressed with gz instead of bz2,
# but all of the centos5 manpages are compressed with gz
%files docs
/usr/share/man/man3/*
/usr/share/man/man7/*
/usr/share/doc/DataSeries
%{_docdir}/DataSeries-%{version}/ChangeLog

%changelog

* Tue Feb 28 2012 anderse@hpl.hp.com 0.2012.02.28-1
- release testing

* Mon Jun 13 2011 anderse@hpl.hp.com 0.2011.06.13-1
- Release.  See NEWS for major changes.

* Mon Mar 28 2011 anderse@hpl.hp.com 0.2011.03.28-1
- Initial rpm packaging.

