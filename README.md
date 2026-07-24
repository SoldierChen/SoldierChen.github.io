# Xinyu Chen Academic Website

This repository contains the personal and CLab website at
[soldierchen.github.io](https://soldierchen.github.io/). The site uses Jekyll and is based on the
[al-folio](https://github.com/alshedivat/al-folio) theme.

Most routine updates only require editing YAML, Markdown, or BibTeX. The Liquid templates under
`_includes/` and `_layouts/` control presentation and normally do not need to be changed.

## Content Map

| Content | File or directory |
| --- | --- |
| Profile, biography, research areas, openings, awards | `_data/home.yml` |
| People and group photos | `_data/people.yml` |
| Teaching | `_data/teaching.yml` |
| Academic service | `_data/service.yml` |
| News | `_news/*.md` |
| Publications | `_bibliography/papers.bib` |
| Publication PDFs | `assets/pdf/` |
| Profile, people, and group images | `assets/img/` |
| Site-wide settings and social account IDs | `_config.yml` |

## Local Preview

Install dependencies once:

```bash
bundle install
```

Start the local site:

```bash
bundle exec jekyll serve --disable-disk-cache
```

Open <http://127.0.0.1:4000/>. Do not use `sudo`; it can create root-owned cache files and make
later builds fail.

Before publishing, run:

```bash
bundle exec jekyll build --disable-disk-cache
```

## Add A Person

Edit `_data/people.yml` and add an item under the appropriate `members` list. List order is display
order.

```yaml
- name: Example Student
  initials: ES
  start: 2026/09
  website: https://example.com/          # optional
  education:
    - degree: BS
      institution: Example University
    - degree: MS
      institution: Another University
```

For a co-supervised student, add:

```yaml
co_supervisor:
  name: Prof. Example
  url: https://example.com/
```

The end date defaults to `Present`. To show a former member, add an explicit value:

```yaml
end: 2028/06
```

## Add A Group Photo

Place the image in `assets/img/`, then add it to `photos.items` in `_data/people.yml`. Keep the
newest photo first.

```yaml
- image: 2026-group-photo.jpg
  alt: CLab group photo in September 2026
  caption: New term begins, September 2026
```

Add `crop: top` when the photo needs a higher crop position.

## Add A Course

Add a course under the appropriate school's `courses` list in `_data/teaching.yml`:

```yaml
- institution: The Hong Kong University of Science and Technology (Guangzhou)
  # Optional:
  # role: Instructor
  courses:
    - code: MICS 5760
      title: FPGA-based Custom Computing
      terms:
        - label: Fall 2026
          url: https://example.com/course
        - label: Fall 2025
```

Add `url` only when that term has a course page. Terms without `url` remain plain text.

## Add Academic Service

Add one item to `_data/service.yml`:

```yaml
- role: Technical Program Committee
  detail: MICRO (2027)
```

## Update The Homepage

Edit `_data/home.yml`.

- `profile` controls the left profile card.
- `biography` contains Markdown paragraphs.
- `research.areas` controls the research-area cards.
- `openings` controls recruitment text.
- `awards.items` controls the awards list.

To add a research area:

```yaml
- icon: fa-microchip
  title: Architecture
  points:
    - First research point
    - Another research point
```

## Add News

Create a new Markdown file under `_news/`, for example `_news/announcement_15.md`:

```markdown
---
layout: post
date: 2026-08-01 07:59:00+0800
inline: true
related_posts: false
category: paper
---

Our paper "[Paper Title](/publications/)" has been accepted to **MICRO 2026**.
Congratulations to First Author!
```

Use `category: paper` for publication news. Other useful values are `people`, `award`, and `career`;
they use the general News label on the homepage.

The homepage and News page sort entries by `date`, so the filename does not control display order.

## Add A Publication

Add a BibTeX entry near the top of `_bibliography/papers.bib`:

```bibtex
@inproceedings{Example2026,
  title={Paper Title},
  author={Student†, First and Chen, Xinyu},
  booktitle={IEEE/ACM International Symposium on Microarchitecture (MICRO)},
  year={2026},
  pdf={example.pdf},
  code={https://github.com/example/repository}
}
```

The conference abbreviation shown on the page is read from the parentheses in `booktitle` or
`journal`. Mark advised students with `†` in the family-name field. When the first author has `†`
and Xinyu Chen is the last author, the page automatically adds the corresponding-author `#`.
Put local PDF files in `assets/pdf/`; omit `pdf` or `code` when unavailable.

## Publish

After the local build succeeds, commit and push the changes to GitHub. GitHub Pages will rebuild the
site using the repository workflow.
