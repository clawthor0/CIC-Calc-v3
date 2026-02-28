# Contributing Guidelines

## Mandatory version bump (required on every update)

Every time any website change is made (UI, copy, logic, styling, calculations, bugfix):

1. **Bump the visible version shown at the bottom of the website** (footer/version text).
2. Use semantic versioning:
   - **Major** `X.0.0` = significant redesign or major feature changes
   - **Minor** `X.Y.0` = normal feature additions/improvements
   - **Patch** `X.Y.Z` = fixes/small tweaks
3. Default workflow:
   - Build/test changes in `dev/index.html`
   - When approved, promote/copy to `main/index.html`
   - Keep version visible in footer and bump on every update
4. Include the version bump in the same commit as the change.

## Pull request checklist

- [ ] Website change implemented
- [ ] Footer version bumped
- [ ] Version bump follows semver
- [ ] Both folder variants updated as needed (`dev/` for work-in-progress, `main/` for approved)
