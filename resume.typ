#import "src/templates.typ": education-entry, header, job, overview, project, resume, section
#import "src/content.typ": education, header-data, overview-description, work-experience

#let input-enabled(name) = sys.inputs.at(name, default: "true") != "false"
#let include-header = input-enabled("header")
#let include-footer = input-enabled("footer")

#show: resume.with(
  name: header-data.name,
  title: header-data.title,
  email: header-data.email,
  header: include-header,
  footer: include-footer,
)

#if include-header [
  #header(
    header-data.name,
    header-data.title_exp,
    header-data.email,
    header-data.phone,
    header-data.github,
  )
]

#section("Overview")
#overview(none, overview-description)

#section("Work Experience")

#for job-data in work-experience [
  #job(
    job-data.at("title", default: ""),
    job-data.company,
    job-data.location,
    job-data.date,
    job-data.at("tools", default: none),
    job-data.at("bullets", default: ()),
  )
  #if "projects" in job-data [
    #for project-data in job-data.projects [
      #project(
        project-data.title,
        project-data.at("name", default: none),
        project-data.at("tools", default: none),
        project-data.at("bullets", default: ()),
      )
    ]
  ]
]

#section("Education")

#for edu-data in education [
  #education-entry(
    edu-data.degree,
    edu-data.institution,
    edu-data.date,
  )
]
