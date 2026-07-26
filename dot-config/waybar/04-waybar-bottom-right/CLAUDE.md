# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This repository contains configurations for [Waybar](https://github.com/Alexays/Waybar), a bar for Wayland compositors.

## Key Files & Structure

- `config`: Main Waybar JSON configuration.
- `style.css`: Primary CSS styling for the bar.
- `scripts/active_win_stats.sh`: Shell script used for monitoring active windows in Niri, providing stats (CPU/RAM) for display in Waybar.

## Development Tasks

- **Waybar Configuration**: Changes to the bar layout or module configuration should be made in `config`.
- **Styling**: All CSS adjustments are in `style.css`.
- **Scripting**: When modifying `scripts/active_win_stats.sh`, ensure it remains compatible with the `niri` messaging protocol and outputs valid JSON for Waybar.

## Safety Practices

- **Backup before editing**: Always create a backup copy of a file before modifying it. Use `git checkout -- <file>` to revert, or copy the file to a `.bak` (e.g., `cp <file> <file>.bak`). Commit the backup or stash changes if needed. This ensures you can recover if a change introduces issues.
