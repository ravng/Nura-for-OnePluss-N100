# Local checkpoint artifacts

The Git repository contains the N100 device packages, source changes, hardware status, rebuild handoffs, and archive manifests. Large flash images and generated diagnostic kernel binaries remain in the local `archive/` directory and are intentionally excluded from Git because GitHub rejects individual files larger than 100 MiB.

Excluded paths:

- `archive/**/images/`
- `archive/**/wifi-artifacts/bin/`
- generated `.o` and `.ko` files below archived source trees
- nested source-repository `.git/` directories

The local checkpoint remains authoritative for flashing. Its `SHA256SUMS` files retain the expected artifact hashes. Do not assume a Git clone alone contains flashable images.

## Milestone workflow

At each verified hardware or software milestone:

1. Update `HARDWARE-STATUS.txt`, the relevant handoff document, and device package sources.
2. Record only behavior exercised on the physical N100.
3. Refresh the local checkpoint archive and checksums when flashable state changes.
4. Commit the source and documentation with the subsystem and proven result in the commit message.
5. Push the milestone commit to GitHub.

Large flashable checkpoints should be published separately as release assets or external storage artifacts when required; never commit them directly to Git history.
