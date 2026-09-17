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
  // Cover
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
    #set text(weight: "medium", size: 14pt)
  ]

  // CUPES credit-system information. No ECTS conversion is asserted because
  // the official curriculum supplied for this document does not establish one.
  page(footer: [#h(1fr)#datetime.today().display()])[
    #align(center)[#text(weight: "bold", size: 18pt)[Credit and Workload Information]]
    #v(1em)
    #set par(justify: true, leading: 0.65em)
    #set text(size: 11pt)

    This document describes selected courses from the *Social Sports Guidance and Management* bachelor's curriculum at *Capital University of Physical Education and Sports (CUPES)*. Course credits and contact hours are reported in the original CUPES system as stated in the official curriculum and the student's academic records.

    #v(1em)
    - Standard programme duration: *4 years*.
    - Minimum graduation requirement: *171 CUPES credits*.
    - Classroom coursework in the curriculum: *147 credits* and *2,998 teaching hours*.
    - Centralized practical components: *24 credits*.
    - Degree awarded upon fulfilment of graduation and degree requirements: *Bachelor of Education*.

    #v(1em)
    No automatic conversion from CUPES credits to ECTS is stated in this document. Where an admissions institution requires an ECTS-equivalent evaluation, the original credits, teaching hours, course content and official academic records should be assessed according to that institution's rules.
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
  grade: none,
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
    ([*Grade*], grade),
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
