# Notes for Claude

- Push straight to `main`. Don't push other branches or open pull requests: Vercel is on the free plan, and every branch push starts a preview build. Batch related changes into one push.
- The app is one file, `src/workspace.html`. Check changes with `sh build.sh` and open `dist/index.html` (light and dark, desktop and phone width).
- Write for the marketing team: plain sentences in the interface, no file names, commands or exit codes outside the agent console.
- Never use em dashes in copy, comments or commit messages.
