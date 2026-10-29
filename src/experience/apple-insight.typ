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
