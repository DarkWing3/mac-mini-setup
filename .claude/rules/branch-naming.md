# Branch naming

Branches follow `NN.name`:

- `NN` — two-digit sequence number starting at `00`, incrementing from the highest existing branch number.
- `name` — under 20 characters, describing the change.

Examples: `00.setup-pages`, `01.fix-links`.

## PR titles

A PR's title must start with the `NN` from its branch name, e.g. a PR from `02.local-preview` is titled `02: Local Jekyll preview setup`.
