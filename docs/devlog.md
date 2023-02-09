# Logs related to development/setup/etc

## 2023-02-09

- Created the Github Project for Wing Wizard
- Created basic outline for the planning
- Create Repository
- Setup folder structure for the project
- Configure SSH keys for both w11 & Ubuntu for Github
- Configure git on windows to use LF instead of CRLF as EOL
- Created file for Devlog
- Installed TablePlus as SQL client
- Setting up Docker containers for Node & Postgres
  - Node is setup using Dockerfile
  - Postgres
    - default User=postgres, DB=postgres, port=5432
    - default data location is `/var/lib/postgres/data`
- issue with `docker compose build`
  - [GitHub Issue](https://github.com/docker/compose/issues/9956)
  - solved by deleting everything inside `~/.docker/contexts/meta` & restarting docker
- trying to keep a container running indefinitely
  1. created a dummy http server without dependencies, then ran that
  2. run a never-ending command `tail -f /dev/null`
- connecting postgres container to sql client (tableplus)
  - connection failed initially
    - no incoming connection was allowed for the postgres running in the container
  - modified the connection settings in `pg_hba.conf` file, to allow all incoming connections
  - created a local copy of the conf file in `pg_ha.local.conf` and mounted as a volume to `/var/lib/postgres/data/pg_hba.conf`
- creating a start script `entrypoint.sh`
  - if package.json, node_modules, and lock files all exist, then run commands
  - else, run a never-ending command
- tableplus is a trial version, so finding other solutions
  - for now, found another electron app - `sqelectron`
  - will change later, when other alternatives come up
- with this, setup is complete
  - clean all files, except the configuration files, 
  - Add files to git
  - start fresh from next time
