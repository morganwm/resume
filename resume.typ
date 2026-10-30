#import "src/templates.typ": education-entry, header, job, overview, resume
#import "src/content.typ": (
  education, header-data, overview-description, work-experience,
)

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

#if include-header {
  header(
    name: header-data.name,
    title: header-data.title-exp,
    email: header-data.email,
    phone: header-data.phone,
    github: header-data.github,
  )
}

= Overview
#overview(overview-description)

= Work Experience
#for job-data in work-experience {
  job(..job-data)
}

= Education
#for edu-data in education {
  education-entry(..edu-data)
}
