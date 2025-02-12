%global _vpath_srcdir %{name}-%{version}/executable

Name:           myexec
Version:        0.1.0
Release:        1%{?dist}
Summary:        Example application

License:        MIT
URL:            https://github.com/raballew/autosd
Source:         %{name}-%{version}.tar.gz

BuildRequires:  meson
BuildRequires:  gcc

%package devel
Summary:        Libraries and header files for %{name}
Requires:       %{name}%{?_isa} = %{?epoch:%{epoch}:}%{version}-%{release}

%description
%{summary}.

%description devel
%{summary}.

%prep
%autosetup -c

%build
%meson
%meson_build

%install
%meson_install

%check
%meson_test

%files
%{_bindir}/myexec
%{_libdir}/libmylib.so

%files devel
%{_libdir}/lib*.so
%{_includedir}/**/*.h
%{_libdir}/pkgconfig/*.pc
