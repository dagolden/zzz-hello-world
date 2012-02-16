use 5.008001;
use strict;
use warnings;

package ZZZ::Hello::World;
our $VERSION = "1.0";

use Plack::Request;

sub run_psgi {
  my $self = shift;
  my $req = Plack::Request->new(shift);
  my $res = $req->new_response(200);
  $res->content_type('text/html');
  $res->body(<<"HERE");
<html>
<head><title>Hello World</title></head>
<body>

<p>Hello World. It is @{[scalar localtime]}</p>

<p>My special word is: bizbazbuzz</p>

<p>This is Perl $].  My \@INC is:</p>

<ul>
@{[map {"<li>$_</li>\n"} @INC]}
</ul>
</body>
</html>
HERE
  return $res->finalize;
}

1;

=head1 NAME

ZZZ::Hello::World -- a demo Hello World app

=head1 DESCRIPTION

This is a demo Hello World web app.  Nothing to see here.  These
are not the droids you're looking for.  Move along.

=cut

# vim: ts=2 sts=2 sw=2 et:
