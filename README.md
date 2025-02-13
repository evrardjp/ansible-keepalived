Keepalived
=========

This role installs keepalived and configures it according to the variables you'll pass to the role.

Requirements
------------

No fancy requirements. Only package and file management in the role.

Starting with this role version 4.0.0, the following minimum OS versions are required:
- Ubuntu: 15.04 or above
- Debian: Jessie or above
- CentOS: 7 or above

For older OSes, please use a previous version of this role.

Role Variables
--------------

By default, this role doesn't configure keepalived, it barely installs it. This way keepalived is fully flexible based on what you give as input.
Examples are given in the vars folder. Don't try them immediately, they won't work! (You need to define VIPs, passwords, etc.). The examples are only a source of inspiration.

The main variables are:

* keepalived_instances: This is a mandatory dict. It gathers information about the vips, the prefered state (master/backup), the VRRIP IDs and priorities, the password used for authentication... This is where things like nopreempt are configured. nopreempt allows to stay in backup state (instead of preempting to configured master) on a master return of availability, after its failure. Please check the template for additional settings support, and original keepalived documentation for their configuration.
* keepalived_sync_groups: This is an optional dict. It groups items defined in keepalived_instances, and (if desired) allow the configuration of notifications scripts per group of keepalived_instances. Notification scripts are triggered on keepalived's state change and are facultative.
* keepalived_virtual_servers: This is an optional dict. It sets up a virtual server + port and balances traffic over real_servers given in a sub dict. Checkout the _example.yaml files in vars/ to see a sample on how to use this dict. The official documentation for keepalived's virtual_server can be found [here](https://github.com/acassen/keepalived/blob/master/doc/keepalived.conf.SYNOPSIS#L393).
* keepalived_scripts: This is an optional dict where you could have checking scripts that can trigger the notifications scripts.
* keepalived_bind_on_non_local: This variable (defaulted to "False") determines whether the system that host keepalived will allow its apps to bind on non-local addresses. If you set it to true, this allows apps to bind (and start) even if they don't currently have the VIP for example.

Please check the examples for more explanations on how these dicts must be configured.
You can find an example playbook in this README, and other examples in `tests/`, including
examples on the variables configuration.

Other editable variables are listed in the defaults/main.yml. Please read the explanation there if you want to override them.
An example of a notification script is also given, in the files folder.

Antoher good source of informations is the official keepalived [GIT repo](https://github.com/acassen/keepalived) where you can find a fully commented [keepalived.conf](https://github.com/acassen/keepalived/blob/master/doc/keepalived.conf.SYNOPSIS). Also various official samples are [provided](https://github.com/acassen/keepalived/tree/master/doc/samples).

Dependencies
------------

No dependency

Example Playbook
----------------

See it in tests/keepalived-install-example.yml for a simple example (the one used in CI gating).
Please also check tests/keepalived-install-complex-example.yml for a more detailed example with more features (not gated).

Contributing
------------

Please read our CONTRIBUTING.md

License
-------

Apache2

Author Information
------------------

Jean-Philippe Evrard
