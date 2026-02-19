#import "src/templates.typ": education-entry, header, job, overview, project, resume, section
#import "src/content.typ": education, header-data, overview-description, overview-items, work-experience

#show: resume

#header(
  header-data.name,
  header-data.title_exp,
  header-data.email,
  header-data.phone,
  header-data.github,
)

#section("Overview")
// #overview(overview-items, overview-description)
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
