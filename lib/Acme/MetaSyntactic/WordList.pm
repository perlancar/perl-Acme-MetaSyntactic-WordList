package Acme::MetaSyntactic::WordList;

# DATE
# VERSION

use 5.010001;
use strict 'subs', 'vars';
use warnings;

use parent 'Acme::MetaSyntactic::List';

sub init_data {
    my ($self, $wl_module) = @_;
    (my $wl_module_pm = "$wl_module.pm") =~ s!::!/!g;
    require $wl_module_pm;
    my $class = caller(0);
    my $data = {
        # this is silly, really. converting data unnecessarily
        names => join(" ", $wl_module->new->all_words),
    };
    # sigh, can't do this because AM:List uses caller(0)
    #$self->SUPER::init($data);
    return $data;
}

1;
# ABSTRACT: Get meta names from WordList::*

=for Pod::Coverage ^(.+)$

=head1 DESCRIPTION

This is a base class for C<Acme::MetaSyntactic::*> module that wants to get
their meta names for a wordlist in corresponding C<WordList::*> module. An
example of such module is L<Acme::MetaSyntactic::countries>.
