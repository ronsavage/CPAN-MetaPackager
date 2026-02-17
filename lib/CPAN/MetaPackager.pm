package CPAN::MetaPackager;

use 5.36.0;

our $VERSION = '1.00';

#-------------------------------------------------

1;

=pod

=head1 How to convert a Perl.Wiki.html into a jsTree

Note: My web host and I use case-sensitive file systems.

Steps (2026-02-17):
	a. cd ~/Downloads/
	b. wget https://www.cpan.org/modules/02packages.details.txt.gz
	b. gunzip 02packages.details.txt.gz (Contains about 270,458 records + 10 header lines)
	d. build.module.sh CPAN::MetaPackager 1.00
	e. scripts/build.db.sh

=head1 Machine-Readable Change Log

The file Changes was converted into Changelog.ini by L<Module::Metadata::Changes>.

=head1 Version Numbers

Version numbers < 1.00 represent development versions. From 1.00 up, they are production versions.

=head1 Repository

L<https://github.com/ronsavage/CPAN-MetaPackager>

=head1 Support

Email the author, or log a bug on RT:

L<https://rt.cpan.org/Public/Dist/Display.html?Name=CPAN-MetaPackager>.

=head1 Author

Current maintainer: Ron Savage I<E<lt>ron@savage.net.auE<gt>>.

My homepage: L<https://savage.net.au/>.

=head1 License

Perl 5.

=head1 Copyright

Australian copyright (c) 2026, Ron Savage.

	All Programs of mine are 'OSI Certified Open Source Software';
	you can redistribute them and/or modify them under the terms of
	The Perl License, a copy of which is available at:
	http://dev.perl.org/licenses/

=cut
