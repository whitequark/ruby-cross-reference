# Ruby Cross Reference

This repository contains the source for the Ruby Cross Reference website,
initially known as [rxr.whitequark.org](https://rxr.whitequark.org/).
I am publishing the sources primarily because I am unwilling to maintain
it any longer.

## Structure

RXR uses a slightly customized LXR installation, and LXR manual generally
applies. However, it includes a bespoke theme, as well as several improvements
for syntax highlighting, symbol extraction and URL routing over upstream LXR,
and probably other things I forget right now.
Unfortunately these were not recorded in any form of version control, so your
best bet is probably to use the current source tree as it is.

To set up an instance in the same way that I did, you will need:

  * Install Perl modules DBI::MySQL and File::MMagic;
  * Install Glimpse full-text search and ctags indexing engine;
  * Create three databases, per Ruby implementation, and set their passwords
    in the LXR configuration, see `lxr/lxr.conf` for all necessary details;
  * Populate them with `lxr/schema.sql`;
  * Add all the Ruby versions (see below for the full list);
  * Run `./update.sh` (this will take a hour or two);
  * Configure Nginx to serve requests to LXR (see `nginx/rxr_whitequark_org`
    and `nginx/fcgi_params`; I vaguely remember adjusting `fcgi_params`
    but the one in upstream nginx will probably also work fine).
  * Configure `./update.sh` in a daily cronjob.

All the configuration files assume that the root is `/var/www/rxr.whitequark.org/`
but this should be easy enough to change.

These are the Ruby versions I serve:

```
./mri/HEAD
./mri/1.9.3-p547
./mri/1.9.1-p431
./mri/2.1.1
./mri/1.9.2-p381
./mri/1.8.7-p374
./mri/2.1.0-p0
./mri/2.1.2
./mri/2.0.0-p481
./jruby/1.6.7.2
./jruby/HEAD
./rubinius/HEAD
```

I've first did a full clone named `HEAD` and then `git clone --reference ../HEAD`
for all the sub-checkouts for individual versions to save space as well as time.

## Things to fix

RXR mostly already does things right but there are two notable issues:

  * Glimpse is non-FOSS and also just a bad search engine. Configuring SWISH-E
    should be easy enough.
  * https://rxr.whitequark.org/mri/ redirects to /HEAD, and people then make links
    to files there, and time passes, and HEAD changes, and those links break.
    Instead it should redirect to the latest non-HEAD version.

## License

I release all my changes under GPLv2 (which is the same as LXR).