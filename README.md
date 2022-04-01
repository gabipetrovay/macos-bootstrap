# MacOS Device Bootstrap Script for Geeks

This installs and configures common tools needed by a geek in his/her daily life.

## Structure

The entry point is `run.sh`.

### Homebrew installations

Call the following function to install a Homebrew package:

```bash
brew_install <formula> <install_guard_path> <name>
```

where:

- `formula` is a Homebrew cask/formula name
- `install_guard_path` is the path to check if this package needs to be installed
- `name` is the human readable package name

After installation the following script is being executed, if present:

```bash
./<formula>/setup.sh
```

### Other configurations

Call the following function to run other custom scripts:

```bash
configure <target>
```

This will call the following script, if present:

```bash
./<target>/setup.sh
```

### Secrets

The `secrets.sh` files are ignored in this repo. You can use these files to `export` environment variables and to call
them from the other `setup.sh` script files. For example, the `git/secrets.sh` might contain:

```bash
export GIT_USER_NAME="Your Name"
export GIT_USER_EMAIL=your.email@example.com
```

**NOTE**: The secrets.sh files don't need:

- to be executable, as they are called using `source`
- the bash shebang, as they will be invoked in the context of the main script (i.e. Bash)

## Contribute

Feel free to make it more generic or pluggable. Otherwise fork it and have fun.
