package CPAN::MetaPackager::Import;

use 5.36.0;
use boolean;
use parent 'CPAN::MetaPackager::Database';
use warnings qw(FATAL utf8); # Fatalize encoding glitches.

use Data::Dumper::Concise; # For Dumper().
use DateTime::Tiny;

use File::Spec;
use File::Slurper 'read_lines';

use Moo;

use Types::Standard qw/Str/;

has packages_path =>
(
	default		=> sub{return 'data/02packages.details.txt'},
	is			=> 'rw',
	isa			=> Str,
	required	=> 0,
);

our $VERSION = '1.00';

# -----------------------------------------------

sub populate_all_tables
{
	my($self) = @_;

	$self -> init_config;
	$self -> init_db;
	$self -> logger -> info('Populating all tables');

	$self -> populate_packages_table;

	$self -> logger -> info('Populated all tables');
	$self -> logger -> info('-' x 50);

	# Return 0 for OK and 1 for error.

	return 0;

}	# End of populate_all_tables.

# -----------------------------------------------

sub populate_packages_table
{
	my($self)		= @_;
	my($path)		= File::Spec -> catfile($self -> home_path, $self -> packages_path);
	my($table_name)	= 'packages';

	$self -> get_table_column_names(true, $table_name); # Populates $self -> column_names.

	my($packages)	= $self -> read_packages_file;
	my($count)		= 0;

	my($distro);
	my(@fields);
	my($package);
	my($version);

	for my $line (@$packages)
	{
		$count++;

		next if ($count <= 9);

		($package, $version, $distro) = split(/\s+/, $line);

		say "<$package> <$version> <$distro>";

	}

	my($pad)			= $self -> pad; # For temporary use, during import.
	$$pad{$table_name}	= $self -> read_table($table_name);
	my($packages_count)	= $#{$$pad{$table_name} } + 1;

	$self -> logger -> info("Finished populate_packages_table(). Stored $packages_count records into '$table_name'");

}	# End of populate_constants_table.

# --------------------------------------------------

sub read_packages_file
{
	my($self) = @_;

	$self -> init_config;
	$self -> init_db;

	my($file_name)	= File::Spec -> catfile($self -> home_path, $self -> packages_path);
	my(@packages)	= read_lines($file_name, 'UTF-8');

	$self -> logger -> info("$file_name: record count: @{[$#packages + 1]}");

	return \@packages;

} # End of read_packagespackages_file.

# --------------------------------------------------

1;

=pod

=head1 Machine-Readable Change Log

The file Changes was converted into Changelog.ini by L<Module::Metadata::Changes>.

=head1 Version Numbers

Version numbers < 1.00 represent development versions. From 1.00 up, they are production versions.

=head1 Support

Email the author.

=head1 Author

L<CPAN::MetaPackager> was written by Ron Savage I<E<lt>ron@savage.net.auE<gt>> in 2025.

My homepage: L<https://savage.net.au/>.

=head1 Copyright

Australian copyright (c) 2025, Ron Savage.

	All Programs of mine are 'OSI Certified Open Source Software';
	you can redistribute them and/or modify them under the terms of
	The Perl License, a copy of which is available at:
	http://dev.perl.org/licenses/

=cut
