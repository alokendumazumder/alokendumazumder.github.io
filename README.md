# Alokendu Mazumder — reference theme preview

This branch copies the customized al-folio layouts, Sass, JavaScript, and build configuration from [backpropagator/backpropagator.github.io](https://github.com/backpropagator/backpropagator.github.io), commit `a2213b9858bee7812a33a893442466e08b723fba`, and replaces the personal content with the Alokendu Mazumder homepage from the original `master` branch. The upstream MIT license is retained in `LICENSE`.

## Content

- `_pages/about.md`: biography, current role, portrait, and contact details.
- `_bibliography/papers.bib`: 10 published papers, including the 2026 TMLR papers.
- `_data/research_in_progress.yml`: two distinct draft / under-review works. The repeated TD paper in the old draft section was already accepted and is listed once among the publications.
- `_news/`: all 11 news items. The original dates only specified months, so dates display at month precision.
- `_data/cv.yml`: education, experience, awards, and skills.
- `_pages/teaching.md`: both courses and all six teaching sessions.
- `_projects/`: the four code repositories linked on the original homepage.
- `assets/json/coauthors.json`: collaborators from the publication author lists.

The old site's stale Zeeshan Khan template files and the reference author's personal posts, photo, publications, analytics IDs, quote, social accounts, and CV have been omitted. No publication images were supplied on the current homepage, so the reference's venue badges are kept without unrelated thumbnails. The blog navigation item is omitted because the current site has no blog posts.

The old PDF link (`/cv/alokendu_resume_CV.pdf`) returned HTTP 404 and no corresponding PDF exists in the repository. The CV page shows the available content without a broken download button. Add your actual PDF under `assets/pdf/` and set `cv_pdf` in `_pages/cv.md` to enable it.

## Full Jekyll build

Use Ruby 3.2, Bundler, and ImageMagick (as in the reference repository):

```sh
bundle install
bundle exec jekyll serve
```

Open `http://localhost:4000/`. The included build-only GitHub Actions workflow can validate the Jekyll site and save a preview artifact; it does not deploy. This is a local comparison branch and has not been pushed or published.

## Verification in this workspace

YAML configuration, page front matter, and all 10 BibTeX entries were parsed successfully. The adapted research and collaborator JavaScript passes syntax checks. A separate static comparison preview uses the reference site's compiled CSS and the migrated content; its eight routes and internal assets were checked, along with light/dark mode, search, navigation, and both research visualizations. Ruby is unavailable in this Windows workspace, so the full Jekyll build has not been run here.
