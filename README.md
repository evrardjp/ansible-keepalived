Keepalived
=========

This role installs keepalived and configures it according to the variables you'll pass to the role.

Requirements
------------

No fancy requirements. Only package and file management in the role.

Role Variables
--------------

By default, this role doesn't configure keepalived, it barely installs it. This way keepalived is fully flexible based on what you give as input.
Examples are given in the vars folder. Don't try them immediately, they won't work! (You need to define VIPs, passwords, etc.). The examples are only a source of inspiration.

The main variables are:

* keepalived_use_latest_stable: This is by default set to false. When set to true, the role will always install latest version of keepalived, making it restart when a new version appears in the ppa.
* keepalived_instances: This is a mandatory dict. It gathers information about the vips, the prefered state (master/backup), the VRRIP IDs and priorities, the password used for authentication... This is where things like nopreempt are configured. nopreempt allows to stay in backup state (instead of preempting to configured master) on a master return of availability, after its failure. Please check the template for additional settings support, and original keepalived documentation for their configuration.
* keepalived_sync_groups: This is a mandatory dict. It groups items defined in keepalived_instances, and (if desired) allow the configuration of notifications scripts per group of keepalived_instances. Notification scripts are triggered on keepalived's state change and are facultative.
* keepalived_scripts: This is an optional dict where you could have checking scripts that can trigger the notifications scripts.
* keepalived_bind_on_non_local: This variable (defaulted to "False") determines whether the system that host keepalived will allow its apps to bind on non-local addresses. If you set it to true, this allows apps to bind (and start) even if they don't currently have the VIP for example.
* keepalived_use_latest_stable_ppa: (Default: True) When this setting is set to False, the role will use the package provided with the distribution instead of using the ppa.
* keepalived_repo: The url to the repo for installing keepalived.
* keepalived_repo_keyid: The keyid for the repo for installing keepalived.
* keepalived_repo_keyurl: The key url of the repo.
* cache_timeout: This is the expiration time of the apt cache. When expired, apt will automatically update its cache. This variable will be removed when the ansible bug upstream will be fixed.

Please check the examples for more explanations on how these dicts must be configured.

An example of a notification script is also given, in the files folder.

Dependencies
------------

No dependency

Example Playbook
----------------

Here is how you could use the role

    - hosts: keepalived_servers[0]
      vars_files:
        - roles/keepalived/vars/keepalived_haproxy_master_example.yml
      pre_tasks:
        - apt:
            update_cache: yes
      roles:
         - keepalived
    - hosts: keepalived_hosts:!keepalived_hosts[0]
      vars_files:
        - roles/keepalived/vars/keepalived_haproxy_backup_example.yml
      pre_tasks:
        - apt:
            update_cache: yes
      roles:
         - keepalived

License
-------

Apache2

Author Information
------------------

Jean-Philippe Evrard
