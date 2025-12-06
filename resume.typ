#import "src/templates.typ": header, job, overview, resume, section
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
#overview(overview-items, overview-description)

#section("Work Experience")

#for job-data in work-experience [
  #job(
    job-data.title,
    job-data.company,
    job-data.location,
    job-data.date,
    job-data.tools,
    job-data.bullets,
  )
]

#section("Education")

#for edu-data in education [
  #job(
    edu-data.title,
    edu-data.company,
    edu-data.location,
    edu-data.date,
    edu-data.tools,
    edu-data.bullets,
  )
]
