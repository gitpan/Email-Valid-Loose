use strict;use Test::More tests => 4;

use Email::Valid::Loose;

my @valid = (
    'miyagawa@cpan.org',
    'rfc822.@docomo.ne.jp',
);

my @invalid = (
    'doobar',
    'doo[@eeee.com',
);

for (@valid) {
    ok( Email::Valid::Loose->address($_) );
}

for (@invalid) {
    ok( !Email::Valid::Loose->address($_) );
}

