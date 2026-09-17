#let template(
  university: none,
  major: none,
  school: none,
  name: none,
  id: none,
  cover: none,
  watermark: none,
  doc,
) = {
  page()[
    #align(center)[
      #image(cover.logo_path, width: cover.logo_width*50%)
      #if not cover.logo_with_university_name {
        text(weight: "semibold", size: 24pt)[#university]
        v(1fr)
      }
      #text(weight: "bold", size: 30pt)[#university]
      #text(weight: "bold", size: 30pt, "Course Description")
      #v(2fr)
      #text(weight: "semibold", size: 16pt)[#major]
      #v(5fr)
      #text(size: 16pt)[Name: #name]
      #parbreak()
      #text(size: 16pt)[Student No.: #id]
    ]
    #v(3fr)
  ]

  page(footer: [#h(1fr)#datetime.today().display()])[
    #align(center)[#text(weight: "bold", size: 18pt)[Credit and Workload Information]]
    #v(1em)
    #set par(justify: true, leading: 0.65em)
    #set text(size: 11pt)

    This document describes selected courses completed in the *Social Sports Guidance and Management* bachelor's programme at *Capital University of Physical Education and Sports (CUPES)*. Original CUPES credits and course hours are reported together with an ECTS-equivalent value used for this application document.

    #v(1em)
    - Standard programme duration: *4 years*.
    - Minimum graduation requirement: *171 CUPES credits*.
    - Classroom coursework in the curriculum: *147 credits* and *2,998 teaching hours*.
    - Centralized practical components: *24 credits*.
    - Degree: *Bachelor of Education*.
    - ECTS-equivalent calculation used in this document: *1 CUPES credit = 1.5 ECTS*.

    #v(1em)
    The ECTS-equivalent figures are provided as a consistent application-document conversion. Original CUPES credits and course hours remain displayed so that admissions institutions can conduct their own equivalency assessment where required.
  ]

  set page(
    header: [Course Description - #name #h(1fr) #university],
    footer: context [#counter(page).display("1 / 1", both: true) #h(1fr) #datetime.today().display()],
  )

  page(footer: [#h(1fr)#datetime.today().display()])[
    #outline(title: "Table of Contents", indent: 2em)
  ]

  counter(page).update(1)
  set par(justify: true)
  set heading(numbering: "1.1.")
  doc
}

#let course(
  name: none,
  id: none,
  semester: none,
  credit: none,
  ects: none,
  hours: none,
  preparatory: none,
  prerequisite: none,
  content: none,
  description: none,
  assessment: none,
) = {
  heading(depth: 2)[#name]
  let cells = (
    ([*Course Title*], name),
    ([*Course No.*], id),
    ([*Semester*], semester),
    ([*CUPES Credit*], credit),
    ([*ECTS Equivalent*], ects),
    ([*Course Hours*], hours),
    ([*Preparatory Course(s)*], preparatory),
    ([*Prerequisite(s)*], prerequisite),
    ([*Content*], content),
    ([*Course Description*], description),
    ([*Assessment*], assessment),
  )
  let table_args = ()
  for row in cells {
    if row.at(1) != none {
      table_args.push(row.at(0))
      table_args.push(row.at(1))
    }
  }
  table(columns: (auto, 1fr), ..table_args)
}
