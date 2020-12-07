## To use

- `yarn`
- `yarn build`
- `yarn watch` (requires watchexec)
- open `index.html` (no server required)

# My ideal ReScript monorepo

The goal is to run a single `bsb` from the project root and have everything Just Work (tm).

This repository leverages ReScript pinned packages support. The setup:

- yarn workspace-based monorepo (this ensures there are no secondary `node_modules` folders in the packages which might confuse `bsb`)
- packages are listed under `bs-dependencies` and `pinned-dependencies`, which works because the yarn workspace creates symlinks to each source package in `node_modules`
- `yarn build` compiles and bundles

Everything _looks_ sweet at this point, in particular within packages `namespace` works just fine, but there is a critical flaw which prevent this from being viable; modifications, no matter how small, can trigger a forest of rebuilds. For example:

- Changing `ExampleStyles.re` in `b` causes package `c` to rebuild even though `c` does not use it.
- Changing `ATest.re` - which is a development source file and therefore cannot have any impact on the exported code - triggers a complete rebuild of packages `b` and `c`.

In my ideal scenario `bsb` would track dependencies at a more granular level, to rebuild just the changed tree, as it does when the same structure is modelled flat with a single `bsconfig.json`.

### Source
Heavily modified from the ReasonReact Template.