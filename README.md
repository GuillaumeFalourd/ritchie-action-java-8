# ritchie-action-hava-8

This Github action works for [Ritchie CLI](https://ritchiecli.io/) formulas implemented in **Java**.

[![Action workflow (PUBLIC)](https://github.com/GuillaumeFalourd/ritchie-action-java-8/actions/workflows/public-repo-demo-workflow.yml/badge.svg)](https://github.com/GuillaumeFalourd/ritchie-action-java-8/actions/workflows/public-repo-demo-workflow.yml)

[![Action workflow (PRIVATE)](https://github.com/GuillaumeFalourd/ritchie-action-java-8/actions/workflows/private-repo-demo-workflow.yml/badge.svg)](https://github.com/GuillaumeFalourd/ritchie-action-java-8/actions/workflows/private-repo-demo-workflow.yml)

## Use cases

### Executing a formula from a PUBLIC repository

```bash
name: Action workflow

on:
 push:
 workflow_dispatch:

jobs:
  action_job:
    runs-on: ubuntu-latest
    name: Ritchie Action
    steps:
    - name: Run Ritchie Action Command with PUBLIC repository
      uses: GuillaumeFalourd/ritchie-action-java-8@v2.1
      with:
        rit-repo-url: https://github.com/ZupIT/ritchie-formulas-demo
        rit-formula-command: rit demo coffee-java --rit_name=Dennis --rit_coffee_type=espresso --rit_delivery=false
```

**Where:**

- `rit-repo-url` is the Github formula **public** repository url where the formula is located.
- `rit-formula-command` is the formula command (with input flags if needed) implemented in python.

### Executing a formula from a PRIVATE repository

```bash
name: Action workflow

on:
 push:
 workflow_dispatch:

jobs:
  action_job:
    runs-on: ubuntu-latest
    name: Ritchie Action
    steps:
    - name: Run Ritchie Action Command with PRIVATE repository
      uses: GuillaumeFalourd/ritchie-action-java-8@v2.1
      env:
        CREDENTIAL_GITHUB_USERNAME: ${{ secrets.CREDENTIAL_GITHUB_USERNAME }}
        CREDENTIAL_GITHUB_TOKEN: ${{ secrets.CREDENTIAL_GITHUB_TOKEN }}
      with:
        rit-repo-url: https://github.com/GuillaumeFalourd/formulas-training
        rit-formula-command: rit java math sum numbers --number_one=1 --number_two=2
```

**Where:**

- `CREDENTIAL_GITHUB_USERNAME` is the GITHUB USERNAME saved [as a secret](https://docs.github.com/en/actions/reference/encrypted-secrets).
- `CREDENTIAL_GITHUB_TOKEN` is the [GITHUB PERSONAL ACCESS TOKEN](https://github.com/settings/tokens) with full repository access saved [as a secret](https://docs.github.com/en/actions/reference/encrypted-secrets).
- `rit-repo-url` is the Github formula **private** repository url where the formula is located.
- `rit-formula-command` is the formula command (with input flags if needed) implemented in Shell.
