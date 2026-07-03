// Resume template functions and styling

#let resume(name: none, title: none, email: none, header: false, footer: false, body) = {
  set document(author: if name == none { () } else { name }, title: "Resume")
  set page(
    margin: (x: 0.5in, y: 0.5in),
    paper: "us-letter",
    // Running header/footer stay ATS-safe: the canonical contact block lives
    // in the body, so these must mirror it (same name/email), never replace it.
    header: context if header and name != none and counter(page).get().first() > 1 [
      #grid(
        columns: (1fr, 1fr, 1fr),
        align(left)[#text(size: 8pt, fill: gray)[#name]],
        align(center)[#text(size: 8pt, fill: gray)[#title]],
        align(right)[#text(size: 8pt, fill: gray)[#email]],
      )
      #line(length: 100%, stroke: 0.5pt + gray)
    ],
    footer: context if footer [
      #set text(size: 8pt, fill: gray)
      #align(center)[#counter(page).display("1 / 1", both: true)]
    ],
  )
  set text(font: "TeX Gyre Heros", style: "normal", weight: 400, size: 10pt)

  body
}

#let header(name, title_exp, email, phone, github) = {
  align(center)[
    #text(size: 18pt, weight: "bold")[#name] \
    #text(size: 10pt, weight: "bold")[#title_exp] \
    #text(size: 9pt)[#email | #phone | #link("https://" + github)[#github]]
  ]
}

#let section(title) = {
  v(0.25em)
  text(size: 11pt, weight: "bold", upper(title))
  v(-0.8em)
  line(length: 100%, stroke: 0.5pt)
  v(0.1em)
}

#let overview(items, description) = {
  if items != none {
    v(0.25em)
    set text(size: 8.5pt)
    grid(
      columns: (1.2fr, 0.9fr, 0.9fr),
      gutter: 0.5em,
      ..items.map(item => [- #item])
    )
  }

  v(0.25em)
  set text(size: 10pt)
  block[
    #set par(justify: true)
    #description
  ]
}

#let job(title, company, location, date, tools, bullets) = {
  block(breakable: false)[
    #grid(
      columns: (1fr, auto),
      align(left)[#text(weight: "bold")[#title] -- #company], align(right)[#text(style: "italic")[#location | #date]],
    )
    #if tools != none [
      #v(-0.5em)
      #text(size: 8pt, style: "italic")[Tools: #tools]
      #v(0.25em)
    ]
    #for bullet in bullets [
      - #bullet
    ]
  ]
  v(0.5em)
}

#let project(title, name, tools, bullets) = {
  block(breakable: false, width: 100%)[
    #text(weight: "bold")[#title]
    #if name != none [
      #text(size: 8pt)[(Project: #name)]
    ]
    #if tools != none [
      \ #text(size: 8pt, style: "italic")[Tools: #tools]
    ]
    #for bullet in bullets [
      - #bullet
    ]
  ]
  v(0.5em)
}

#let education-entry(degree, institution, date) = {
  block(breakable: false)[
    #text(weight: "bold")[#degree] \
    #text(style: "italic")[#institution] | #date
  ]
  v(0.5em)
}
