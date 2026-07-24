# Xinyu Chen Academic Website

This repository contains the bilingual personal and CLab website at
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

English and Chinese text are stored together using `en` and `zh` fields. Do not create separate
HTML blocks for the two languages.

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

The end date defaults to `Present` or `至今`. To show a former member, add an explicit value:

```yaml
end: 2028/06
```

## Add A Group Photo

Place the image in `assets/img/`, then add it to `photos.items` in `_data/people.yml`. Keep the
newest photo first.

```yaml
- image: 2026-group-photo.jpg
  alt:
    en: CLab group photo in September 2026
    zh: CLab 2026 年 9 月团队合影
  caption:
    en: New term begins, September 2026
    zh: 新学期开始，2026 年 9 月
```

Add `crop: top` when the photo needs a higher crop position.

## Add A Course

Add a course under the appropriate school's `courses` list in `_data/teaching.yml`:

```yaml
- institution: The Hong Kong University of Science and Technology (Guangzhou)
  # Optional:
  # role:
  #   en: Instructor
  #   zh: 授课教师
  courses:
    - code: MICS 5760
      title: FPGA-based Custom Computing
      terms:
        - label:
            en: Fall 2026
            zh: 2026 年秋季
          url: https://example.com/course
        - label:
            en: Fall 2025
            zh: 2025 年秋季
```

Add `url` only when that term has a course page. Terms without `url` remain plain text.

## Add Academic Service

Add one item to `_data/service.yml`:

```yaml
- role:
    en: Technical Program Committee
    zh: 技术程序委员会委员
  detail:
    en: MICRO (2027)
    zh: MICRO（2027）
```

## Update The Homepage

Edit `_data/home.yml`.

- `profile` controls the left profile card.
- `biography` contains Markdown paragraphs for both languages.
- `research.areas` controls the bilingual research-area cards.
- `openings` controls recruitment text.
- `awards.items` controls the awards list.

To add a research area:

```yaml
- icon: fa-microchip
  title:
    en: Architecture
    zh: 体系结构
  points:
    - en: English research point
      zh: 中文研究点
    - en: Another English research point
      zh: 另一个中文研究点
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
zh: >-
  论文 “[Paper Title](/zh/publications/)” 被 MICRO 2026 接收。祝贺 First Author！
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
