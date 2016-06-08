package Acme::MetaSyntactic::WordList;

# DATE
# VERSION

use 5.010001;
use strict 'subs', 'vars';
use warnings;

use parent qw(Acme::MetaSyntactic::List);

sub new {
    my $class = shift;
    bless [], $class;
}

sub init {
    my ($self, $wl_module) = @_;
    (my $wl_module_pm = "$wl_module.pm") =~ s!::!/!g;
    require $wl_module_pm;
    my $data = {
        names => join(" ", $wl_module->new->all_words),
    };
    $self->SUPER::init($data);
}

1;
# ABSTRACT: Get meta names from WordList::*

=head1 SYNOPSIS

In your F<lib/Acme/MetaSyntactic/yourtheme.pm>:

 use parent 'Acme::MetaSyntactic::WordList';
 __PACKAGE__->init

=head1 DESCRIPTION

This is a base class for C<Acme::MetaSyntactic::*> theme that wants to get the
names from corresponding C<WordList::*> module.
