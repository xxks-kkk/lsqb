# Typed Subgraph Matching Benchmark

A benchmark for subgraph matching but with types information (edge types, mostly).

Inspired by [LDBC SNB](https://arxiv.org/pdf/2001.02299.pdf) and [JOB](https://db.in.tum.de/~leis/papers/lookingglass.pdf).

[Google Doc](https://docs.google.com/document/d/1w1cMNyrOoarG69fmNDr5UV7w_T0O0j-yZ0aYu29iWw8/edit)

## Getting started

### Install dependencies

```bash
scripts/install-dependencies.sh
```

### Generate and preprocess data

Use the [LDBC Datagen](https://github.com/ldbc/ldbc_snb_datagen/) (`dev` branch) and the `CsvBasic` serializer.

Run the following script which preprocesses the example data set files and places the CSVs under `data/social_network_preprocessed`:

```bash
scripts/preprocess.sh
```

To process another data set, e.g. one stored under `data/sf10`, run:

```bash
scripts/preprocess.sh data/sf10
```
### Running databases

To avoid clashing on port `7474`, the Neo4j instance runs with the ports shifted by `+10000`, while the Memgraph instance runs with `+20000`.
#### Load the data

```bash
scripts/load-neo.sh
scripts/load-mem.sh
scripts/load-red.sh
```

```bash
scripts/start-neo.sh
scripts/start-mem.sh
scripts/start-red.sh
```

#### Run the queries

```bash
python3 clients/neo.py
python3 clients/mem.py
python3 clients/red.py
```

## Philosophy

This is designed to be a simple benchmark. We do not provide auditing guidelines - it's the user's responsibility to ensure that the benchmark setup is meaningful.