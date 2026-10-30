// Resume content data

#let job-title = "Software Engineer"

#let header-data = (
  name: "Morgan Watson-Morris",
  title: job-title,
  title-exp: job-title + " | 10 Years Professional Experience",
  email: "morgan@morganw.com",
  phone: "(989) 430-8935",
  github: "github.com/morganwm",
)

// Company-specific overview paragraphs. Select at compile time with:
//   typst compile resume.typ --input company=<key>
// No --input flag (or company=base) produces the generic resume.
#let overviews = (
  base: [
    Senior Software Engineer specializing in large-scale data platforms, distributed systems, and ML infrastructure. 10+ years building high-throughput ingestion pipelines, analytics platforms, and real-time inference systems in AWS and Kubernetes environments. Strong cross-functional partner experienced in translating ambiguous manufacturing and research requirements into resilient, production-grade systems.
  ],
  temporal: [
    Senior Software Engineer specializing in distributed systems, fault-tolerant infrastructure, and developer platforms. 10+ years building high-throughput Go-based coordination and ingestion systems, multi-tenant AWS/Kubernetes services, and HA monitoring stacks. Deep operational focus: designing systems that stay correct and recoverable under real-world failure, and building the tooling that lets other engineers ship reliably.
  ],
  chainguard: [
    Senior Software Engineer specializing in secure cloud-native infrastructure, build and packaging pipelines, and platform engineering. 10+ years shipping Go and Python systems to AWS and Kubernetes, including CI/CD and packaging pipelines for isolated, security-sensitive environments and IAM credential-vending models enforcing least-privilege access. Strong track record driving toolchain and infrastructure failures to root cause in production.
  ],
  overland: [
    Senior Software Engineer specializing in real-time ML infrastructure, edge systems, and sensor data platforms, with roots in industrial robotics. 10+ years building fault-tolerant edge daemons, real-time inference pipelines for arbitrary containerized models, and large-scale telemetry ingestion in AWS/Kubernetes. Began career developing control software for robotic systems; deeply comfortable where software meets hardware in the field.
  ],
  gable: [
    Senior Software Engineer specializing in data platforms, schema quality at scale, and the boundary between producers and consumers. 10+ years building ingestion pipelines, Iceberg-based lakehouse architecture, and analytics infrastructure in AWS/Kubernetes, including compliance-grade collection where schema correctness and ownership are non-negotiable. Experienced partner to both the engineers generating telemetry and the researchers consuming it.
  ],
  stoke: [
    Senior Software Engineer specializing in manufacturing and test data systems, analytics platforms, and real-time telemetry, with a mechanical engineering foundation. 10+ years building high-throughput ingestion, lakehouse analytics, and observability stacks (Prometheus, Grafana) in AWS/Kubernetes. Began career in industrial robotics and hardware automation; fluent in both the data and the machines that generate it.
  ],
)

#let company = sys.inputs.at("company", default: "base")

#let overview-description = if company in overviews {
  overviews.at(company)
} else {
  panic(
    "Unknown company '"
      + company
      + "'; expected one of: "
      + overviews.keys().join(", "),
  )
}

// Work experience entries live in src/experience/, one file per role.
// Order on the page is set by the work-experience list below.
#import "experience/apple-sds.typ": apple-sds
#import "experience/apple-insight.typ": apple-insight
#import "experience/social-solutions.typ": social-solutions
#import "experience/axial.typ": axial
#import "experience/dow.typ": dow

#let work-experience = (
  apple-sds,
  apple-insight,
  social-solutions,
  axial,
  dow,
)

#let education = (
  (
    degree: "B.S. Mechanical Engineering",
    institution: "The University of Texas at Austin",
    date: "2015",
  ),
)
