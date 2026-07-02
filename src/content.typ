// Resume content data

#let header-data = (
  name: "Morgan Watson-Morris",
  title_exp: "Software Engineer | 10 Years Professional Experience",
  email: "morgan@morganw.com",
  phone: "(989) 430-8935",
  github: "github.com/morganwm",
)

#let overview-items = (
  "6+ Years at Apple: Infrastructure/Services on Manufacturing data (Current Job)",
  "2 Years at Startups: Application/Services",
  "2 Years at Dow Chemical: Robotics/Automation",
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
    Senior Software Engineer specializing in data platforms, data quality at scale, and the boundary between data producers and consumers. 10+ years building ingestion pipelines, Iceberg-based lakehouse architecture, and analytics infrastructure in AWS/Kubernetes, including compliance-grade data collection where schema correctness and ownership are non-negotiable. Experienced partner to both the engineers producing data and the researchers consuming it.
  ],
  stoke: [
    Senior Software Engineer specializing in manufacturing and test data systems, analytics platforms, and real-time telemetry, with a mechanical engineering foundation. 10+ years building high-throughput ingestion, lakehouse analytics, and monitoring and visualization stacks (Prometheus, Grafana) in AWS/Kubernetes. Began career in industrial robotics and hardware automation; fluent in both the data and the machines that generate it.
  ],
)

#let company = sys.inputs.at("company", default: "base")

#let overview-description = if company in overviews {
  overviews.at(company)
} else {
  panic("Unknown company '" + company + "'; expected one of: " + overviews.keys().join(", "))
}

#let bear = (
  title: "Distributed Data Ingestion & Edge Systems",
  bullets: (
    "Designed and implemented lightweight Go daemon deployed to secure manufacturing sites for high-volume data extraction",
    "Architected fault-tolerant coordination system for distributed edge nodes",
    "Delivered MVP collecting multiple terabytes of compliance and research data",
    "Designed IAM credential vending model with AWS to enforce dynamic S3 access controls",
    "Built CI/CD and packaging pipelines for deployment to isolated environments",
  ),
)

#let ipa-ray = (
  title: "ML Enablement & Ray Platform POC",
  bullets: (
    "Built Python abstractions enabling Ray-based distributed analysis",
    "Integrated Ray with custom search/indexing over Iceberg/S3",
    "Partnered with researchers to migrate workloads onto distributed compute",
  ),
)

#let insight-lab = (
  title: "Large-Scale Analytics & Lakehouse Architecture",
  bullets: (
    "Co-led implementation of Iceberg-based data lakehouse for manufacturing analytics at scale",
    "Optimized Kubernetes node packing with AWS to reduce idle compute costs",
    "Developed custom indexing strategies using Rust/Polars for accelerated lookups",
    "Coordinated cross-team monitoring and performance standards",
  ),
)

#let argus = (
  title: "Highly Available/Scalable Real-Time ML & Inference Infrastructure",
  bullets: (
    "Architected real-time ML pipeline capable of executing arbitrary containerized models",
    "Built ELT pipelines for structured aggregation of manufacturing telemetry",
    "Designed HA monitoring stack (Prometheus, Grafana, Splunk)",
    "Developed internal S3 crypto compatibility libraries",
  ),
)

#let apple = (
  title: "Software Engineer",
  company: "Apple (Manufacturing Data Insight)",
  location: "Austin, Texas",
  date: "May 2019 - Present",
  tools: "Go, Python, Kubernetes, Docker, AWS (EKS, EC2, S3, IAM), Linux Tooling, Kafka, Spark, Iceberg, Ray, Rust, Prometheus, Grafana",
  projects: (
    bear,
    ipa-ray,
    insight-lab,
    argus,
  ),
)

#let social-solutions = (
  title: "Senior Software Engineer",
  company: "Social Solutions Global",
  location: "Austin, Texas",
  date: "May 2018 - May 2019",
  tools: "Node, Docker, GraphQL, React, AWS (Cognito, Lambda, ECS, DynamoDB, CloudFormation, CloudWatch, CloudTrail)",
  bullets: (
    "Technical lead for ecommerce team",
    "Designed and led development on identity server with integrated MFA and email domain verification",
    "Designed and developed an enterprise-grade (over $1 million in pipeline per quarter) serverless ecommerce platform for SaaS, hosted in AWS",
    "Designed and developed an account management platform for enterprise SaaS applications",
  ),
)

#let axial = (
  title: "Full-Stack Software Developer",
  company: "Axial Commerce",
  location: "Austin, Texas",
  date: "October 2017 - May 2018",
  tools: "C# Dotnet Core, React, Azure Pipelines",
  bullets: (
    "Developed and maintained an MVC structured web application with C# .NET Core backend and React.JS frontend, hosted in Azure",
    "Automated CI/CD pipelines for the website/API and apps to the Google Play Store and App Store",
  ),
)

#let dow = (
  title: "Robotics Development Engineer",
  company: "The Dow Chemical Company",
  location: "Midland, Michigan",
  date: "December 2015 - October 2017",
  bullets: (
    "Developed .NET applications in C# to control and coordinate various types of hardware including robotic arms",
    "Wrote a custom database access layer for handling large, runtime-modified SQL tables from multiple systems",
    "Set up and maintained automated CI/CD pipelines through TFS and VSTS for quickly and easily deploying code to robotic systems",
  ),
)

#let work-experience = (
  apple,
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
