Description
===========

Bare bones cookbook for deploying hello-world demo app.

Requirements
============

* The 'carton' cookbook (c.f. http://github.com/dagolden/perl-chef)

Attributes
==========

    # perlbrew to execute with (should be a legal perlbrew target)
    default['hello-world']['perl_version'] = 'perl-5.16.0'

    # Install directory, repo and tag
    default['hello-world']['deploy_dir'] = '/opt/hello-world'
    default['hello-world']['deploy_repo'] = 'https://github.com/dagolden/zzz-hello-world.git'
    default['hello-world']['deploy_tag'] = 'master'

    # Service user/group/port
    default['hello-world']['user'] = "nobody"
    default['hello-world']['group'] = "nogroup"
    default['hello-world']['port'] = 8080

Usage
=====

Include the "hello-world" recipe in your node run-list.

