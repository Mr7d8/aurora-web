# Wasal Agents

A prototype of Wasal's AI agent team, built like an IDE. Seven agents work on their own, then **report, email and assign tasks** to people:

| Agent | Role | Delivers |
| --- | --- | --- |
| Atlas | Chief of staff | Daily pulse 08:30, readiness reports, task assignments |
| Scout | Market watch | Competitor digest (web, Instagram, Semrush) |
| Sage | Data analyst | Weekly business review, homepage report (lakehouse, certified tables) |
| Pixel | Creative | Homepage banners in French and Arabic, for approval |
| Quill | CRM and copy | Brevo drafts, win-back emails |
| Forge | Marketplace ops | Restock tasks in monday.com, seller reminders |
| Ward | Data quality | 07:00 concordance check |

## What to try

- **The Black Friday run** plays on load: market watch, pace and stock check, banners, teaser email, restocks assigned to account managers, then Atlas writes and emails the report and schedules a daily pulse.
- **Approve** Quill's customer email, or let it time out: it is parked as a draft, never sent.
- **Resolve** Forge's missing monday.com access, or let it time out: Forge emails the account managers instead.
- **Routines, Reports, Outbox, Assigned** show what the agents run and deliver on their own.
- `⌘K` palette, Scenes menu in the status bar, light and dark themes.

All figures are illustrative demo data, not Wasal's real numbers.

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
