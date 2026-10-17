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

Use Ruby 3.2, Bundler 2.5.7, and ImageMagick (as in the reference repository):

```sh
bundle install
bundle exec jekyll serve
```

Open `http://localhost:4000/`. The included build-only GitHub Actions workflow can validate the Jekyll site and save a preview artifact; it does not deploy. This is a local comparison branch and has not been pushed or published.

### Windows preview

Ruby+DevKit 3.2.11 is installed for the current user in `%USERPROFILE%\Ruby32-x64`, together with Bundler 2.5.7 and ImageMagick 7.1.2-18. The gems are installed in the ignored `vendor/bundle` directory, with local Bundler settings in `.bundle/config`.

From PowerShell in this repository, start the actual Jekyll preview with:

```powershell
.\scripts\preview.ps1
```

The script adds Ruby and its ImageMagick directory to the process PATH and serves the site at `http://127.0.0.1:4000/`. Use `-Port 4001` to choose another port. Press Ctrl+C to stop it. A one-off production build can be run from a new Ruby-enabled terminal with Node.js available:

```powershell
$env:JEKYLL_ENV = 'production'
ridk exec bundle exec jekyll build --trace
```

The Gemfile skips MiniRacer on native Windows, includes Windows timezone data, and avoids eagerly loading unused Unicode tables. Sass compresses the generated stylesheet; the redundant CSS minifier pass is disabled because it stalls on the theme's large stylesheet.

## Verification in this workspace

The full production Jekyll build succeeds with Jekyll 4.3.4 and generates the stylesheet, responsive portrait images, bibliography, news, CV, teaching, projects, and research map. All eight main preview routes return HTTP 200, all internal page and asset paths resolve, and the generated publications page contains all 10 published entries. YAML configuration, front matter, BibTeX, and the adapted visualization JavaScript were also validated. The running preview serves Jekyll's generated output from `_site`.
