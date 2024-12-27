#import "resume.typ": resume
#let data = toml("everything.toml")
#show: doc => resume(
  contact: data.contact, summary: data.summary, links: data.links, experience: data.experience, projects: data.projects, education: data.education, doc,
)
