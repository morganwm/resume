// Resume template functions and styling

#let muted = gray

#let resume(
  name: none,
  title: none,
  email: none,
  header: false,
  footer: false,
  body,
) = {
  set document(
    author: if name == none { () } else { name },
    title: if name == none { "Resume" } else { name + " – Resume" },
  )
  set page(
    margin: (x: 0.5in, y: 0.5in),
    paper: "us-letter",
    // Running header/footer stay ATS-safe: the canonical contact block lives
    // in the body, so these must mirror it (same name/email), never replace it.
    header: context if (
      header and name != none and counter(page).get().first() > 1
    ) [
      #set text(size: 8pt, fill: muted)
      #grid(
        columns: (1fr, 1fr, 1fr),
        align(left, name), align(center, title), align(right, email),
      )
      #line(length: 100%, stroke: 0.5pt + muted)
    ],
    footer: context if footer [
      #set text(size: 8pt, fill: muted)
      #align(center)[#counter(page).display("1 / 1", both: true)]
    ],
  )
  set text(font: "TeX Gyre Heros", weight: 400, size: 10pt, lang: "en")

  // Sections are real level-1 headings so the PDF gets bookmarks and
  // semantic structure; this rule only controls how they look.
  show heading.where(level: 1): it => block(
    above: 1.3em,
    below: 0.75em,
    width: 100%,
    stroke: (bottom: 0.5pt),
    inset: (bottom: 0.25em),
    text(size: 11pt, weight: "bold", upper(it.body)),
  )

  body
}

#let header(name: none, title: none, email: none, phone: none, github: none) = {
  let contact = (
    link("mailto:" + email, email),
    phone,
    link("https://" + github, github),
  ).filter(it => it != none)

  align(center)[
    #text(size: 18pt, weight: "bold", name) \
    #text(size: 10pt, weight: "bold", title) \
    #text(size: 9pt, contact.join[ | ])
  ]
}

#let overview(description) = block(par(justify: true, description))

// Small italic "Tools: ..." line shown under job and project titles.
#let tools-line(tools) = if tools != none {
  block(above: 0.45em, below: 0.9em, text(
    size: 8pt,
    style: "italic",
  )[Tools: #tools])
}

#let bullet-list(bullets) = if bullets.len() > 0 {
  list(..bullets)
}

#let project(title: none, name: none, tools: none, bullets: ()) = {
  block(breakable: false, width: 100%, below: 1.6em)[
    #text(weight: "bold", title)
    #if name != none [
      #text(size: 8pt)[(Project: #name)]
    ]
    #tools-line(tools)
    #bullet-list(bullets)
  ]
}

#let job(
  title: none,
  company: none,
  location: none,
  date: none,
  tools: none,
  bullets: (),
  projects: (),
) = {
  block(breakable: false, below: 1.6em)[
    #grid(
      columns: (1fr, auto),
      align(left)[
        #if title != none [#text(weight: "bold", title) -- ]#company
      ],
      align(right, text(style: "italic")[#location | #date]),
    )
    #tools-line(tools)
    #bullet-list(bullets)
  ]
  for p in projects {
    project(..p)
  }
}

#let education-entry(degree: none, institution: none, date: none) = {
  block(breakable: false)[
    #text(weight: "bold", degree) \
    #text(style: "italic", institution) | #date
  ]
}
