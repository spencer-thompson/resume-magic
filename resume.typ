#let resume(
  contact: (), summary: (), links: (), experience: (), projects: (), education: (), doc,
) = {
  set text(size: 15pt, font: "Montserrat")
  set par(leading: 0.6em, spacing: 1em)

  set page(
    paper: "a4", margin: (left: 12mm, right: 12mm, top: 8mm, bottom: 8mm), footer-descent: 0pt,
  )

  set heading(numbering: none, outlined: false)
  set align(center)
  text(
    28pt, fill: navy, weight: "light", tracking: 1pt, smallcaps(contact.first) + " ",
  )
  text(
    28pt, weight: "semibold", tracking: 1pt, smallcaps(contact.last) + "\n",
  )

  text(
    15pt, fill: navy, top-edge: "ascender", bottom-edge: "descender", smallcaps(summary.title.join(" | ")),
  )

  text("\n")
  set text(size: 10pt, font: "JetBrains Mono")
  // text(14pt, contact.phone + " | " + contact.email)
  let links_count = links.len()
  let ncols = links_count + 2

  grid(
    columns: ncols, gutter: 15pt, ..links.map(
      links => [
        #text(15pt, fill: navy, baseline: 2pt, top-edge: "baseline")[#links.icon]
        #text(navy, link(links.url)[#links.username])
      ],
    ), text(contact.phone), text(navy, link("mailto:" + contact.email)[#contact.email]),
  )

  line(length: 100%)

  v(-0.8em)
  text(
    20pt, smallcaps("Experience"), tracking: 1pt, weight: "semibold", fill: navy, font: "Montserrat",
  )
  v(-0.8em)
  set align(left)

  let position = 10pt

  set text(14pt, tracking: -0.4pt)

  // EXPERIENCE
  for e in experience {
    let enddate = none
    if type(e.end) != datetime {
      enddate = datetime.today()
    } else { enddate = e.end }

    grid(
      columns: (3fr, 2fr), align: (left, right), stroke: none, [
        #text(fill: olive, weight: "extrabold", baseline: position, e.company)
        #text(baseline: position, "")
        #text(weight: "regular", baseline: position, e.title)
      ], text(
        11pt, font: "JetBrains Mono", baseline: position + 4pt, fill: gray, e.location + "  " + upper(e.start.display("[month repr:short] [year]")) + " - " + upper(enddate.display("[month repr:short] [year]")),
      ),
    )

    line(length: 100%, stroke: silver)
    set text(11pt)
    text()[
      #e.description

    ]
    text(style: "italic", "Standard Activities:")

    for n in e.notes [
      - #n
    ]

    text(style: "italic", "Technologies Utilizied:")
    text()[- #e.tech.join(", ")]

    v(-0.5em)
  }
  // EXPERIENCE

  v(0.5em)
  // PROJECTS
  line(length: 100%, stroke: silver)
  set align(center)
  text(
    20pt, smallcaps("Projects"), tracking: 1pt, weight: "semibold", fill: navy, font: "Montserrat",
  )
  v(-0.8em)
  set align(left)

  for p in projects {
    grid(
      columns: (3fr, 2fr), align: (left, right), stroke: none, [
        #text(fill: olive, weight: "extrabold", baseline: position, p.name)
        // #text(baseline: position, "")
        // #text(weight: "regular", baseline: position, e.title)
      ], text(
        11pt, font: "JetBrains Mono", baseline: position + 4pt, fill: gray, p.link,
      ),
    )

    line(length: 100%, stroke: silver)
    set text(11pt)
    text()[
      #p.description

    ]
    // text(style: "italic", "Standard Activities:")

    for n in p.notes [
      - #n
    ]
  }

  // PROJECTS

  // line(length: 100%, stroke: silver)
  set text(14pt, tracking: -0.4pt)

  set align(center)
  // v(-8pt)
  text(
    20pt, smallcaps("Education"), tracking: 1pt, weight: "semibold", fill: navy, font: "Montserrat",
  )
  v(-0.8em)
  set align(left)

  // EDUCATION
  for e in education {
    let enddate = none
    if type(e.end) != datetime {
      enddate = datetime.today()
    } else { enddate = e.end }

    grid(
      columns: (4fr, 1fr), align: (left, right), stroke: none, [
        #text(fill: olive, weight: "extrabold", baseline: position, e.school)
        #text(baseline: position, "")
        #text(weight: "regular", baseline: position, e.degree)
      ], text(
        11pt, font: "JetBrains Mono", baseline: position + 4pt, fill: gray, e.location,
      ),
    )

    line(length: 100%, stroke: silver)
    align(
      center, text(
        12pt, fill: gray, baseline: -position + 2pt, upper(e.start.display("[month repr:short] [year]")) + " - " + upper(enddate.display("[month repr:short] [year]")),
      ),
    )
    v(-1em)

    for n in e.notes {
      text(11pt)[
        - #n
      ]
    }
  }
  // EDUCATION

  doc
}

#toml("everything.toml").contact
