Name: roman-numerals
Version: 1.3
Release: 1
Summary: RomanNumerals
License: -
Group: Ryan Harper
autoprov: yes
autoreq: yes
BuildRoot: /vagrant/java/roman-numerals-1.3/target/rpm/roman-numerals/buildroot

%description

%install
if [ -e $RPM_BUILD_ROOT ];
then
  mv /vagrant/java/roman-numerals-1.3/target/rpm/roman-numerals/tmp-buildroot/* $RPM_BUILD_ROOT
else
  mv /vagrant/java/roman-numerals-1.3/target/rpm/roman-numerals/tmp-buildroot $RPM_BUILD_ROOT
fi

%files

 "/opt/roman-numerals"
%attr(550,tester,tester) "/usr/local/bin"
