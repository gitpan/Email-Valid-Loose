use strict;
use Test::More;

use Email::Valid::Loose;

my @valid = (
    'miyagawa@cpan.org',
    'rfc822.@docomo.ne.jp',
    '-aaaa@foobar.ezweb.ne.jp',
);

my @invalid = (
    'doobar',
    'doo[@eeee.com',
    '',
    'foobar@doo.com ',
);

plan tests => (@valid + @invalid) * 2;

for (@valid) {
    ok( Email::Valid::Loose->address($_), $_ );
    ok( Email::Valid::Loose->address(-address => $_), $_);
}

for (@invalid) {
    ok( !Email::Valid::Loose->address($_), $_ );
    ok( !Email::Valid::Loose->address(-address => $_), $_ );
}

