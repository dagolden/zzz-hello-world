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
Hello World (@{[scalar localtime]})

This is Perl $].  My \@INC is:
@{[join "\n", @INC]}
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
