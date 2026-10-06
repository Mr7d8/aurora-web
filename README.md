# Orbit Agent Workspace

An interactive prototype of an AI workspace where a small team of agents (Atlas, Scout, Sage, Pixel, Quill and Forge) plan, research, design, code and deploy a landing page together.

It's built like an IDE:
- **Home.** A playful Atlas greets you, with the team orbiting around it.
- **Center.** A tabbed workspace with the task plan and execution log, chat, code and research.
- **Bottom.** A terminal panel.
- **Right.** An agent inspector.
- **Overlays.** The command palette, menus, agent card and dialogs use a glass material.

## What to try

- **Home:** Atlas follows your cursor, reacts when you hover or click it, and routes whatever you type to the right agent.
- **Command palette:** press `⌘K` (or `Ctrl K`).
- **Scenes:** the status bar menu replays individual interactions: handoffs, blocked state, streaming replies, task assignment.
- **Blocked:** the main run pauses twice. Click **Resolve** for Forge's missing deploy token.
- **Approve:** click **Approve** for Quill's headline.
- **Reduced motion:** toggle it in the status bar, or follow your system setting.

## Project layout

| Path | What it is |
| --- | --- |
| `src/workspace.html` | The source. HTML, CSS and JS in one file, with no document skeleton. |
| `build.sh` | Wraps the source into a standalone `index.html`. |
| `index.html` | The built page that gets deployed. |

To rebuild after editing the source:

```sh
sh build.sh
```

The site is fully static. There's no install step and no build step on the host, and every animation runs on plain CSS and `requestAnimationFrame`.
# orbit-agents
