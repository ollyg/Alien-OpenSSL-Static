use strict;
use warnings;

use Test::More tests => 2;
use Text::ParseWords qw/shellwords/;

BEGIN { use_ok( 'Alien::OpenSSL::Static' ); }

diag("Libs: ".Alien::OpenSSL::Static->libs);
diag("Cflags: ".Alien::OpenSSL::Static->cflags);
diag("Install type: ".Alien::OpenSSL::Static->install_type);

my %libs = map { $_ => 1 } shellwords( Alien::OpenSSL::Static->libs );
if ($^O eq 'MSWin32') {
	ok(1, 'Library defined') if ( defined($libs{'-lssl32'}) || defined($libs{'-lcrypto'}) );
} else {
	ok(defined($libs{'-lcrypto'}), 'Libcrypto defined');
}
