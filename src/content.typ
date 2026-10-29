// Resume content data

#let job-title = "Software Engineer"

#let header-data = (
  name: "Morgan Watson-Morris",
  title: job-title,
  title_exp: job-title + " | 10 Years Professional Experience",
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
  panic("Unknown company '" + company + "'; expected one of: " + overviews.keys().join(", "))
}

#let sde = (
  title: "ML & Rule-Based Decisioning Engine",
  name: "SDE",
  bullets: (
    "Co-architected a decisioning engine combining real-time ML scoring with rule-based business logic",
    "Partnered with stakeholders to codify complex business rules into standardized, strongly typed schemas",
    "Spearheaded an audit logging and configuration management system for versioned, traceable rule deployments",
    "Compiled the engine to WebAssembly (WASM) to enable live, in-browser testing and debugging of rule configurations",
    "Integrated GenAI tooling to help simplify rules, business logic, and observability insights for users",
  ),
)

#let bear = (
  title: "Distributed Data Ingestion & Edge Systems",
  name: "Bear",
  bullets: (
    "Designed and implemented lightweight Go daemon deployed to secure manufacturing sites for high-volume data extraction",
    "Architected fault-tolerant edge coordination handling network partitions, retries, and state recovery across distributed nodes",
    "Scaled ingestion pipeline to collect multiple terabytes of manufacturing compliance and research data",
    "Designed IAM credential vending model with AWS to enforce dynamic S3 access controls",
    "Built CI/CD and packaging pipelines for deployment to isolated environments",
  ),
)

#let ipa-ray = (
  title: "Distributed ML Compute & Ray Platform",
  name: "IPA",
  bullets: (
    "Built a Python SDK abstracting Ray cluster provisioning and job execution for distributed data analysis",
    "Integrated Ray datasets with custom Iceberg/S3 indexing to enable selective, predicate-pushed reads at scale",
    "Partnered with ML researchers to migrate single-node workloads to distributed Ray clusters",
  ),
)

#let insight-lab = (
  title: "Large-Scale Analytics & Lakehouse Architecture",
  name: "Insight Lab",
  bullets: (
    "Co-led implementation of Iceberg-based data lakehouse for manufacturing analytics at scale",
    "Optimized EKS bin-packing and autoscaling policies to significantly reduce idle compute costs",
    "Developed custom indexing strategies using Rust/Polars for accelerated lookups",
    "Established cross-team SLOs, query performance benchmarks, and observability standards",
  ),
)

#let argus = (
  title: "Real-Time ML & Inference Infrastructure",
  name: "Argus",
  bullets: (
    "Architected real-time ML pipeline capable of executing arbitrary containerized models",
    "Built ELT pipelines for structured aggregation of manufacturing telemetry",
    "Designed HA monitoring stack (Prometheus, Grafana, Splunk)",
    "Developed cross-language S3 client-side encryption libraries for secure service-to-service data exchange",
  ),
)

#let apple-sds = (
  title: "Software Engineer",
  company: "Apple (Strategic Data Solutions - Physical Goods)",
  location: "Seattle, Washington",
  date: "October 2025 - Present",
  tools: "Python (uv), Cassandra/Custom Platform Tools, Containers, Iceberg, Snowflake",
  projects: (
    sde,
  ),
)

#let apple-insight = (
  title: "Software Engineer",
  company: "Apple (Manufacturing Data Insight)",
  location: "Austin, Texas",
  date: "May 2019 - October 2025",
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
    "Tech lead for the ecommerce team; architected a serverless AWS checkout and billing platform supporting $1M+ in quarterly pipeline",
    "Designed and built a centralized identity server with MFA and automated email domain verification",
    "Built a multi-tenant enterprise SaaS account and subscription management platform",
  ),
)

#let axial = (
  title: "Full-Stack Software Developer",
  company: "Axial Commerce",
  location: "Austin, Texas",
  date: "October 2017 - May 2018",
  tools: "C# Dotnet Core, React, Azure Pipelines",
  bullets: (
    "Built and maintained full-stack ecommerce web applications and REST APIs using C# .NET Core and React on Azure",
    "Automated end-to-end CI/CD release pipelines across web, API, iOS App Store, and Google Play",
  ),
)

#let dow = (
  title: "Robotics Development Engineer",
  company: "The Dow Chemical Company",
  location: "Midland, Michigan",
  date: "December 2015 - October 2017",
  bullets: (
    "Developed C#/.NET control software to orchestrate robotic arms and laboratory automation hardware",
    "Wrote a custom database access layer for handling large, runtime-modified SQL tables from multiple systems",
    "Built automated TFS/VSTS CI/CD pipelines for reliable deployment to physical robotic workcells",
  ),
)

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
