#let resume(contact: (), summary: (), links: (), experience: (), doc) = {
  set text(size: 15pt, font: "Montserrat")
  // show regex("\d+"): set text(red)

  // show: body => context {
  //   set document(author: contact.name)
  //   body
  // }

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
    ), text(contact.phone), text(contact.email),
  )

  line(length: 100%)
  set align(left)

  let position = 10pt

  // EXPERIENCE
  for e in experience {
    set text(15pt, tracking: -0.4pt)

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
    set text(12pt)
    text()[
      #e.description

    ]
    text(style: "italic", "Standard Activities:")

    for n in e.notes [
      - #n
    ]

    text(style: "italic", "Technologies Utilizied:")
    text()[- #e.tech.join(", ")]
  }
  // EXPERIENCE

  doc
}

#toml("everything.toml").contact
