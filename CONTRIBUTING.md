# How to contribute to this

We welcome all contributions.

Main areas we need:
- Expose the newest features of keepalived into the template, by editing them in the template.
  Please make sure your changes do NOT impact other user's templates!
  we do not want keepalived to restart for no reason.

- Declare yourself as maintainer of a sub-part of the template.
  We are welcoming ppl using keepalived to be part of something they do care about!
  If you feel a part of the template is important for you, please mention it in the PR. We would like you to become maintainer and be pinged should the template change. 

- Improve our CI.
  Make sure our CI is always working by checking the last builds, and fix them in case an issue arise.

# Test requirements

- Tox
- Vagrant
- Virtualbox

We are back to vagrant and virtualbox after a while dealing with molecule docker,
but having many flaky builds and issues.
The interface is not stable, and I want something with very little maintainance.

# Add test coverage

Test coverage is not a goal in itself, basic testing is fine.

However, we welcome the testing of new distributions (especially if you remove an old one at the same time).

To do it, you need to do the following:
- Edit the meta/main.yml to add the distro
- Edit the molecule/basic/molecule.yml to add the vagrant box in need of testing.

For other test coverage, like features, please make sure to add a new tox target,
which calls for a different molecule scenario.

# How to run a lint test

Run `tox -e lint`.

# How to run a functional test

Run `tox -e functional`.
Should the build fail, run `tox -e functional -- --destroy==never` to keep your vagrant box running.

# Contributions that will be refused

- Moving back to molecule[docker]
- Moving back to vagrant and playbooks for testing without molecule
- Moving to vagrant with another driver than the default

# Contributions that will be accepted

Changes which passes testing especially if they have an optional test included proving their behaviour, tested in github actions.
