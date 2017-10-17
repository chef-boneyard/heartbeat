heartbeat Cookbook CHANGELOG
============================
This file is used to list changes made in each version of the heartbeat cookbook.

## 2.0.1 (2017-10-17)

- Stop using deprecated chef::Mixin:recipeDefinitionDSLCore

## 2.0.0 (2016-09-16)

- Testing updates
- Speed up intstalls with multipackage
- Require Chef 12.1+

## 1.1.1 (2016-08-11)

- Testing updates
- Properly fail on RHEL 7 / Fedora
- Update README.md to clarify that RHEL 7 removed the hearbeat package

## v1.1.0

* Added support for RHEL platforms by requiring yum-epel cookbook

## v1.0.1

* Added .foodcritic file to skip certain rules
* Updated .gitignore file
* Added Test Kitchen config
* Added Chef standard Rubocop config
* Added testing in Travis CI
* Added a Berksfile
* Updated contributing and testing docs
* Added maintainers.md and maintainers.toml files
* Added Travis and cookbook version badges to the readme
* Expanded the requirements section in the readme and clarify the minimum supported Chef release is 11
* Updated Opscode -> Chef Software
* Added a Rakefile for simplified testing
* Added a Chefignore file
* Resolved Rubocop warnings
* Added long_description to the metadata
* Added source_url and issues_url to the metadata
* Added basic Chefspec convergence test

## v1.0.0:
* [COOK-1692] - Make heartbeat available for Centos/Redhat
* [COOK-1699] - add LWRP for heartbeat configuration

## v0.7.1:
* Current public release.
