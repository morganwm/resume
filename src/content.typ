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

#let overview-description = [
  Senior Software Engineer specializing in large-scale data platforms, distributed systems, and ML infrastructure. 10+ years building high-throughput ingestion pipelines, analytics platforms, and real-time inference systems in AWS and Kubernetes environments. Strong cross-functional partner experienced in translating ambiguous manufacturing and research requirements into resilient, production-grade systems.
]

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
    "Technical Lead for Ecommerce Team",
    "Designed and Led Development on Identity Server with integrated MFA and email Domain verification",
    "Designed and developed an Enterprise grade (over $1 Million in pipeline per quarter) serverless Ecommerce Platform for SaaS hosted in AWS",
    "Designed and developed an Account Management platform for Enterprise SaaS applications.",
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
    "Automated CI/CD pipelines for the website/API and apps to the Google Play Store and Apple App Store",
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
    "Set up and Maintained automated CI/CD pipelines through TFS and VSTS for quickly and easily deploying code to robotic systems",
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
    institution: "The University of Texas as Austin",
    date: "2015",
  ),
)
