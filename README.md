# Dating Profile Optimizer - a Claude skill

Turns Claude into a dating-profile coach for Hinge, Bumble, Tinder, The League and similar apps: photo audit and ordering, prompt and bio writing within each app's character limits, settings review, and help keeping conversations going after a match.

## Install

**Claude.ai / Claude desktop app:** Settings → Capabilities → Skills → Upload skill → choose this zip.

**Claude Code:** unzip into `~/.claude/skills/` so you have `~/.claude/skills/dating-profile-optimizer/SKILL.md`.

## Use

Say something like *"Help me optimise my Hinge profile"* and attach a screen recording (or screenshots) of your profile scrolled top to bottom. For best results also record your settings and the app's prompt list.

Claude will ask a few questions at a time, audit what you have, write options for every prompt (with character counts), and check your updated profile when you send a new recording.

## What it won't do
Fake or AI-generated photos, bots/auto-swipers, or invented facts about you. Everything it writes should be true - it flags lines that need checking.

App rules change often; the skill tells Claude to verify current features instead of trusting old blog posts.
