<!--
-- SPDX-License-Identifier: MIT
--
-- tuxfetch
--
-- Copyright (C) 2025 Farhan Kurnia Pratama
--
-- GitHub     : https://github.com/farhnkrnapratma/tuxfetch
-- Maintainer : Farhan Kurnia Pratama <farhnkrnapratma@gmail.com>
-->
# Changelog

## `v0.1.0`

Release date: Monday, February 17, 2025, 21:00 GMT+7 (`TXF010S20250217T2100000700`)

- Initial release

## `v0.2.0`

Release date: Monday, February 24, 2025, 10:20 GMT+7 (`TXF020S20250224T1020000700`)

- Removed `txos` and `title` from the built-in functions.
- Optimized Makefile to give users more flexible choices.
- Added new flags for the `tuxfetch` command.
- New documentation of Tuxfetch, read `README.md` for details.
- Other improvements, and fixes.

## `v0.2.6`

Release date: Thursday, February 27, 2025, 19:47 GMT+7 (`TXF026S20250227T1947000700`)

- Removed colored output in help, version, and update messages.
- Refactored the tuxer function for creating the default configuration.
- Precomputed system variables (hostname, OS, kernel, time, uptime) to reduce repeated command calls.
- Fixed uptime calculation logic with a sysctl fallback.
- Improved overall code formatting and structure.
- Other improvements, and fixes.

## `v0.2.7`

Release date: Thursday, February 27, 2025, 20:30 GMT+7 (`TXF027S20250227T2030000700`)

- Fixed `update` and `clean-update` flags not working even though there is a new release on GitHub.
- Fixed incorrect metadata information on previous releases