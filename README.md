# Agents OS

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
- **Approve:** click **Approve** for Quill's headline. If nobody answers either one within 20 seconds, the run resolves it and carries on.
- **Theme:** switch light and dark from the top bar, or pick Light, Dark or System in Settings. The choice is saved in your browser.
- **Reduced motion:** toggle it in the status bar, or follow your system setting.

## Project layout

| Path | What it is |
| --- | --- |
| `src/workspace.html` | The source. HTML, CSS and JS in one file, with no document skeleton. |
| `build.sh` | Wraps the source into a standalone `dist/index.html`. |
| `vercel.json` | Tells Vercel to run `build.sh` and serve `dist/`. |

Edit `src/workspace.html` and push. Vercel builds the page on every deploy, so the built file isn't committed.

To preview locally, build and open the result:

```sh
sh build.sh && open dist/index.html
```

The site is fully static. There's no install step, and every animation runs on plain CSS and `requestAnimationFrame`.
