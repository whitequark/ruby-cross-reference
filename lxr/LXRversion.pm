# Define LXR public version
#
# NOTE to developers:
#
#	Remember to update this variable when releasing
#	a new version.
#
# Any version numbering scheme is accepted. Apply
# the agreed policy (if any).

package LXRversion;

use strict;

require Exporter;

use vars qw(@ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);

@EXPORT_OK = qw($LXRversion);

our $LXRversion = "0.9.9";

1;
