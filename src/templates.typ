// Resume template functions and styling

#let resume(body) = {
  set document(author: "Morgan Watson-Morris", title: "Resume")
  set page(
    margin: (x: 0.5in, y: 0.5in),
    paper: "us-letter",
  )
  set text(font: "Helvetica", size: 10pt)

  body
}

#let header(name, title_exp, email, phone, github) = {
  grid(
    columns: (1fr, 1fr),
    align(left)[
      #text(weight: "bold")[#title_exp]
    ],
    align(right)[
      #email | #phone \
      #link("https://" + github)[#github]
    ],
  )
  v(0.5em)
  align(center)[
    #text(size: 24pt, weight: "bold")[#name]
  ]
  v(0.5em)
}

#let section(title) = {
  v(1em)
  text(size: 14pt, weight: "bold", upper(title))
  v(-0.5em)
  line(length: 100%, stroke: 1pt)
  v(0.5em)
}

#let overview(items, description) = {
  for item in items [
    - #item
  ]
  v(0.5em)
  block[
    #set par(justify: true)
    #description
  ]
}

#let job(title, company, location, date, tools, bullets) = {
  block(breakable: true)[
    #grid(
      columns: (1fr, auto),
      align(left)[#text(weight: "bold")[#title] -- #company], align(right)[#location -- #date],
    )
    #if tools != none [
      #v(0.25em)
      #text(style: "italic")[Tools: #tools]
      #v(0.25em)
    ]
    #for bullet in bullets [
      - #bullet
    ]
  ]
  v(1em)
}
