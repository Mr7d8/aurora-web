# Agents OS

An interactive prototype of an AI workspace where a team of agents runs a daily pulse on the business: web and app performance, KPIs, search rankings and brand.

## The team

| Agent | Role | Duties | Will connect to |
| --- | --- | --- | --- |
| **Orc** | Orchestrator | Runs the daily pulse, routes your requests, flags what needs you | Slack |
| **Atlas** | AI Studio Brain | Brand and product context; creative system (guidelines, templates, assets); prompt library | Google Drive |
| **Nova** | Web & app performance | Tracks visuals, banners and products on web and app; reports best practices; proposes banner changes and product positions | Odoo, Google Analytics |
| **Kai** | Performance manager | Business KPIs and targets; growth tracking; reporting and insights | Odoo, Google Analytics, Google Sheets |
| **Dex** | SEO & GEO | Search rankings and keywords; visibility in AI answers (ChatGPT and others) | Google Search Console, AI answer tracking |
| **Agent #6** | To be defined | A seat with no role yet. It can't take tasks until it gets one. | None yet |

No platform is connected yet, so every run uses sample data. Each agent's card shows its duties and connections, and **Settings › Connections** lists every platform with a Connect button that's a placeholder for now.

## It's built like an IDE

- **Home.** Orc greets you, with the team orbiting around it.
- **Center.** A tabbed workspace with the task plan and execution log, chat, `homepage.json` and the daily pulse report.
- **Bottom.** The agent console, where commands and connector calls show up.
- **Right.** An agent inspector, plus a Context tab with the task, files and connections.
- **Overlays.** The command palette, menus, agent card and dialogs use a glass material.

## What to try

- **Daily pulse:** the run starts on load. Nova audits the site and app, Kai checks yesterday's KPIs, Dex checks rankings and AI answers, Atlas makes a banner, and Orc writes the pulse.
- **Blocked:** Kai stops because Odoo isn't connected. Click **Resolve** and choose sample data. Dex waits on the same choice for Search Console.
- **Approve:** click **Approve** to publish Nova's homepage changes. If nobody answers either one within 20 seconds, the run resolves it and carries on.
- **Home:** type a request and Orc routes it: KPIs go to Kai, rankings to Dex, banners and brand to Atlas, web and app to Nova.
- **Command palette:** press `⌘K` (or `Ctrl K`).
- **Scenes:** the status bar menu replays individual interactions: handoffs, blocked state, streaming replies, task assignment.
- **Theme:** switch light and dark from the top bar, or pick Light, Dark or System in Settings. The choice is saved in your browser.
- **Reduced motion:** toggle it in the status bar, or follow your system setting.

## Changing the team

Everything lives in `src/workspace.html`:

- `AGENTS`: each agent's name, role, duties, model, tools and colour. Give Agent #6 a name, role and duties here, and remove `placeholder:true` so it can take tasks.
- `CONNECTIONS`: the platforms and which agents use them.
- `routeAgent`: the keywords Orc uses to route requests typed on Home.

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
