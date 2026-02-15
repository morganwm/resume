// Resume template functions and styling

#let resume(body) = {
  set document(author: "Morgan Watson-Morris", title: "Resume")
  set page(
    margin: (x: 0.5in, y: 0.5in),
    paper: "us-letter",
  )
  set text(font: ("TeXGyreHeros", "TeX Gyre Heros"), style: "normal", weight: 400, size: 10pt)

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
  block(breakable: true)[
    #grid(
      columns: (1fr, auto),
      align(left)[#text(weight: "bold")[#title] -- #company], align(right)[#text(style: "italic")[#location -- #date]],
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

#let project(title, tools, bullets) = {
  block(breakable: true, width: 100%)[
    #text(weight: "bold")[#title]
    #if tools != none [
      \ #text(size: 8pt, style: "italic")[Tools: #tools]
    ]
    #for bullet in bullets [
      - #bullet
    ]
  ]
  v(0.5em)
}

#let education-entry(degree, institution, location, date, details) = {
  block(breakable: false)[
    #grid(
      columns: (1fr, auto),
      align(left)[#text(weight: "bold")[#degree]], align(right)[#text(style: "italic")[#location -- #date]],
    )
    #text(style: "italic")[#institution]
    #if details != none [
      #for detail in details [
        - #detail
      ]
    ]
  ]
  v(0.5em)
}
