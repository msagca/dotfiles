# Git workflow

- Work on `main` and push directly to `main`. Do not create feature branches or pull requests for this repository.
- The repository is public. Keep usernames, work emails and machine-specific paths out of every file; use `~`, `$HOME` or environment variables. Commit as `msagca <51697294+msagca@users.noreply.github.com>`.

# Setup scripts

- `setup.ps1` sets up Windows and `setup.sh` sets up Linux and macOS. Put Windows-specific steps only in `setup.ps1`.
- `setup.ps1` must run under Windows PowerShell 5.1: no `?:`, `??` or `&&`. Link folders with junctions, since creating symlinks needs admin rights.
- When a whole config folder is linked into the repository, add `.gitignore` rules for its history and generated files.
