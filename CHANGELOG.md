# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [v4.0.1] - 2026-08-21
### :bug: Bug Fixes
- [`63bdf11`](https://github.com/terraform-az-modules/terraform-azurerm-acr/commit/63bdf112d8df86ba7ec7876de1f5eae066c3512c) - update acr module geo replication configuration *(PR [#69](https://github.com/terraform-az-modules/terraform-azurerm-acr/pull/69) by [@asharma-cd](https://github.com/asharma-cd))*


## [v4.0.0] - 2026-05-08
### :bug: Bug Fixes
- [`299ce40`](https://github.com/terraform-az-modules/terraform-azurerm-acr/commit/299ce406e466e967ca2144b0276db0fb9f5be928) - added the github token  *(PR [#61](https://github.com/terraform-az-modules/terraform-azurerm-acr/pull/61) by [@karantolambiya-cd](https://github.com/karantolambiya-cd))*
- [`6b552bb`](https://github.com/terraform-az-modules/terraform-azurerm-acr/commit/6b552bb122c42b69c929f387b4046b5d0b6add8c) - disabled quarantine policy for acr *(PR [#66](https://github.com/terraform-az-modules/terraform-azurerm-acr/pull/66) by [@maharshi-cd](https://github.com/maharshi-cd))*


## [1.1.1] - 2026-03-20

### Changes
- Add provider_meta for API usage tracking
- Add terraform tests and pre-commit CI workflow
- Add SECURITY.md, CONTRIBUTING.md, .releaserc.json
- Standardize pre-commit to antonbabenko v1.105.0
- Set provider: none in tf-checks for validate-only CI
- Bump required_version to >= 1.10.0
[v4.0.0]: https://github.com/terraform-az-modules/terraform-azurerm-acr/compare/v3.0.0...v4.0.0
[v4.0.1]: https://github.com/terraform-az-modules/terraform-azurerm-acr/compare/v4.0.0...v4.0.1
